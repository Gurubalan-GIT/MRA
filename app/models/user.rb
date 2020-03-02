class User < ApplicationRecord
  validates :email, :presence => true
  validate :email_validation
  has_and_belongs_to_many :meetings
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  def email_validation
    if email.include? "@commutatus.com"

    else
      errors.add(:email, "Has to be a Commutatus mail!")
    end

  end
end
