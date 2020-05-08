class CreateStores < ActiveRecord::Migration[6.0]
  def change
    create_table :stores do |t|
      t.string :name
      t.string :summary
      t.references :user, null: false, foreign_key: { to_table: :users }
      t.timestamps
    end
  end
end
