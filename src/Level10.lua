local class = require 'EasyLD.lib.middleclass'

local ILevel = require 'ILevel'
local Level7 = class('Level7', ILevel)

function Level7:initialize(score, lvl)
	ILevel.initialize(self, score, lvl)

	self.state = "Press each letter"
	self.isLudum = true

	ILevel.add(self, "sa", 2, 4, "square")
	ILevel.add(self, "q", 3, 5, "empty")
	ILevel.add(self, "u", 4, 6, "empty")
	ILevel.add(self, "a", 5, 7, "empty")
	ILevel.add(self, "r", 6, 8, "empty")
	ILevel.add(self, "e", 7, 9, "empty")

	ILevel.add(self, "c", 13, 15, "circle")
	ILevel.add(self, "i", 14, 16, "empty")
	ILevel.add(self, "r", 15, 17, "empty")
	ILevel.add(self, "c", 16, 18, "empty")
	ILevel.add(self, "l", 17, 19, "empty")
	ILevel.add(self, "e", 18, 20, "empty")

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