class Article < ApplicationRecord
  belongs_to :user
  belongs_to :site

  validates(
    :slug,
    length: {maximum: 250},
    presence: true,
    uniqueness: {case_sensitive: false}
  )
  validates(
    :body,
    presence: true
  )
end
