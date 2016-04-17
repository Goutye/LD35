local class = require 'EasyLD.lib.middleclass'

local ILevel = require 'ILevel'
local Level4 = class('Level4', ILevel)

function Level4:initialize(score, lvl)
	ILevel.initialize(self, score, lvl)

	ILevel.add(self, "ca", 0, 4, "cat")
	ILevel.add(self, "s", 2, 6, "square")
	ILevel.add(self, "c", 6, 8, "empty")

	ILevel.add(self, "d", 9.5, 11.5, "dog")
	ILevel.add(self, "ca", 10, 13, "empty")
	ILevel.add(self, "s", 12, 15.75, "square")
	ILevel.add(self, "c", 13, 17.5, "empty")
	ILevel.add(self, "ca", 16.75, 18.75, "cat")

	ILevel.add(self, "c", 19, 21, "circle")
	ILevel.add(self, "s", 20, 22, "square")
	ILevel.add(self, "c", 20.5, 22.75, "empty")
	ILevel.add(self, "d", 21, 23.75, "dog")
	ILevel.add(self, "ca", 22, 24.75, "empty")
	ILevel.add(self, "t", 23.75, 25.75, "triangle")

	self.timeMaxIntro = 7.2
	ILevel.addInstruction(self, "firstLetter", 0)
	ILevel.addInstruction(self, "beCareful", 1)
	ILevel.addInstruction(self, "dogChasingCat", 2)
	ILevel.addInstruction(self, "circleAfterSquare", 4)
end

function Level4:update(dt)
	ILevel.update(self, dt)
end

function Level4:draw()
	ILevel.draw(self)
end

return Level4