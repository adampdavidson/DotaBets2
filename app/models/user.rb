class User < ActiveRecord::Base
  authenticates_with_sorcery!
  attr_accessible :username, :email, :password, :password_confirmation, :admin


  validates_presence_of :username, :email, :password, :on => :create
  validates_uniqueness_of(:email)

  validates_length_of :password, :minimum => 3, :message => "password must be at least 3 characters long", :if => :password
  validates_confirmation_of :password, :message => "should match confirmation", :if => :password

  has_many :projects
  has_many :pledges
  has_many :bets
end
