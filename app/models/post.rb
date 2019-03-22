class Post < ActiveRecord::Base

 validates :title, presence: true 
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
  validate :click_bait
end

private 

def click_bait 
  if !title.include?("Wont Believe") && !title.nil?
    errors.add(:title, "Title not clickbait-y")
  elsif !title.include?("Secret") && !title.nil?
    errors.add(:title, "Title not clickbait-y")
  elsif title.include?("Top [number]")
    errors.add(:title, "Title not clickbait-y")
  elsif !title.include?("Guess") && !title.nil?
    errors.add(:title, "Title not clickbait-y")
  end
end 