local class = require 'EasyLD.lib.middleclass'

local ILevel = require 'ILevel'
local Level4 = class('Level4', ILevel)

function Level4:initialize(score, lvl)
	ILevel.initialize(self, score, lvl)

	ILevel.add(self, "d", 2, 4, "dog")
	ILevel.add(self, "ca", 4, 6, "empty")
	ILevel.add(self, "d", 6.5, 8.5, "dog")
	ILevel.add(self, "ca", 8.5, 10.5, "empty")
	ILevel.add(self, "ca", 11, 13, "cat")
	ILevel.add(self, "d", 12.5, 14.5, "dog")
	ILevel.add(self, "ca", 14.5, 16.5, "empty")

	self.timeMaxIntro = 3
	ILevel.addInstruction(self, "firstLetter", 0)
	ILevel.addInstruction(self, "beCareful", 1)
	ILevel.addInstruction(self, "dogChasingCat", 2)
end

function Level4:update(dt)
	ILevel.update(self, dt)
end

function Level4:draw()
	ILevel.draw(self)
end

return Level4