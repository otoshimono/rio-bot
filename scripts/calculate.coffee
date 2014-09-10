# Description:
#   Allows Hubot to calculate.
#
# Commands:
#   hubot ratio <x : A = B : C> - 比例式を計算し "x = A * B / C" と出力
#

module.exports = (robot) ->

  robot.respond /ratio x \: (\d+) = (\d+) \: (\d+)/, (msg) ->
    a = parseInt msg.match[1], 10
    b = parseInt msg.match[2], 10
    c = parseInt msg.match[3], 10
    msg.send "x = #{a * b / c}"
