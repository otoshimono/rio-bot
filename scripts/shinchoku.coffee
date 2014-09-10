# Description:
#   Pulls GIFs from various insane tumblrs
#
# Dependencies:
#   "tumblrbot": "0.1.0"
#
# Configuration:
#   HUBOT_TUMBLR_API_KEY - A Tumblr OAuth Consumer Key will work fine
#
# Commands:
#   hubot 進捗どうですか - Returns a random image from shinchokudodesuka.tumblr.com
#
# Author:
#   iangreenleaf

tumblr = require "tumblrbot"
SOURCES = {
  "shinchokudodesuka.tumblr.com"
}

getGif = (blog, msg) ->
  tumblr.photos(blog).random (post) ->
    msg.send post.photos[0].original_size.url

module.exports = (robot) ->
  robot.respond /進捗/i, (msg) ->
    blog = msg.random Object.keys(SOURCES)
    getGif blog, msg

