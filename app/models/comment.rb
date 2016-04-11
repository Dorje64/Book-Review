class Comment < ActiveRecord::Base
  belongs_to :book
  validates_presence_of :content
end
