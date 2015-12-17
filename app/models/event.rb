class Event < ActiveRecord::Base
	include ActiveModel::Validations

  belongs_to :user
  has_many :guests, through: :attendees, class: :user
  has_many :attendees
  has_many :comments
  validates :title, :location, :presence => true, length: {minimum: 2}
  validates :state, length: { is: 2 }
  validate :must_be_future_date
  # date format is inherently YYYY-MM-DD
  def must_be_future_date
  	if date.present? && date <= Date.today
  		errors.add(:date, "must be in the future")
  	end
  end
end
