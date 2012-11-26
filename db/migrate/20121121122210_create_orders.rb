class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
    	t.references :customer
			t.string :product_name
			t.integer :quantity
			t.boolean :order_acceptance
      t.timestamps
    end
  end
end
