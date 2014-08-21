class User < ActiveRecord::Base
  has_secure_password

  validates :username, presence: true, uniqueness: true
  validates :surname, presence: true
  validates :firstname, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i }
  validate :last_admin?, unless: 'new_record? || admin'
  
  before_destroy :destroyable?
  
  def full_name
  	"#{firstname} #{surname}"
  end
  
  def destroyable?
  	existing_further_admin?
  end
  
  def last_admin?
    errors.add(:base, 'At least one admin must exist') unless existing_further_admin?
  end
  
  def existing_further_admin?
    User.where("admin = ? AND id != ?", true, id).count > 0
  end
end