local class = require 'EasyLD.lib.middleclass'

local IScreen = require 'EasyLD.IScreen'
local EndScreen = class('EndScreen', IScreen)

function EndScreen:initialize(gamedata)
	self.point = gamedata.point
	self.combo = gamedata.combo
end

function EndScreen:preCalcul(dt)
	return dt
end

function EndScreen:update(dt)
	if EasyLD.keyboard:isPressed(" ") then
		EasyLD.screen:nextScreen(TitleScreen:new(), "fade", nil, 1, false, "quad")
	end
end

function EndScreen:draw()
	font:printOutLine("Thanks for playing", 64, EasyLD.box:new(0, 100,EasyLD.window.w, EasyLD.window.h), "center", "top", EasyLD.color:new(255,255,255), EasyLD.color:new(0,0,0), 1)
	font:printOutLine(math.ceil(self.point), 64, EasyLD.box:new(0, 0,EasyLD.window.w, EasyLD.window.h), "center", "top", EasyLD.color:new(255,255,255), EasyLD.color:new(0,0,0), 1)
	font:printOutLine("x".. self.combo, 60, EasyLD.box:new(0, 0,EasyLD.window.w - 10, EasyLD.window.h), "right", "top", EasyLD.color:new(255,255,255), EasyLD.color:new(0,0,0), 1)
	font:printOutLine("Listen And Shift - LD35", 20, EasyLD.box:new(0, 0,EasyLD.window.w, EasyLD.window.h), "center", "bottom", EasyLD.color:new(255,255,255), EasyLD.color:new(0,0,0), 1)
end

function EndScreen:onEnd()

end

return EndScreen