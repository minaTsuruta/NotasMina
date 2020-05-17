class Comment < ApplicationRecord
    belongs_to :article
    has_many :notes, dependent: :destroy
    has_rich_text :body
end
