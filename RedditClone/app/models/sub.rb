class Sub < ApplicationRecord

    validates :title, :description, null:false

    belongs_to(:moderator,{
        primary_key: :id,
        foreign_key: :user_id,
        class_name: 'User',
    })
end
