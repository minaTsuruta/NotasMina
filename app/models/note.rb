class Note < ApplicationRecord
    belongs_to :comment
    belongs_to :article
    has_rich_text :detail
    has_rich_text :report
    
end
