# https://github.com/hparra/ruby-serialport
require 'dino'
 
board = Dino::Board.new(Dino::TxRx.new)
@red_lights = []
@green_lights = []

(8..13).each do |red_light|
  @red_lights.push(Dino::Components::Led.new(pin: red_light, board: board))
end


(2..7).each do |green_light|
  @green_lights.push(Dino::Components::Led.new(pin: green_light, board: board))
end

def green(switch)
  light(@green_lights, switch)
end

def red(switch)
  light(@red_lights, switch)
end

def light(lights, switch)
  lights.each do |light|
    light.send(switch)
  end
end