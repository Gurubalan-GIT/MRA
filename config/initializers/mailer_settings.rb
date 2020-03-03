#
#Created Date: Tuesday March 3rd 2020
#Author: Gurubalan Harikrishnan
#Email-ID: gurubalan.work@gmail.com
#-----
#Copyright (c) 2020 Gurubalan Harikrishnan
#
Rails.application.configure do 
    ActionMailer::Base.smtp_settings = {
        :address              => "smtp.gmail.com",
        :port                 => 587,
        :user_name            => 'gurubalan@commutatus.com',
        :password             => 'todprnngxorcgrvk',
        :authentication       => "plain",
        :enable_starttls_auto => true
    }
end