class Bookmark < ApplicationRecord
  belongs_to :movie
  belongs_to :list

  validates :comment, length: { minimum: 6 }

  # This validate the uniqueness of a pair of ids
  validates :movie_id, uniqueness: { scope: :list_id, message: "It's already in your list!" }
end
