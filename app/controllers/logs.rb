class Logs < Application
  before :ensure_authenticated
  before :find_game
  before :ensure_master, :only => [:show_live_channel, :show_level_log, :show_game_log]
  before :find_user, :only => [:show_level_log, :show_game_log]
  before :find_level, :only => [:show_level_log, :show_game_log]

  def index
    render
  end

  def show_live_channel
    @logs =Log.of_game(@game)
    render
  end

  def show_level_log
    @logs = Log.of_game(@game).of_user(@user).of_level(@level)
    render
  end

  def show_game_log
    @logs = Log.of_game(@game).of_user(@user)
    render
  end

  def show_full_log
    @logs =Log.of_game(@game)
    @levels = Level.of_game(@game)
    @users = User.find_by_sql("select * from users t inner join game_passings gp on t.id = gp.user_id where gp.game_id = #{@game.id}")
    render
  end

protected

  def find_game
    @game = Game.find(params[:game_id])
  end  
  
  def find_user
    @user = User.find(params[:user_id])
  end

  def find_level
    @level = @user.current_level_in(@game)
  end

end