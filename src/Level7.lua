local class = require 'EasyLD.lib.middleclass'

local ILevel = require 'ILevel'
local Level7 = class('Level7', ILevel)

function Level7:initialize(score, lvl)
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

	ILevel.add(self, "l", 14, 16, "ludumDare2")
	ILevel.add(self, "u", 15, 17, "empty")
	ILevel.add(self, "du", 16, 18, "empty")
	ILevel.add(self, "u", 17, 19, "empty")
	ILevel.add(self, "m", 18, 20, "empty")

	ILevel.add(self, "du", 20, 22, "empty")
	ILevel.add(self, "a", 21, 23, "empty")
	ILevel.add(self, "r", 22, 24, "empty")
	ILevel.add(self, "e", 23, 25, "empty")

	self.timeMaxIntro = 2
	ILevel.addInstruction(self, "pressEachLetter", 0)
end

function Level7:update(dt)
	ILevel.update(self, dt)
end

function Level7:draw()
	ILevel.draw(self)
end

return Level7