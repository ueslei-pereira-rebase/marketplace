class Company < ApplicationRecord
  has_many :users, dependent: :destroy

  before_create :name_domain

  private

  def name_domain
    self.domain = email.split('@')[1].split('.')[0]
  end
end
