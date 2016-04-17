local class = require 'EasyLD.lib.middleclass'

local ILevel = require 'ILevel'
local Level4 = class('Level4', ILevel)

function Level4:initialize(score, lvl)
	ILevel.initialize(self, score, lvl)

	ILevel.add(self, "ca", 2, 4, "cat")
	ILevel.add(self, "d", 5, 7, "dog")
	ILevel.add(self, "sa", 8, 10, "snake")
	ILevel.add(self, "d", 9.5, 11.5, "dog")
	ILevel.add(self, "sa", 11, 13, "snake")
	ILevel.add(self, "ca", 12.5, 14.5, "cat")

	ILevel.add(self, "sa", 15, 17, "snake")
	ILevel.add(self, "ca", 16, 18, "cat")
	ILevel.add(self, "ca", 17, 19, "cat")
	ILevel.add(self, "d", 18, 20, "dog")

	ILevel.add(self, "sa", 21, 23, "snake")

	self.timeMaxIntro = 2
	ILevel.addInstruction(self, "firstLetter", 0)
end

function Level4:update(dt)
	ILevel.update(self, dt)
end

function Level4:draw()
	ILevel.draw(self)
end

return Level4