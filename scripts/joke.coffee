# Description:
#   Joke commands.
#   forked from https://github.com/nanapi/nanapi_bot
#
# Commands:
#   ぬるぽ - You reply with, "ｶﾞｯ" When you post a "ぬるぽ" word.
#
# Notes:
#   ネタ/ジョーク系のbot全般

eastasianwidth = require 'eastasianwidth'

strpad = (str, count) ->
  new Array(count + 1).join str

String::toArray = ->
  array = new Array
  i = 0

  while i < @length
    array.push @charAt(i)
    i++
  array

module.exports = (robot) ->
  robot.hear /ぬるぽ/, (msg) ->
    msg.send """
```
   Λ＿Λ     ＼＼
（  ・∀・）  | | ｶﾞｯ
 と     ）  | |
  Ｙ /ノ     人
   / ）    < >   _Λ  ∩
＿/し'   ／／  Ｖ｀Д´）/
（＿フ彡             / ←>> @#{msg.message.user.name}
```
  """

  robot.hear /突然の(.*)$/i, (msg) ->
    message = msg.match[1].replace /^\s+|\s+$/g, ''
    return until message.length

    length = Math.floor eastasianwidth.length(message) / 2

    suddendeath = [
      "＿#{strpad '人', length + 2}＿"
      "＞　#{message}　＜"
      "￣Y#{strpad '^Y', length}￣"
    ]
    msg.send suddendeath.join "\n"

  robot.respond /(短冊|tanzaku) (.*)$/i, (msg) ->
    message = msg.match[2].replace /^\s+|\s+$/g, ''
    return until message.length

    if message.length >= 16
      msg.send "メッセージが長過ぎます＞＜ノ 15文字以内にしてね。"
      return

    tanzaku = [
      "┏┷┓"
      "┃　┃"
    ]
    for value in message.toArray()
      tanzaku.push "┃#{value}┃"

    tanzaku.push "┃　┃"
    tanzaku.push "┗━┛"
    msg.send tanzaku.join "\n"
