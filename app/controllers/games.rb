class Games < Application
  before :ensure_authenticated, :exclude => [:index, :show]
  before :build_game, :only => [:new, :create]
  before :find_game, :only => [:show, :edit, :update, :delete, :end_game]
  before :ensure_author_if_game_is_draft, :only => [:show]
  before :ensure_author_if_no_start_time, :only =>[:show]
  before :ensure_master, :only => [:new, :create, :edit, :update, :delete]
  before :max_user_number_from_nz, :only => [:create, :update]

  def index
    unless params[:user_id].blank?
      user = User.find(params[:user_id])
      @games = user.created_games
    else
      @games = Game.non_drafts
    end
    render
  end

  def new
    render
  end

  def create
    if @game.save
      redirect resource(@game)
    else
      render :new
    end
  end

  def show
    @users = []
    @current_game_entries = Hash.new
    GameEntry.of_game(@game).with_status("accepted").each do |entry|
      @users << User.find(entry.user_id)
      @current_game_entries[User.find(entry.user_id).name] = entry
    end
    render
  end

  def edit
    render
  end

  def update
    if @game.update_attributes(params[:game])
      redirect resource(@game)
    else
      render :edit
    end
  end

  def delete
    @game.destroy
    redirect url(:dashboard)
  end

  def end_game
    @game.finish_game!
    game_passings = GamePassing.of_game(@game)
    game_passings.each do |gp|
      gp.end!
    end
    redirect url(:dashboard)
  end

  def start_test
    game = self.find_game
    game.is_draft = 'f'
    game.is_testing = 't'
    game.test_date = game.starts_at
    game.starts_at = Time.now + 0.1.second
    game.registration_deadline = nil
    game.save!
    sleep(rand(1))

    redirect resource(@game)
  end

  def finish_test
    game = self.find_game
    game.is_draft = 't'
    game.is_testing = 'f'
    game.starts_at = game.test_date
    game.test_date = Time.now
    game.save!

    game_passing = GamePassing.of_game(game)
    logs = Log.of_game(game)

    game_passing.delete_all
    logs.delete_all

    redirect resource(@game)
  end

  protected

  def build_game
    @game = Game.new(params[:game])
    @game.author = @current_user
  end

  def find_game
    @game = Game.find(params[:id])
  end

  def game_is_draft?
    @game.draft?
  end

  def no_start_time?
    @game.starts_at.nil?
  end

  def ensure_author_if_game_is_draft
    ensure_master if game_is_draft?
  end

  def ensure_author_if_no_start_time
    ensure_master if no_start_time?
  end

  def max_user_number_from_nz
    if @game.max_user_number.nil? or @game.max_user_number.equal?(0)
      @game.max_user_number = 10000
    end
  end
end