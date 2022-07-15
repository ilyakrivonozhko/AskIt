class Question < ApplicationRecord
    include TimeFormat
    has_many :answers, dependent: :destroy
    validates :title, presence: true, length: {in: 3..100}
    validates :body, presence: true, length: {in: 3..3000}
end
