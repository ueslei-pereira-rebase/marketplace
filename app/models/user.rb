class User < ApplicationRecord
  belongs_to :company
  has_one_attached :avatar
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  before_validation :get_company
  validates_acceptance_of :agree, allow_nil: false, on: :create
  after_create :attach_avatar

  enum status: { inactive: 0 , active: 1}

    private

    def attach_avatar
      self.avatar.attach(io: File.open('app/assets/images/female.jpg'), filename: 'female.jpg')
    end
    
    def get_company
      domain_name = email.split("@")[1].split('.')[0]
      company = Company.find_by(domain: domain_name)
      if company.present?
        self.company = company
      else
        errors.add(:company, "Não está registrada")
      end
    end

end
