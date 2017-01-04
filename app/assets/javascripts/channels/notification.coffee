App.notification = App.cable.subscriptions.create "NotificationChannel",
  connected: ->
    # connected
    
  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    console.log(data)
