class User < ActiveRecord::Base
  has_secure_password
  has_many :events
  has_many :attendees
  email_regex = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :first_name, :last_name, :location, :state, :presence => true, length: {minimum: 2}
  validates :password, :presence => true, on: :create, length: {minimum: 8}
  validates :email, :presence => true, :uniqueness => { case_sensitive: false }, :format => { :with => email_regex }
end
