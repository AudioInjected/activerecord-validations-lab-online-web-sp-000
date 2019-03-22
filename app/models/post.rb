class Post < ActiveRecord::Base
  include ActiveModel::Validations
  validates_with TitleValidator
  validates :title, presence: true 
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
end


class TitleValidator < ActiveModel::Validator 
  def validate(record) 
    case record 
    when record.title.include("Won't Believe")
      false 
    when record.title.include("Secret")
      false 
    when record.title.include("Top [number]")
      false 
    when record.title.include("Guess")
      false 
    end
  end 
end 
