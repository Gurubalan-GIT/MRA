class Meeting < ApplicationRecord
    has_and_belongs_to_many :users
    belongs_to :room
    
    validate :check_capacity, :check_time_slot

    def check_capacity
        capacity_pluck = Room.select(:capacity).where(id: room_id).pluck(:capacity)
        capacity = capacity_pluck.join.to_i
        users = user_ids.count + 1
        if(users>capacity)
            errors.add(:user_ids, "Capacity of this room is just #{capacity}")
        end
    end

    def check_time_slot
        c = Meeting.all.where("room_id= ? AND date= ? AND start_time<= ? AND end_time>= ?", room_id, date, start_time, end_time ).count
        if(c==0)
        else
            errors.add(:start_time, "The Room is already booked in this slot")
        end
    end

end