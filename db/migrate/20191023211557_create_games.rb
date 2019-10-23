class CreateGames < ActiveRecord::Migration[6.0]
  def change
    create_table :games do |t|
      t.string :name
      t.string :category
      t.string :difficulty
      t.integer :questions_count

      t.timestamps
    end
  end
end
