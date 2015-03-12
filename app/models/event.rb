class Event < ActiveRecord::Base
  has_and_belongs_to_many :event_registrations

  validates :name, :registration_fee, presence: true
end
