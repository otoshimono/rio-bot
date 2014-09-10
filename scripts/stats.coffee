# Description:
#   Show mamorio's stats.
#
# Commands:
#   hubot stats - MotionGalleryで集まった金額を表示

request = require 'request'
cheerio = require 'cheerio'

module.exports = (robot) ->
  robot.respond /stats$/i, (msg) ->
    options =
      url: 'https://motion-gallery.net/projects/mamorio'
      timeout: 2000
      headers: {'user-agent': 'node script'}

    request options, (error, response, body) ->
      $ = cheerio.load body
      messages = []
      $('#projectSide .pjtStatusList').find('dt,dd').each (i, elem) ->
        messages.push $(@).text().replace ///\s+///g, ''
      msg.send messages.join '\n'
