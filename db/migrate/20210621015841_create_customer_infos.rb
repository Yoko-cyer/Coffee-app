class CreateCustomerInfos < ActiveRecord::Migration[6.1]
  def change
    create_table :customer_infos do |t|
      t.integer :phone
      t.string :email
      t.references :customer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
