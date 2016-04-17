local class = require 'EasyLD.lib.middleclass'

local ILevel = require 'ILevel'
local Level4 = class('Level4', ILevel)

function Level4:initialize(score, lvl)
	ILevel.initialize(self, score, lvl)

	self.state = "Press last letter"

	ILevel.add(self, "tca", 2, 6, "cat")
	ILevel.add(self, "gd", 3, 7, "dog")
	ILevel.add(self, "tca", 4, 8, "cat")

	ILevel.add(self, "gd", 9, 15, "dog")
	ILevel.add(self, "esa", 10, 16, "snake")
	ILevel.add(self, "tca", 11, 17, "cat")
	ILevel.add(self, "gd", 12, 18, "dog")

	ILevel.add(self, "esa", 20, 26, "snake")
	ILevel.add(self, "esa", 21, 27, "snake")
	ILevel.add(self, "gd", 22, 28, "dog")
	ILevel.add(self, "tca", 23, 29, "cat")
	ILevel.add(self, "tca", 24, 30, "cat")
	ILevel.add(self, "esa", 25, 32, "snake")

	self.timeMaxIntro = 3
	ILevel.addInstruction(self, "lastLetter", 0)
end

function Level4:update(dt)
	ILevel.update(self, dt)
end

function Level4:draw()
	ILevel.draw(self)
end

return Level4