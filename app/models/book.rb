class Book < ActiveRecord::Base
has_many :comments
  has_many :likes
  belongs_to :users
validates_presence_of :description
validates_presence_of :name
validates_presence_of :author
end
