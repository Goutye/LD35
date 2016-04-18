local class = require 'EasyLD.lib.middleclass'

local IScreen = require 'EasyLD.IScreen'
local EndScreen = class('EndScreen', IScreen)

function EndScreen:initialize(gamedata)
	self.point = gamedata.point
	self.combo = gamedata.combo
	self.nbFail = gamedata.nbFail
	self.nbPerfect = gamedata.nbPerfect
	self.bestCombo = gamedata.bestCombo

	self.pointBest = math.max(math.ceil(gamedata.point / 1000), 100)

	self.pointReal = self.point + self.pointBest * (self.combo + self.bestCombo + self.nbPerfect - self.nbFail)
	print(self.pointReal)
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
	font:printOutLine("Thank you for playing", 80, EasyLD.box:new(0, 10,EasyLD.window.w, EasyLD.window.h), "center", "top", EasyLD.color:new(255,255,255), EasyLD.color:new(0,0,0), 1)
	font:printOutLine(math.ceil(self.point), 64, EasyLD.box:new(0, 200,EasyLD.window.w/5 * 2, EasyLD.window.h), "right", "top", EasyLD.color:new(255,255,255), EasyLD.color:new(0,0,0), 1)
	if self.point >= 1000 then
		font:print(math.ceil(self.point/1000).."   ", 64, EasyLD.box:new(0, 200,EasyLD.window.w/5 * 2, EasyLD.window.h), "right", "top", EasyLD.color:new(255,0,140))
		
		if self.point >= 1000000 then
			font:print(math.ceil(self.point/1000000).."      ", 64, EasyLD.box:new(0, 200,EasyLD.window.w/5 * 2, EasyLD.window.h), "right", "top", EasyLD.color:new(200,0,255))
		end
	end
	font:printOutLine(self.pointBest, 64, EasyLD.box:new(0, 280,EasyLD.window.w/5 * 2, EasyLD.window.h), "right", "top", EasyLD.color:new(255,255,255), EasyLD.color:new(0,0,0), 1)
	font:printOutLine("x".. self.bestCombo .. " x ", 64, EasyLD.box:new(100, 280,EasyLD.window.w/5 * 2, EasyLD.window.h), "left", "top", EasyLD.color:new(255,255,255), EasyLD.color:new(0,0,0), 1)
	font:printOutLine(" Best Combo", 64, EasyLD.box:new(EasyLD.window.w/5 * 2, 280,EasyLD.window.w/5 * 2, EasyLD.window.h), "left", "top", EasyLD.color:new(255,255,255), EasyLD.color:new(0,0,0), 1)

	font:printOutLine(self.pointBest, 64, EasyLD.box:new(0, 350,EasyLD.window.w/5 * 2, EasyLD.window.h), "right", "top", EasyLD.color:new(255,255,255), EasyLD.color:new(0,0,0), 1)
	font:printOutLine("x".. self.combo .. " x ", 64, EasyLD.box:new(100, 350,EasyLD.window.w/5 * 2, EasyLD.window.h), "left", "top", EasyLD.color:new(255,255,255), EasyLD.color:new(0,0,0), 1)
	font:printOutLine(" Current Combo", 64, EasyLD.box:new(EasyLD.window.w/5 * 2, 350,EasyLD.window.w/5 * 2, EasyLD.window.h), "left", "top", EasyLD.color:new(255,255,255), EasyLD.color:new(0,0,0), 1)

	font:printOutLine(self.pointBest * 10, 64, EasyLD.box:new(0, 420,EasyLD.window.w/5 * 2, EasyLD.window.h), "right", "top", EasyLD.color:new(255,255,255), EasyLD.color:new(0,0,0), 1)
	font:printOutLine("x".. self.nbPerfect .. " x ", 64, EasyLD.box:new(100, 420,EasyLD.window.w/5 * 2, EasyLD.window.h), "left", "top", EasyLD.color:new(255,255,255), EasyLD.color:new(0,0,0), 1)
	font:printOutLine(" Nb Perfects", 64, EasyLD.box:new(EasyLD.window.w/5 * 2, 420,EasyLD.window.w/5 * 2, EasyLD.window.h), "left", "top", EasyLD.color:new(255,255,255), EasyLD.color:new(0,0,0), 1)

	font:printOutLine(self.pointBest * 10, 64, EasyLD.box:new(0, 490,EasyLD.window.w/5 * 2, EasyLD.window.h), "right", "top", EasyLD.color:new(255,255,255), EasyLD.color:new(0,0,0), 1)
	font:printOutLine("- x".. self.nbFail .. " x ", 64, EasyLD.box:new(35, 490,EasyLD.window.w/5 * 2, EasyLD.window.h), "left", "top", EasyLD.color:new(255,255,255), EasyLD.color:new(0,0,0), 1)
	font:printOutLine(" Nb Fails", 64, EasyLD.box:new(EasyLD.window.w/5 * 2, 490,EasyLD.window.w/5 * 2, EasyLD.window.h), "left", "top", EasyLD.color:new(255,255,255), EasyLD.color:new(0,0,0), 1)

	font:printOutLine("-----------------", 64, EasyLD.box:new(0, 550,EasyLD.window.w/5 * 2, EasyLD.window.h), "right", "top", EasyLD.color:new(255,255,255), EasyLD.color:new(0,0,0), 1)

	font:printOutLine(math.ceil(self.pointReal), 90, EasyLD.box:new(0, 630,EasyLD.window.w/5 * 2, EasyLD.window.h), "right", "top", EasyLD.color:new(255,255,255), EasyLD.color:new(0,0,0), 1)
	if self.pointReal >= 1000 then
		font:print(math.floor(self.pointReal/1000).."   ", 90, EasyLD.box:new(0, 630,EasyLD.window.w/5 * 2, EasyLD.window.h), "right", "top", EasyLD.color:new(255,0,140))
		
		if self.pointReal >= 1000000 then
			font:print(math.floor(self.pointReal/1000000).."      ", 90, EasyLD.box:new(0, 630,EasyLD.window.w/5 * 2, EasyLD.window.h), "right", "top", EasyLD.color:new(200,0,255))
		end
	end

	font:printOutLine("Listen And Shift - LD35", 20, EasyLD.box:new(0, 0,EasyLD.window.w, EasyLD.window.h), "center", "bottom", EasyLD.color:new(255,255,255), EasyLD.color:new(0,0,0), 1)
end

function EndScreen:onEnd()

end

return EndScreen