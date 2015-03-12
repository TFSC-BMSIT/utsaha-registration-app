class CreateEventRegistrationsEvents < ActiveRecord::Migration
  def change
    create_table :event_registrations_events do |t|
      t.belongs_to :event_registration, index: true
      t.belongs_to :event, index: true
    end
    add_foreign_key :event_registrations_events, :event_registrations
    add_foreign_key :event_registrations_events, :events
  end
end
