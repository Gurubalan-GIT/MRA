class Meeting < ApplicationRecord
    has_and_belongs_to_many :users
    belongs_to :room
    accepts_nested_attributes_for :users
end