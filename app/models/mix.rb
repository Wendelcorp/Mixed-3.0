class Mix < ApplicationRecord
  has_many :songs
  belongs_to :user
  accepts_nested_attributes_for :songs, reject_if: :all_blank, allow_destroy: true
end
