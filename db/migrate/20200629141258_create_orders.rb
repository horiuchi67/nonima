class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
    	t.integer :payment_method, null: false, default: 0
		t.string :postal_code, null: false
		t.string :destination, null: false
		t.string :name, null: false
		t.integer :shipping_cost, null: false
		t.integer :grand_total, null: false

      t.timestamps
    end
  end
end
