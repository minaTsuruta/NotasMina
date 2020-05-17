class Article < ApplicationRecord
    has_many :comments, dependent: :destroy
    has_many :notes, through: :comments
    validates :title, presence: true,
                      length: { minimum: 5 }
    belongs_to :category
    has_rich_text :text
  end