class GameEntry < ActiveRecord::Base
  belongs_to :game
  belongs_to :user

  attr_accessor :recepient_name

  validates_presence_of :game,
    :message => "Вы не выбрали игру"

  validates_presence_of :user_id,
    :message => "Вы не указали команду"

  validates_uniqueness_of :user_id,
    :scope => [:game_id],
    :message => "Вы уже пригласили эту команду"

  validates_presence_of :recepient_name,
    :message => "Вы не указали команду"

  before_validation :find_user, :only => :of_user

  named_scope :of_game, lambda { |game| { :conditions => { :game_id => game.id } } }
  named_scope :of_user, lambda { |user| { :conditions => { :user_id => user.id } } }
  named_scope :with_status, lambda { |status| { :conditions => { :status  => status } } }

  def self.of(user, game)
    self.of_user(user).of_game(game).first
  end

  def find_user
    self.user = User.find_by_name(recepient_name)
  end

  def reopen!
    self.status = "new"
    save!
  end

  def accept!
    self.status = "accepted"
    save!
  end

  def reject!
    self.status = "rejected"
    save!
  end

  def recall!
    self.status = "recalled"
    save!
  end

  def cancel!
    self.status = "canceled"
    save!
  end

end