class Comment < ActiveRecord::Base
  belongs_to :event
  validates :content, :username, :presence => true, length: {minimum: 2}
end
