module ApplicationHelper

    def notification_count
        @notification = Notification.all.length
    end  
end
