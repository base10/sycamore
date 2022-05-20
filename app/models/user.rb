class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable

  has_many :articles

  validates :email, presence: true, uniqueness: true
  validates :encrypted_password, presence: true

  def logged_in?
    true
  end
end
