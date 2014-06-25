class User < ActiveRecord::Base
  has_secure_password

  def full_name
  	"#{firstname} #{surname}"
  end

  def destroyable?
  	!admin
  end
end
