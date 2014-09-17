# Description:
#   Show LGTM image.
#
# Commands:
#   hubot lgtm - fetch random image from http://www.lgtm.in/

module.exports = (robot) ->

  robot.respond /lgtm$/i, (msg) ->
    msg.http('http://www.lgtm.in/g')
      .header('Accept', 'application/json')
      .get() (err, res, body) ->
        if err
          msg.send 'failed to fetch image :('
        else
          msg.send JSON.parse(body).imageUrl
