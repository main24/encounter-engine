class User < ActiveRecord::Base

  has_many :created_games, :class_name => "Game", :foreign_key => "author_id"

  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+.)+[a-z]{2,})\Z/i,
    :message => "Неправильный формат поля e-mail"

  validates_uniqueness_of :email, 
    :message => "Команда с таким адресом уже зарегистрирована"

  validates_presence_of :name,
    :message => "Вы не ввели название команды"

  validates_format_of :phone_number,
    :with => /^(\d+\b.*)?$/i,
    :message => "Неверный номер телефона. Используйте только цифры",
    :on => :update

  validates_uniqueness_of :name,
    :message => "Команда с таким именем уже зарегистрирована"

  validates_length_of :password, :minimum => 4,
    :message => "Слишком короткий пароль (минимум 4 символа)",
    :if => :password_required?

  validates_confirmation_of :password, 
    :message => "Пароль и его подтверждение не совпадают",
    :if => :password_required?

  def author_of?(game)
    game.author.id == self.id
  end

  def current_level_in(game)
    game_passing = GamePassing.of(self, game)
    game_passing.try :current_level
  end

  def finished?(game)
    game_passing = GamePassing.of(self, game)
    !! game_passing.try(:finished?)
  end
end