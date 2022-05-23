class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  APPROVED_DOMAINS = ["brasasteachers.com"]
# * or you can load this from somewhere else

validates :email, presence: true, if: :domain_check

  def domain_check
    unless APPROVED_DOMAINS.any? { |word| email.end_with?(word)}
      errors.add(:email, "is not from a valid domain")
    end
  end
end
