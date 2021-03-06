class User < ApplicationRecord
pay_customer

has_person_name

def can_receive_payments?
  uid? && provider? && access_code? && publishable_key?
end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:stripe_connect]
  has_many :projects, dependent: :destroy
end
