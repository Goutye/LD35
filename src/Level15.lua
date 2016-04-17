local class = require 'EasyLD.lib.middleclass'

local ILevel = require 'ILevel'
local Level4 = class('Level4', ILevel)

function Level4:initialize(score, lvl)
	ILevel.initialize(self, score, lvl)

	self.state = "Press each letter"
	self.isLudum = true

	ILevel.add(self, "l", 2, 4, "ludumDare")
	ILevel.add(self, "u", 3, 5, "empty")
	ILevel.add(self, "du", 4, 6, "empty")
	ILevel.add(self, "u", 5, 7, "empty")
	ILevel.add(self, "m", 6, 8, "empty")

	ILevel.add(self, "du", 8, 10, "empty")
	ILevel.add(self, "a", 9, 11, "empty")
	ILevel.add(self, "r", 10, 12, "empty")
	ILevel.add(self, "e", 11, 13, "empty")

	self.timeMaxIntro = 3
	ILevel.addInstruction(self, "firstLetter", 0)
end

function Level4:update(dt)
	ILevel.update(self, dt)
end

function Level4:draw()
	ILevel.draw(self)
end

return Level4