class Answer < ApplicationRecord
  include TimeFormat
  belongs_to :question
  validates :body, presence: true, length: {in: 2..3000}
end
