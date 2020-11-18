class Album < ApplicationRecord

    validates :year, :title, :live, presence: true
     
    belongs_to(:band, {
        primary_key: :id,
        foreign_key: :band_id,
        class_name: 'Band',
        dependent: :destroy
    })

    has_many :tracks
end
