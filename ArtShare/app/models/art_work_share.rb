class ArtWorkShare < ApplicationRecord
     validates :viewer_id, presence:true, uniqueness: { scope: :artwork_id}

    belongs_to(:art_work,{
        foreign_key: :artwork_id,
        primary_key: :id,
        class_name: 'ArtWork'
    })
    belongs_to :viewer, class_name: 'User'


end