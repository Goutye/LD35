local class = require 'EasyLD.lib.middleclass'

local ILevel = require 'ILevel'
local Level1 = class('Level1', ILevel)

function Level1:initialize(score, lvl)
	ILevel.initialize(self, score, lvl)


	ILevel.add(self, "s", 2, 4, "square")
	ILevel.add(self, "c", 5, 7, "circle")
	ILevel.add(self, "s", 8, 10, "square")
	ILevel.add(self, "c", 10.5, 12.5, "circle")
	ILevel.add(self, "c", 13, 15, "circle")
	ILevel.add(self, "s", 15.5, 17.5, "square")
	
	self.timeMaxIntro = 2
	ILevel.addInstruction(self, "firstLetterOfEachWord", 0)
end

function Level1:update(dt)
	ILevel.update(self, dt)
end

function Level1:draw()
	ILevel.draw(self)
end

return Level1