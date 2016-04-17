local class = require 'EasyLD.lib.middleclass'

local ILevel = require 'ILevel'
local Level3 = class('Level3', ILevel)

function Level3:initialize(score, lvl)
	ILevel.initialize(self, score, lvl)

	ILevel.add(self, "s", 3, 5, "square")
	ILevel.add(self, "c", 5, 7.5, "empty")

	ILevel.add(self, "s", 8, 10, "square")
	ILevel.add(self, "c", 10, 12, "empty")

	ILevel.add(self, "c", 13, 15, "circle")
	ILevel.add(self, "s", 14.5, 16.5, "square")
	ILevel.add(self, "c", 16.5, 18.5, "empty")

	self.timeMaxIntro = 5
	ILevel.addInstruction(self, "firstLetter", 0)
	ILevel.addInstruction(self, "payAttention", 1.3)
	ILevel.addInstruction(self, "circleAfterSquare", 2.3)

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