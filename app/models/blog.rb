class Blog < ApplicationRecord
  has_rich_text :content

  validates :title, presence: true
end
