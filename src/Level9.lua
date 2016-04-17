local class = require 'EasyLD.lib.middleclass'

local ILevel = require 'ILevel'
local Level5 = class('Level5', ILevel)

function Level5:initialize(score, lvl)
	ILevel.initialize(self, score, lvl)

	ILevel.add(self, "ca", 2, 4, "cat")
	ILevel.add(self, "s", 5, 7, "square")
	ILevel.add(self, "c", 8, 10, "circle")
	ILevel.add(self, "sa", 9.5, 11.5, "snake")
	ILevel.add(self, "c", 11, 13, "cat")
	ILevel.add(self, "s", 12.5, 14.5, "square")

	ILevel.add(self, "sa", 15, 17, "snake")
	ILevel.add(self, "s", 16, 18, "square")
	ILevel.add(self, "ca", 17, 19, "cat")
	ILevel.add(self, "c", 18, 20, "triangle")

	self.timeMaxIntro = 2
	ILevel.addInstruction(self, "firstLetter", 0)
end

function Level5:update(dt)
	ILevel.update(self, dt)
end

function Level5:draw()
	ILevel.draw(self)
end

return Level5