class Post < ActiveRecord::Base

  validates :title, presence: true 
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
  validate :click_bait
end

private 

click_bait = ["Won't Believe", "Secret", "Top [number]", "Guess"]

def click_bait 
  if title.match("Won't Believe") == nil
    errors.add(:title, "Not clickbait-y")
  elsif !title.match("Secret")
    errors.add(:title, "Not clickbait-y")
  elsif !title.match("Top [number]")
    errors.add(:title, "Not clickbait-y")
  elsif !title.match("Guess")
    errors.add(:title, "Not clickbait-y")
  end
end 