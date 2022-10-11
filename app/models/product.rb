class Product < ApplicationRecord
  belongs_to :user
  has_many_attached :images, dependent: :destroy
  # after_update_commit { broadcast_replace_to :products }

  enum status: { active: 0 , desactive: 1 }
end
