local class = require 'EasyLD.lib.middleclass'

local ILevel = require 'ILevel'
local Level4 = class('Level4', ILevel)

function Level4:initialize(score, lvl)
	ILevel.initialize(self, score, lvl)

	ILevel.add(self, "p", 2, 5, "pentagon")
	ILevel.add(self, "t", 3, 6, "triangle")

	ILevel.add(self, "p", 8, 13, "pentagon")
	ILevel.add(self, "t", 9, 14, "triangle")
	ILevel.add(self, "c", 10, 15, "circle")
	ILevel.add(self, "p", 11, 16, "pentagon")

	ILevel.add(self, "c", 19, 21, "circle")
	ILevel.add(self, "p", 20, 22, "pentagon")
	ILevel.add(self, "t", 21, 23, "triangle")

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