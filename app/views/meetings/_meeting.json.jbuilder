json.extract! meeting, :id, :name, :date, :start_time, :end_time, :created_at, :updated_at
json.url meeting_url(meeting, format: :json)
