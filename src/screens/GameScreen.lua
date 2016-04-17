local class = require 'EasyLD.lib.middleclass'

local IScreen = require 'EasyLD.IScreen'
local GameScreen = class('GameScreen', IScreen)

local EndScreen = require 'screens.EndScreen'

local Level = {}
for i = 1, 7 do
	Level[i] = require ('Level' .. i)
end

local music = {}
music[1] = EasyLD.music:new("assets/music/music1.wav", "static")
music[1]:setVolume(0.2)


function GameScreen:initialize()
	self.current = 1

	self.level = Level[self.current]:new()
	self.timer = nil

	self.playlist = EasyLD.playlist:new("background", nil, true)
	self.playlist:add(music[1])
	self.playlist:play()

end

function GameScreen:preCalcul(dt)
	return dt
end

function GameScreen:update(dt)
	self.level:update(dt)

	if self.level.levelSuccess and self.timer == nil then
		self.current = self.current + 1

		self.timer = EasyLD.timer.after(7, function() 
												self.nextLevel(self) 
											end)
	end
end

function GameScreen:nextLevel()
	self.timer = nil

	if self.current <= #Level then
		self.level = Level[self.current]:new(self.level:getInfo(), self.current)
	else
		EasyLD.screen:nextScreen(EndScreen:new(self.level:getInfo()), "fade", nil, 1, true, "quad")
	end
end

function GameScreen:draw()
	font:printOutLine("Listen And Shift - LD35", 20, EasyLD.box:new(0, 0,EasyLD.window.w, EasyLD.window.h), "center", "bottom", EasyLD.color:new(255,255,255), EasyLD.color:new(0,0,0), 1)

	EasyLD.graphics:setColor()
	self.level:draw()
end

function GameScreen:onEnd()
end

return GameScreen