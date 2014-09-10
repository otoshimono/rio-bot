# Description:
#   Utility commands surrounding Hubot uptime.
#
# Commands:
#   hubot ping - Reply with pong
#   hubot echo <text> - Reply back with <text>
#   hubot time - Reply with current time
#   hubot Where you are ? - echo hubot repository URL

module.exports = (robot) ->
  robot.respond /PING$/i, (msg) ->
    msg.send "PONG"

  robot.respond /ADAPTER$/i, (msg) ->
    msg.send robot.adapterName

  robot.respond /ECHO (.*)$/i, (msg) ->
    msg.send msg.match[1]

  robot.respond /TIME$/i, (msg) ->
    msg.send "Server time is: #{new Date()}"

  robot.respond /(Where you are|どこにいるの) ?(\?|？)$/i, (msg) ->
    repositories = [
      'https://github.com/otoshimono/rio-bot'
      'http://mamorio-slackbot.herokuapp.com/'
    ]
    msg.send repositories.join '\n'

  robot.hear ///#{robot.name}$///i, (msg) ->
    msg.send "ハロー#{msg.message.user.name}さん"
