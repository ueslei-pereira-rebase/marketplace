class User < ApplicationRecord
  belongs_to :company
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  before_validation :get_company

    private
    
    def get_company
      domain_name = email.split("@")[1].split('.')[0]
      company = Company.find_by(name: domain_name)
      if company.present? && company.is_employee?(email)
        self.company = company
      else
        errors.add(:company, "Não está registrada")
      end
    end

end
