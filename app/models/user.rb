class User < ApplicationRecord
    validates :email, presence: true, uniqueness: true
    validates :password, presence: true, confirmation: true
    validates :nickname, presence: true

    before_create :encrypt_password

		def self.login(user)
			pw = Digest::SHA1.hexdigest("a#{user[:password]}z")
			User.find_by(email: user[:email], password: pw)
    end


    private
    def encrypt_password
      self.password = Digest::SHA1.hexdigest("a#{self.password}z")
    end
end
