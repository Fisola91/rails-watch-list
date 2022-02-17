class Bookmark < ApplicationRecord
  belongs_to :movie
  belongs_to :list

  validates :comment, length: { minimum: 6 }

  # This validate the uniqueness of a pair of ids
  validates_uniqueness_of :list_id, :scope => [:movie_id]
end
