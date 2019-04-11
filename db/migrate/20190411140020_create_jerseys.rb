class CreateJerseys < ActiveRecord::Migration[5.2]
  def change
    create_table :jerseys do |t|
      t.string :title
      t.string :sport
      t.string :player
      t.integer :player_number
    end
  end
end
