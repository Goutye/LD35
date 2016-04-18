local class = require 'EasyLD.lib.middleclass'

local ILevel = require 'ILevel'
local Level4 = class('Level4', ILevel)

function Level4:initialize(score, lvl)
	ILevel.initialize(self, score, lvl)

	ILevel.add(self, "p", 2, 4, "pentagon")
	ILevel.add(self, "t", 5, 7, "triangle")

	ILevel.add(self, "p", 8, 10, "pentagon")
	ILevel.add(self, "p", 9, 11, "pentagon")
	ILevel.add(self, "t", 10, 12, "triangle")
	ILevel.add(self, "ca", 11, 13, "cat")
	ILevel.add(self, "d", 12, 14, "dog")
	ILevel.add(self, "t", 13, 15, "triangle")

	ILevel.add(self, "t", 16, 18, "triangle")
	ILevel.add(self, "s", 17.5, 19.5, "square")
	ILevel.add(self, "p", 18.5, 20.5, "pentagon")
	ILevel.add(self, "c", 19.75, 21.75, "circle")

	ILevel.add(self, "ca", 23, 25, "cat")
	ILevel.add(self, "s", 24, 26, "square")
	ILevel.add(self, "c", 25, 27, "circle")
	ILevel.add(self, "sa", 29.5, 31.5, "snake")
	ILevel.add(self, "c", 31, 33, "cat")
	ILevel.add(self, "s", 32, 34, "square")

	ILevel.add(self, "sa", 35, 37, "snake")
	ILevel.add(self, "s", 36, 38, "square")
	ILevel.add(self, "ca", 37, 39, "cat")
	ILevel.add(self, "p", 38, 40, "pentagon")

	self.timeMaxIntro = 3
	ILevel.addInstruction(self, "firstLetter", 0)
	ILevel.addInstruction(self, "aBitFaster", 1)
end

function Level4:update(dt)
	ILevel.update(self, dt * 1.3)
end

function Level4:draw()
	ILevel.draw(self)
end

return Level4