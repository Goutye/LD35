local class = require 'EasyLD.lib.middleclass'

local ILevel = require 'ILevel'
local Level4 = class('Level4', ILevel)

function Level4:initialize(score, lvl)
	ILevel.initialize(self, score, lvl)

	ILevel.add(self, "ca", 2, 3.5, "cat")
	ILevel.add(self, "d", 2.75, 4.25, "dog")
	ILevel.add(self, "sa", 3.5, 5, "snake")
	ILevel.add(self, "d", 4.25, 5.75, "dog")

	ILevel.add(self, "sa", 8, 9.5, "snake")
	ILevel.add(self, "ca", 8.75, 10.25, "cat")
	ILevel.add(self, "sa", 9.5, 11, "snake")
	ILevel.add(self, "ca", 10.25, 11.75, "cat")
	ILevel.add(self, "ca", 11, 12.5, "cat")
	ILevel.add(self, "d", 11.75, 13.25, "dog")

	self.timeMaxIntro = 3
	ILevel.addInstruction(self, "firstLetter", 0)
	ILevel.addInstruction(self, "aBitFaster", 1)
end

function Level4:update(dt)
	ILevel.update(self, dt)
end

function Level4:draw()
	ILevel.draw(self)
end

return Level4