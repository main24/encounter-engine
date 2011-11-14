class GameEntries < Application
  before :ensure_authenticated
  before :ensure_master
  before :find_game, :only=> [:new, :create, :build_entry, :delete]
  before :find_entry, :exclude => [:new, :create, :build_entry]
  before :build_entry, :only => [:new, :create]

  def new
    only_provides :html
    @all_users = User.find :all
    render
  end

  def create
    if @game_entry.save
      @game.reserve_place_for_user!
      redirect resource(@game)
    else
      @all_users = User.find :all
      render :new
    end
  end

  def cancel
    if @entry.status == "accepted"
      @entry.cancel!
    end
    @game.free_place_of_user!
    redirect url(:dashboard)
  end

  def delete
    @entry.destroy
    redirect resource(@game)
  end

protected

  def build_entry
    if @game.can_request?
      @game_entry = GameEntry.new(params[:game_entry])
      @game_entry.game_id = @game.id
      @game_entry.status = "accepted"
    end
  end

  def find_game
    @game = Game.find(params[:game_id])
  end

  def find_entry
    @entry = GameEntry.find(params[:id])
    if @entry
      @game = Game.find(@entry.game.id)
    end
  end

end