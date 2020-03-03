# Preview all emails at http://localhost:3000/rails/mailers/meeting_mailer
class MeetingMailerPreview < ActionMailer::Preview
    def new_meeting_email
        MeetingMailer.with(meeting: Meeting.last, user: User.last).new_meeting_email
    end
end
