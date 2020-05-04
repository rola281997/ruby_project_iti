class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.references :buyer, null: false, foreign_key: { to_table: :users }
      t.timestamps
    end
    # add_column :state
  end
end
