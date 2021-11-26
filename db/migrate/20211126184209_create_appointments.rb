class CreateAppointments < ActiveRecord::Migration[6.1]
  def change
    create_table :appointments do |t|
      t.string :name
      t.string :surname
      t.integer :phone
      t.datetime :date
      t.text :notes
      t.belongs_to :professional, null: false, foreign_key: true
      t.index [:date, :professional], unique:true

      t.timestamps
    end
  end
end
