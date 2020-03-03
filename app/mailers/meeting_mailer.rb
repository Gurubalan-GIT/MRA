class MeetingMailer < ApplicationMailer
    helper :application

    default from: 'gurubalan@commutatus.com'

    def new_meeting_email
        @meeting = params[:meeting]
        @users = params[:users]
        mail(to: @users.map{ |user| user.email }, subject: "You got a new Meeting!")
    end
end
