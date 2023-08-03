# frozen_string_literal: true

class Question < ApplicationRecord
  has_many :answers, dependent: :destroy
  validates :title, presence: true, length: { minimum: 2 }
  validates :body, presence: true, length: { minimum: 2 }
  belongs_to :user
end
