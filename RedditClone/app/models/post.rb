class Post < ApplicationRecord

    validates :title, presence: true


    has_many(:comments, {
        primary_key: :id,
        foreign_key: :post_id,
        class_name: 'Comment'
    })
 

    belongs_to(:author, {
        primary_key: :id,
        foreign_key: :author_id,
        class_name: 'User'
    })
    
    # has_many(:posts_subs,{
    #     foreign_key: :post_id,
    #     primary_key: :id,
    #     class_name: 'PostsSubs'
    # })
    has_many :post_subs, inverse_of: :post, dependent: :destroy
    has_many :subs, through: :post_subs, source: :sub

end
