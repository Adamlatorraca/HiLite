class CreateHilites < ActiveRecord::Migration[5.2]
  def change
    create_table :hilites do |t|
      t.string :title
      t.string :content
      t.belongs_to :user, foreign_key: true
      t.belongs_to :category, foreign_key: true

      t.timestamps
    end
  end
end
