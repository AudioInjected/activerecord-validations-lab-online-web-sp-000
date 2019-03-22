class Post < ActiveRecord::Base

  validates :title, presence: true 
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
  validate :is_click_bait?

  private 
  
  click_bait = ["Won't Believe", "Secret", "Top [number]", "Guess"]
  
  def is_click_bait? 
    click_bait.find do |p| 
      if title.include?(p)
        return 
      else
        next
      end
      errors.add(:title, "Not Click Bait")
    end
 end
end 