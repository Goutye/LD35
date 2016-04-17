local class = require 'EasyLD.lib.middleclass'

local ILevel = require 'ILevel'
local Level7 = class('Level7', ILevel)

function Level7:initialize(score, lvl)
	ILevel.initialize(self, score, lvl)

	self.state = "Press last letter"
	self.isLudum = false

	ILevel.add(self, "np", 2, 4, "pentagon")
	ILevel.add(self, "et", 5, 7, "triangle")

	ILevel.add(self, "np", 8, 10, "pentagon")
	ILevel.add(self, "np", 9, 11, "pentagon")
	ILevel.add(self, "et", 10, 12, "triangle")
	ILevel.add(self, "tca", 11, 13, "cat")
	ILevel.add(self, "gd", 12, 14, "dog")
	ILevel.add(self, "et", 13, 15, "triangle")

	ILevel.add(self, "et", 16, 18, "triangle")
	ILevel.add(self, "es", 17.5, 19.5, "square")
	ILevel.add(self, "np", 18.5, 20.5, "pentagon")
	ILevel.add(self, "ec", 19.75, 21.75, "circle")

	self.timeMaxIntro = 2
	ILevel.addInstruction(self, "lastLetter", 0)
end

function Level7:update(dt)
	ILevel.update(self, dt)
end

function Level7:draw()
	ILevel.draw(self)
end

return Level7