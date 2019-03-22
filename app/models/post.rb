
class TitleValidator < ActiveModel::Validator 
  def validate(record) 
    case record 
    when record.title.include?("Won't Believe")
      record.errors[:title] << 'Needs a ClickBait Title!' 
    when record.title.include?("Secret")
      record.errors[:title] << 'Needs a ClickBait Title!' 
    when record.title.include?("Top [number]")
      record.errors[:title] << 'Needs a ClickBait Title!' 
    when record.title.include?("Guess")
      false 
    end
  end 
end 


class Post < ActiveRecord::Base
  include ActiveModel::Validations
  validates_with TitleValidator
  validates :title, presence: true 
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
end

