class Room < ApplicationRecord
    validates :name, :capacity, presence: true
    has_many :meetings
    has_many :users, through: :meetings
end



