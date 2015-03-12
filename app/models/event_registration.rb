class EventRegistration < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :events

  validates :name, :college, :token, :amount, :events, presence: true
  validates :token, uniqueness: true

  validates_presence_of :user
  validates_associated :user

  validates_format_of :mobile_no, with: /\A\d{10}\z/, message: "is of an invalid format. 10 digit mobile number only."
end
