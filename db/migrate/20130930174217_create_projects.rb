class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :title
      t.string :team1
      t.string :team2
      t.integer :user_id
      t.text :description
      t.integer :goal
      t.datetime :matchtime

      t.timestamps
    end
  end
end
