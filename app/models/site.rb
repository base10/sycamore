class Site < ApplicationRecord
  # Add a soft limit on the length of name and URL
  validates(
    :name,
    length: {maximum: 250},
    presence: true,
    uniqueness: {case_sensitive: false}
  )
  validates(
    :url,
    length: {maximum: 250},
    presence: true,
    uniqueness: {case_sensitive: false}
  )
end
