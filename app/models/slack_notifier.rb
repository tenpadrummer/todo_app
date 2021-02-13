class SlackNotifier
  attr_reader :client

  WEBHOOK_URL = ENV['SLACK_WEBHOOK_URL']
  CHANNEL = '#名古屋gas道場'
  USER_NAME = 'TodoApp_admin'

  def initialize
    @client = Slack::Notifier.new(WEBHOOK_URL, channel: CHANNEL, username: USER_NAME)
  end

  def send(task)
    message = "タスクが作成されました！\n\n#{task.title}\n\n#{task.content}\n\n#{task.deadline}"
    Slack::Notifier.new(WEBHOOK_URL, channel: CHANNEL, username: USER_NAME).ping(message)
  end
end
