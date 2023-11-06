class Article < ApplicationRecord
  belongs_to :user
  belongs_to :site

  # Adjust the validation to have the intersection of published_on
  validates(
    :slug,
    length: {maximum: 255},
    presence: true,
    uniqueness: {case_sensitive: false}
  )
  validates(:body, presence: true)

  validates(:published_on, presence: true)

  scope :is_published, -> { where(published: true) }
  scope :is_unpublished, -> { where(published: false) }
  scope :is_private, -> { where(public: false) }
  scope :is_public, -> { where(public: true) }
  scope :live, -> { is_public.is_published }
end
