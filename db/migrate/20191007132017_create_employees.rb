class CreateEmployees < ActiveRecord::Migration[5.1]
  def change
    create_table :employees do |t|
      t.string :name
      t.string :department
      t.integer :payment
      t.string :address
      t.date :joined_date

      t.timestamps
    end
  end
end
