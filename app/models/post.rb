class Post < ActiveRecord::Base

  validate :click_bait
  #validates :title, presence: true 
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
end

private 

def click_bait 
  if !title.include?("Wont Believe") && !title.nil?
    errors.add(:title, "Not clickbait-y")
  elsif !title.include?("Secret") && !title.nil?
    errors.add(:title, "Not clickbait-y")
  elsif title.include?("Top [number]") && !title.nil?
    errors.add(:title, "Not clickbait-y")
  elsif !title.include?("Guess") && !title.nil?
    errors.add(:title, "Not clickbait-y")
  end
end 