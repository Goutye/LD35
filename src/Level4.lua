local class = require 'EasyLD.lib.middleclass'

local ILevel = require 'ILevel'
local Level3 = class('Level3', ILevel)

function Level3:initialize(score, lvl)
	ILevel.initialize(self, score, lvl)

	ILevel.add(self, "t", 2, 5.5, "empty")
	ILevel.add(self, "s", 2.5, 7.5, "square")
	ILevel.add(self, "c", 8, 10, "circle")

	ILevel.add(self, "t", 10, 13, "empty")
	ILevel.add(self, "s", 11, 15, "square")
	ILevel.add(self, "c", 16, 18, "circle")
	ILevel.add(self, "t", 17.5, 19.5, "triangle")

	ILevel.add(self, "c", 20, 22, "circle")

	self.timeMaxIntro = 4
	ILevel.addInstruction(self, "firstLetter", 0)
	ILevel.addInstruction(self, "beCareful", 1.3)
	ILevel.addInstruction(self, "triangleBeforeSquare", 2.3)

	self.timePause = 0
end

function Level3:update(dt)
	if self.hasFailed ~= nil then
		self:hasFailedOn(self.hasFailed)
		print(self.hasFailed)
		self.hasFailed = nil
	end

	if self.timePause <= 0 then
		ILevel.update(self, dt)
	else
		self.timePause = self.timePause - dt
		ILevel.update(self, dt)
	end
end

function Level3:draw()
	ILevel.draw(self)
end

function Level3:hasFailedOn(ev)
	if ev == "t" then
		self.timePause = 2
		self.instructions[3]:play()
	end
end

return Level3