class Shout < ApplicationRecord
  belongs_to :user
  belongs_to :content, polymorphic: true

  validates :user, presence: true

  delegate :username, to: :user #def username user.username end

  # scope :search, ->(term:) { joins("LEFT JOIN text_shouts ON content_type = 'TextShout' AND content_id = text_shouts.id").where("text_shouts.body LIKE ?", "%#{term}%")}

  searchable do
    text :content do
      case content
      when TextShout then content.body
      when PhotoShout then content.image_file_name
      end
    end
  end
end
