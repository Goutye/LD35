local class = require 'EasyLD.lib.middleclass'

local ILevel = require 'ILevel'
local Level4 = class('Level4', ILevel)

function Level4:initialize(score, lvl)
	ILevel.initialize(self, score, lvl)

	self.state = "Press each letter"
	self.isLudum = true

	ILevel.add(self, "l", 2, 3.5, "ludumDare")
	ILevel.add(self, "u", 2.75, 4.25, "empty")
	ILevel.add(self, "du", 3.5, 5, "empty")
	ILevel.add(self, "u", 4.25, 5.75, "empty")
	ILevel.add(self, "m", 5, 6.5, "empty")

	ILevel.add(self, "du", 6.25, 7.75, "empty")
	ILevel.add(self, "a", 7, 8.5, "empty")
	ILevel.add(self, "r", 7.75, 9.25, "empty")
	ILevel.add(self, "e", 8.5, 10, "empty")

	ILevel.add(self, "l", 12, 13.5, "ludumDare2")
	ILevel.add(self, "u", 12.75, 14.25, "empty")
	ILevel.add(self, "du", 13.5, 15, "empty")
	ILevel.add(self, "u", 14.25, 15.75, "empty")
	ILevel.add(self, "m", 15, 16.5, "empty")

	ILevel.add(self, "du", 16.25, 17.75, "empty")
	ILevel.add(self, "a", 17, 18.5, "empty")
	ILevel.add(self, "r", 17.75, 19.25, "empty")
	ILevel.add(self, "e", 18.5, 20, "empty")

	self.timeMaxIntro = 3
	ILevel.addInstruction(self, "pressEachLetter", 0)
	ILevel.addInstruction(self, "aBitFaster", 1)
end

function Level4:update(dt)
	ILevel.update(self, dt)
end

function Level4:draw()
	ILevel.draw(self)
end

return Level4