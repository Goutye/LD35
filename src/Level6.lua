local class = require 'EasyLD.lib.middleclass'

local ILevel = require 'ILevel'
local Level6 = class('Level6', ILevel)

function Level6:initialize(score, lvl)
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

	self.timeMaxIntro = 2
	ILevel.addInstruction(self, "lastLetter", 0)
end

function Level6:update(dt)
	ILevel.update(self, dt)
end

function Level6:draw()
	ILevel.draw(self)
end

return Level6