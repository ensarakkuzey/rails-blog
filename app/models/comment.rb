class Comment < ApplicationRecord
    validates :title, presence: true
    validates :content, presence: true

    belongs_to :post
    belongs_to :user

    scope :accepteds, -> { where(accepted: true) }

    def commentter
        self.user ? user.username : ''
    end

    def status
        if accepted
            'Public'
        else
            'Private'
        end
    end
end