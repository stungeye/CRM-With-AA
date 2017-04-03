class Customer < ApplicationRecord
  belongs_to :province

  validates :full_name, presence: true
end
