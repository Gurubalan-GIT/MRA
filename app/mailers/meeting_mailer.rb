class MeetingMailer < ApplicationMailer
    helper :application
    def new_meeting_email
        @meeting = params[:meeting]
        @user = params[:user]
        mail(to: @user.email, subject: "You got a new Meeting!")
    end
end
