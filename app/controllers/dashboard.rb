class Dashboard < Application
  before :ensure_authenticated

  def index
    @games =Game.by(@current_user)
    @game_entries = []
    @users = []
    @games.each do |game|
      GameEntry.of_game(game).with_status("new").each do |entry|
         @game_entries << entry
      end
      GameEntry.of_game(game).with_status("accepted").each do |entry|
         @users << entry.user
       end
    end
    render
  end

end
