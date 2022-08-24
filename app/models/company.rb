class Company < ApplicationRecord
  has_many :users, dependent: :destroy
  has_many :employee, dependent: :destroy

  validates :name, presence: true
  validates :cnpj, presence: true
  validates :address, presence: true
  validates :email, presence: true

  before_create :name_domain

  # def is_employee?(email)
  #   return true if Employee.find_by(email: email)
  #   false
  # end

  private

  def name_domain
    self.domain = email.split('@')[1].split('.')[0]
  end
end
