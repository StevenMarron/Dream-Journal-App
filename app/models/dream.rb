class Dream < ApplicationRecord
  validates_presence_of :title
  belongs_to :user
  paginates_per 2
end
