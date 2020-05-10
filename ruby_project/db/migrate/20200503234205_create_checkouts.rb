class CreateCheckouts < ActiveRecord::Migration[6.0]
  def change
    create_table :checkouts do |t|
    	t.integer :quantity
        t.references :cart, null: false, foreign_key: { to_table: :carts }
        t.references :product, null: false, foreign_key: { to_table: :products }
        t.references :order, null: false, foreign_key: { to_table: :orders }
        t.references :user, null: false, foreign_key: { to_table: :users }
      t.timestamps
    end
  end
end
