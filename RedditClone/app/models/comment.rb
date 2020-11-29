class Comment < ApplicationRecord

    validates :content, presence: true

    belongs_to(:author, {
        primary_key: :id,
        foreign_key: :author_id,
        class_name: 'Comment'
    })

    belongs_to :post
    belongs_to(:author, {
        primary_key: :id,
        foreign_key: :author_id,
        class_name: 'User'
    })

    has_many(:child_comments,{
            class_name: :Comment,
            foreign_key: :parent_comment_id,
            dependent: :destroy,
            primary_key: :id})

    belongs_to(:parent_comment,{
                class_name: :Comment,
                foreign_key: :parent_comment_id,
                primary_key: :id,
                optional: true})


    def has_parent?
       return !self.parent_comment_id.nil?
    end
end
