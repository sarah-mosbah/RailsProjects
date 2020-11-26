# require 'bcrypt'

class User < ApplicationRecord
   attr_accessor :session_token


    has_secure_password
   
    validates :username, uniqueness:true, presence:true
    validates :session_token, presence:true


    after_initialize :ensure_session_token


    def ensure_session_token
        @session_token ||= SecureRandom::urlsafe_base64(16)
    end


    
    has_many(:subs,{
        primary_key: :id,
        foreign_key: :user_id,
        class_name: 'Sub',
    })

end
