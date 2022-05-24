class Article < ApplicationRecord
  belongs_to :user
  belongs_to :site

  # Adjust the validation to have the intersection of published_on
  validates(
    :slug,
    length: {maximum: 250},
    presence: true,
    uniqueness: {case_sensitive: false}
  )
  validates(:body, presence: true)

  validates(:published_on, presence: true)

  scope :published, -> { where(published: true) }
  scope :unpublished, -> { where(published: false)}
  scope :private , -> { where(private: true) }
  scope :public, -> { where(private: false) }


  # Add combined scope
end
