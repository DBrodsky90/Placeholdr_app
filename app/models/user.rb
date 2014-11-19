class User < ActiveRecord::Base
	validates :username, presence: true, uniqueness: true
	validates_presence_of :first_name
	has_many :boards, dependent: :destroy
	has_secure_password
end