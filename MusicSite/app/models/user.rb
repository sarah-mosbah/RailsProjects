class User < ApplicationRecord

    validates :email, presence: true
    validates :session_token, presence: true
    validates :password_digest, presence: { message: 'Password can\'t be blank' }
    validates :password, length: { minimum: 6, allow_nil: true }
    validate :is_email_valid?

    

    has_many :notes

    after_initialize :ensure_session_token

    REGEX_PATTERN = /^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+$/ 


    attr_reader :password
    def password=(password)
        @password= password
        self.password_digest= BCrypt::Password.create(password)
    end

    def is_password?(password)
        BCrypt::Password.new(self.password_digest).is_password?(password)
    end

    def is_email_valid? 
      self.email =~REGEX_PATTERN
    end

    def self.find_by_credentials(email,password)
        user= User.find_by(email: email)

        return nil if user.nil?

        user.is_password?(password) ? user : nil
    end


    def ensure_session_token
        self.session_token ||=User.generate_session_token
    end

    def self.generate_session_token
        SecureRandom::urlsafe_base64(16)
    end

    def reset_session_token!
        self.session_token = self.class.generate_session_token
        self.save!
        self.session_token
      end
end
