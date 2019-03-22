class Post < ActiveRecord::Base
  validates :title, presence: true 
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
end


class TitleValidator < ActiveModel::EachValidator 
  def validate_each(record, attribute, value) 
    if !value.split.include?("Won't Believe")
  end 
end 

=begin 

class EmailValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
      record.errors[attribute] << (options[:message] || "is not an email")
    end
  end
end
 
class Person < ApplicationRecord
  validates :email, presence: true, email: true
end
=end