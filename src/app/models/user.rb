class User < ApplicationRecord
	validates_presence_of :email,
	                      :first_name,
	                      :last_name,
	                      :institution

	validates :email, uniqueness: true
  
  has_secure_password
  
  has_one :occupation
  has_one :activity_domain
end
