class User < ApplicationRecord
    validates :username, presence: true, uniqueness: true

    has_many(:art_works, {
        foreign_key: :artist_id,
        primary_key: :id,
        class_name: 'ArtWork'
     })

     has_many(:comments,{
        foreign_key: :user_id,
        primary_key: :id,
        class_name: 'Comment'
    })
end
  