class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.decimal :registration_fee

      t.timestamps null: false
    end
  end
end
