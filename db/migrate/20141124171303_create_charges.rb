class CreateCharges < ActiveRecord::Migration
  def change
    create_table :charges do |t|
      t.belongs_to :user, index: true
      t.integer :stripe_charge_id
      t.integer :amount
      t.boolean :successful

      t.timestamps null: false
    end
    add_index :charges, :stripe_charge_id
  end
end
