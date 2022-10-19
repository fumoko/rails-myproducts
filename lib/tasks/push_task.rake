namespace :push_task do
    desc "LINEBOT：タスクの通知" 
    task :push_line_message_task => :environment do
        client = Line::Bot::Client.new { |config|
            config.channel_secret = ENV["LINE_CHANNEL_SECRET"]
            config.channel_token = ENV["LINE_CHANNEL_TOKEN"]
        }

        limit_tasks = Blog.where(start_time: Date.today.beginning_of_day...Date.today.end_of_day)
        limit_tasks.each do |t|
            message = {
                type: 'text',
                text: "「#{t.title}」の期限は今日の#{t.start_time.strftime("%H:%M")}やで！"
            }
            response = client.push_message(t.user_uid, message)
            p response
        end
    end
end