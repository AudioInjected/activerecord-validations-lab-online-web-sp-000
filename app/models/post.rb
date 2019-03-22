class Post < ActiveRecord::Base

  validates :title, presence: true 
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
  validate :is_click_bait?

  private 
  
  click_bait = ["Won't Believe", "Secret", "Top [number]", "Guess"]
  
  def is_click_bait? 
    click_bait.find {|p| title.include?(p)} ? return : next
    errors.add(:title, "Not Click Bait")
  end
end 