class CreateBets < ActiveRecord::Migration
  def change
    create_table :bets do |t|
      t.integer :user_id
      t.integer :project_id
      t.integer :amount1
      t.integer :amount2

      t.timestamps
    end
  end
end
