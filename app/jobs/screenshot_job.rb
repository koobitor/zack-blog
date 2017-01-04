class ScreenshotJob < ApplicationJob
  queue_as :default

  def perform(link)
    ws = Webshot::Screenshot.instance
    file = Tempfile.new

    ws.capture link.url, file, width: 1024, height: 768

    link.screenshot = file
    link.save
  end
end
