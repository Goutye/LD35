local class = require 'EasyLD.lib.middleclass'

local ILevel = require 'ILevel'
local Level3 = class('Level3', ILevel)

function Level3:initialize(score, lvl)
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

	self.timeMaxIntro = 2
	ILevel.addInstruction(self, "firstLetter", 0)
end

function Level3:update(dt)
	ILevel.update(self, dt)
end

function Level3:draw()
	ILevel.draw(self)
end

return Level3