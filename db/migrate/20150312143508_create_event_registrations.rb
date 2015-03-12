class CreateEventRegistrations < ActiveRecord::Migration
  def change
    create_table :event_registrations do |t|
      t.string :name
      t.string :mobile_no
      t.string :college
      t.string :token
      t.decimal :amount, precision: 5, scale: 2
      t.belongs_to :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :event_registrations, :users
  end
end
