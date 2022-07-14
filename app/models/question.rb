class Question < ApplicationRecord
    validates :title, presence: true, length: {in: 3..100}
    validates :body, presence: true, length: {in: 3..1000}

    def formatted_created_at
        created_at.strftime('%Y-%m-%d %H:%M:%S')
    end
end
