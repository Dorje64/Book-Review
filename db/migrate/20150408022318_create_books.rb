class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :name
      t.string :author
      t.text :description
      t.string :category
      t.integer :like
      t.integer :dislike

      t.timestamps null: false
    end
  end
end
