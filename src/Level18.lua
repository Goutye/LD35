local class = require 'EasyLD.lib.middleclass'

local ILevel = require 'ILevel'
local Level4 = class('Level4', ILevel)

function Level4:initialize(score, lvl)
	ILevel.initialize(self, score, lvl)

	self.state = "Press last letter"

	ILevel.add(self, "tca", 2, 4, "cat")
	ILevel.add(self, "gd", 5, 7, "dog")
	ILevel.add(self, "esa", 8, 10, "snake")
	ILevel.add(self, "ec", 9.5, 11.5, "circle")
	ILevel.add(self, "es", 11, 13, "square")
	ILevel.add(self, "gd", 12.5, 14.5, "dog")

	ILevel.add(self, "esa", 15, 17, "snake")
	ILevel.add(self, "tca", 16, 18, "cat")
	ILevel.add(self, "gd", 17, 19, "dog")
	ILevel.add(self, "ec", 18, 20, "circle")

	ILevel.add(self, "tca", 2 + 20, 6 + 20, "cat")
	ILevel.add(self, "gd", 3 + 20, 7 + 20, "dog")
	ILevel.add(self, "tca", 4 + 20, 8 + 20, "cat")

	ILevel.add(self, "gd", 9 + 20, 15 + 20, "dog")
	ILevel.add(self, "esa", 10 + 20, 16 + 20, "snake")
	ILevel.add(self, "tca", 11 + 20, 17 + 20, "cat")
	ILevel.add(self, "gd", 12 + 20, 18 + 20, "dog")

	ILevel.add(self, "esa", 20 + 20, 26 + 20, "snake")
	ILevel.add(self, "esa", 21 + 20, 27 + 20, "snake")
	ILevel.add(self, "gd", 22 + 20, 28 + 20, "dog")
	ILevel.add(self, "tca", 23 + 20, 29 + 20, "cat")
	ILevel.add(self, "tca", 24 + 20, 30 + 20, "cat")
	ILevel.add(self, "esa", 25 + 20, 32 + 20, "snake")

	self.timeMaxIntro = 3
	ILevel.addInstruction(self, "lastLetter", 0)
	ILevel.addInstruction(self, "aBitFaster", 1.2)
end

function Level4:update(dt)
	ILevel.update(self, dt*1.15)
end

function Level4:draw()
	ILevel.draw(self)
end

return Level4