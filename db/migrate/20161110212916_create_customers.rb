class CreateCustomers < ActiveRecord::Migration[5.0]
  def change
    create_table :customers do |t|
      t.string :full_name
      t.string :email
      t.string :phone
      t.string :image
      t.references :province, foreign_key: true

      t.timestamps
    end
  end
end
