class Application < Merb::Controller

protected

  def ensure_author
    unless logged_in? and @current_user.author_of?(@game)
      raise Unauthorized, "Вы должны быть автором игры, чтобы видеть эту страницу"
    end
  end

  def ensure_game_was_not_started
    raise Unauthorized, "Нельзя редактировать игру после её начала" if @game.started?
  end

  def ensure_master
    unless logged_in? and @current_user.is_master
      raise Unauthorized, "У Вас недостаточно прав для выполнения этого действия"
    end
  end
end