module ApplicationHelper

    def notification_count
        @notification = Notification.all.length
    end  
    def notifications
        @notifications = Notification.all
    end
end
