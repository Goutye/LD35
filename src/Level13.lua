local class = require 'EasyLD.lib.middleclass'

local ILevel = require 'ILevel'
local Level4 = class('Level4', ILevel)

function Level4:initialize(score, lvl)
	ILevel.initialize(self, score, lvl)

	ILevel.add(self, "t", 0, 4, "empty")
	ILevel.add(self, "s", 2, 6, "square")
	ILevel.add(self, "c", 6, 8, "empty")

	ILevel.add(self, "c", 9.5, 11.5, "circle")
	ILevel.add(self, "t", 9, 14, "empty")
	ILevel.add(self, "s", 12, 15.75, "square")
	ILevel.add(self, "c", 13, 17.5, "empty")
	ILevel.add(self, "t", 16.75, 18.75, "triangle")

	ILevel.add(self, "c", 19, 21, "circle")
	ILevel.add(self, "t", 20, 22, "triangle")
	ILevel.add(self, "t", 20.5, 22.75, "empty")
	ILevel.add(self, "s", 21, 23.75, "square")
	ILevel.add(self, "c", 22, 24.75, "empty")
	ILevel.add(self, "t", 23.75, 25.75, "triangle")

	self.timeMaxIntro = 7.2
	ILevel.addInstruction(self, "firstLetter", 0)
	ILevel.addInstruction(self, "payAttention", 1)
	ILevel.addInstruction(self, "triangleBeforeSquare", 2)
	ILevel.addInstruction(self, "circleAfterSquare", 5)
end

function Level4:update(dt)
	ILevel.update(self, dt)
end

function Level4:draw()
	ILevel.draw(self)
end

return Level4