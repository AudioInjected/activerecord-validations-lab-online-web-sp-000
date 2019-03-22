class Author < ActiveRecord::Base
  validates :name, uniqueness: true
  validates :phone_number
end
