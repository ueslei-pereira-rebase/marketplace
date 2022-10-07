class Product < ApplicationRecord
  belongs_to :user
  has_many_attached :images, dependent: :destroy

  enum status: { active: 0 , desactive: 1 }
end
