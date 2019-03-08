class User < ApplicationRecord
	validates_presence_of :email,
	                      :first_name,
	                      :last_name,
	                      :institution

	validates :email, uniqueness: true
  
  has_secure_password
  
  has_one :occupation
  has_one :activity_domain

	#   validates :image_url, allow_blank: true, format: { with:
	# %r{\.(gif|jpg|png)\Z}i, message: 'must be a URL for GIF, JPG or PNG image.' }
	
	# association with registrations:
  has_many :registrations
  has_many :events, through: :registrations, dependent: :destroy 

  # before_destroy :cancel_all_registrations
	after_destroy :ensure_one_admin_remains


  # private
		# # ensure that there are no registration referencing this user
		# def cancel_all_registrations
		# 	unless registrations.empty?
		# 		#errors.add(:base, 'registration present') throw :abort
		# 	end
		# end
	class Error < StandardError
	end
	
	private
		def ensure_an_admin_remains
			if User.count.zero?
				raise Error.new "You can't delete last user"
			end 
		end
end
