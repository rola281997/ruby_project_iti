class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :title
      t.text :description
      t.float :price
      t.integer :inStock_amount
      # t.string  :image
      t.references :brand, null: false, foreign_key: { to_table: :brands }
      t.references :category, null: false, foreign_key: { to_table: :categories }
      t.references :user, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
