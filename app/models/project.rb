class Project < ActiveRecord::Base
  belongs_to :user
  attr_accessible :description, :goal, :team1, :team2, :title, :user_id, :matchtime

  validates :title, presence: true, length: {maximum: 100}
  validates :team1, presence: true, length: {maximum: 255}
  validates :team2, presence: true, length: {maximum: 255}
  validates :description, presence: true
  validates :goal, presence: true, numericality: {greater_than: 0, allow_blank: true}

  has_many :bets

  def formatted_goal
    formatted_n = "$" + goal.to_s.reverse.gsub(/...(?=.)/,'\&,').reverse
  end
end
