class Task < ApplicationRecord
    validates :user, presence: true, length: { maximum: 11 }
    validates :title, presence: true, length: { maximum: 8 }
    validates :description, presence: true, length: { maximum: 255 }
end