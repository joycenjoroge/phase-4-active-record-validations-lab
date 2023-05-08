class Post < ApplicationRecord
    validates :title, presence: true
    validates :category, inclusion: ["Fiction", "Non-Fiction"]
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validate :custom_validator

    def custom_validator 
        clickbait = [/Won't Believe/i, /Secret/i, /Top \d/i, /Guess/i]
        if clickbait.none? { |clickbait| clickbait.match title }
            errors.add(:title, "the title is not sufficiently clickbait-y.")
        end
    end
end
