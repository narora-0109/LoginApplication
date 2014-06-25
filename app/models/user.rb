class User < ActiveRecord::Base
  has_secure_password

  validates :username, presence: true, uniqueness: true
  validates :surname, presence: true
  validates :firstname, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i }
  
  def full_name
  	"#{firstname} #{surname}"
  end

  def destroyable?
  	!admin
  end
end
