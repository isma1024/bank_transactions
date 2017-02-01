class CreateTransactions < ActiveRecord::Migration[5.0]
  def change
    create_table :transactions do |t|
      t.decimal :import
      t.string :description
      t.integer :account_id
      t.integer :category_id

      t.timestamps
    end

    add_index :transactions, :account_id
    add_index :transactions, :category_id
  end
end
