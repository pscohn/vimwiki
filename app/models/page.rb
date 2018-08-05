class Page < ApplicationRecord
  validates :user_id, presence: true

  belongs_to :user

  default_scope -> { order(created_at: :desc) }

  def to_param
    slug
  end
end
