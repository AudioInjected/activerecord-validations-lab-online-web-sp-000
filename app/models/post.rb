class Post < ActiveRecord::Base

  validates :title, presence: true 
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
  validate :click_bait
end

private 

def click_bait 
  if !title.match("Won't Believe")
    errors.add(:title, "Not clickbait-y")
  elsif !title.match("Secret")
    errors.add(:title, "Not clickbait-y")
  elsif !title.match("Top [number]")
    errors.add(:title, "Not clickbait-y")
  elsif !title.nil? && !title.include?("Guess")
    errors.add(:title, "Not clickbait-y")
  end
end 