local class = require 'EasyLD.lib.middleclass'

local ILevel = require 'ILevel'
local Level2 = class('Level2', ILevel)

function Level2:initialize(score, lvl)
	ILevel.initialize(self, score, lvl)

	ILevel.add(self, "s", 2.5, 4.5, "square")
	ILevel.add(self, "c", 5, 7, "circle")
	ILevel.add(self, "s", 8, 10, "square")
	ILevel.add(self, "c", 9.5, 11.5, "circle")
	ILevel.add(self, "c", 11, 13, "circle")
	ILevel.add(self, "s", 12.5, 14.5, "square")

	ILevel.add(self, "s", 15, 17, "square")
	ILevel.add(self, "s", 16, 18, "square")
	ILevel.add(self, "s", 17, 19, "square")
	ILevel.add(self, "c", 18, 20, "circle")

	self.timeMaxIntro = 2
	ILevel.addInstruction(self, "firstLetter", 0)
end

function Level2:update(dt)
	ILevel.update(self, dt)
end

function Level2:draw()
	ILevel.draw(self)
end

return Level2