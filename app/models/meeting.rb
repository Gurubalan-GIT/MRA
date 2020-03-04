class Meeting < ApplicationRecord
    validates :name, :start_time, :end_time, presence: true
    has_and_belongs_to_many :users
    belongs_to :room
    
    validate :check_capacity, :check_time_slot, :check_time, :check_date

    def check_capacity
        capacity_pluck = Room.select(:capacity).where(id: room_id).pluck(:capacity)
        capacity = capacity_pluck.join.to_i
        users = user_ids.count + 1
        if(users>capacity)
            errors.add(:user_ids, "Capacity of this room is just #{capacity}")
        end
    end

    def check_time_slot
        c = Meeting.all.where("room_id= ? AND start_time<= ? AND end_time>= ?", room_id, start_time, end_time ).count

        if(c==0)
        else
            errors.add(:end_time, "The Room is already booked in this slot")
        end
    end

    def check_time 
        if((start_time < end_time))
        else
            errors.add(:start_time, "cannot be greater than or equal to the End time.")
        end
    end

    def check_date 
        if(start_time.to_date == end_time.to_date)
        else
            errors.add(:end_time, "Dates should be same.")
        end
    end

end