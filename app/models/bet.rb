class Bet < ActiveRecord::Base
  attr_accessible :amount1, :amount2, :project_id, :user_id
  belongs_to :user
  belongs_to :project
  # validates_numericality_of :amount1, :greater_than => 0, :only_integer => true
  # validates_numericality_of :amount2, :greater_than => 0, :only_integer => true
  # validates_presence_of :user_id, :project_id :on => :create

   def formatted_pledge
    formatted_n = "$" + amount1.to_s.reverse.gsub(/...(?=.)/,'\&,').reverse
  end
end
