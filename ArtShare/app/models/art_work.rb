class ArtWork < ApplicationRecord
    validates :title, presence:true, uniqueness: { scope: :artist_id,
        message: "Can't have same Title for same user"}

    validates :image_url ,presence:true, uniqueness: true

    belongs_to(:artist, {
       foreign_key: :artist_id,
       primary_key: :id,
       class_name: 'User'
    })

    has_many(:shared_arts,{
        foreign_key: :artwork_id,
        primary_key: :id,
        class_name: 'ArtWorkShare'
    })

    has_many :shared_viewers, through: :shared_arts, source: :viewer


    def self.get_artwork_for_user(user_id)
        ArtWork.left_outer_joins(:shared_arts).where('(art_works.artist_id = :user_id) OR (art_work_shares.viewer_id = :user_id)',user_id: user_id).distinct
    end
end