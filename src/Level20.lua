local class = require 'EasyLD.lib.middleclass'

local ILevel = require 'ILevel'
local Level7 = class('Level7', ILevel)

function Level7:initialize(score, lvl)
	ILevel.initialize(self, score, lvl)

	self.state = "Press each letter"
	self.isLudum = true

	ILevel.add(self, "p", 2, 5, "pentagon")
	ILevel.add(self, "t", 3, 6, "triangle")
	ILevel.add(self, "s", 8, 10, "square")
	ILevel.add(self, "c", 9, 11, "empty")
	ILevel.add(self, "p", 10, 12, "empty")
	ILevel.add(self, "c", 11, 13, "circle")
	ILevel.add(self, "p", 12, 14, "empty")
	ILevel.add(self, "p", 13, 15, "pentagon")
	ILevel.add(self, "t", 14, 16, "triangle")
	ILevel.add(self, "ca", 16, 18, "cat")

	ILevel.add(self, "gd", 22.5, 24.5, "dog")
	ILevel.add(self, "tca", 23.5, 25.5, "empty")
	ILevel.add(self, "et", 25, 27, "triangle")
	ILevel.add(self, "esa", 26, 28, "snake")
	ILevel.add(self, "gd", 27, 29, "dog")
	ILevel.add(self, "tca", 28, 30, "empty")
	ILevel.add(self, "esa", 29, 31, "snake")
	ILevel.add(self, "es", 30, 32, "square")
	ILevel.add(self, "ec", 31, 33, "empty")
	ILevel.add(self, "np", 32, 34, "empty")
	ILevel.add(self, "gd", 35, 37, "dog")
	ILevel.add(self, "tca", 36, 38, "empty")

	ILevel.add(self, "l", 14 + 30, 16 + 30, "ludumDare2")
	ILevel.add(self, "u", 15 + 30, 17 + 30, "empty")
	ILevel.add(self, "du", 16 + 30, 18 + 30, "empty")
	ILevel.add(self, "u", 17 + 30, 19 + 30, "empty")
	ILevel.add(self, "m", 18 + 30, 20 + 30, "empty")

	ILevel.add(self, "du", 20 + 30, 22 + 30, "empty")
	ILevel.add(self, "a", 21 + 30, 23 + 30, "empty")
	ILevel.add(self, "r", 22 + 30, 24 + 30, "empty")
	ILevel.add(self, "e", 23 + 30, 25 + 30, "empty")

	self.timeMaxIntro = 10
	ILevel.addInstruction(self, "firstLetter", 0)
	ILevel.addInstruction(self, "pentagonAfterCircle", 1.5)
	ILevel.addInstruction(self, "circleAfterSquare", 4.5)
	ILevel.addInstruction(self, "dogChasingCat", 7.5)

	self.press = false
	self.back = false
end

function Level7:update(dt)
	if self.time >= 44 then dt = dt * 1.5 end
	ILevel.update(self, dt)

	if self.time >= 20 and not self.back then
		ILevel.addInstruction(self, "lastLetter", 2)
		self.state = "Press last letter"
		self.instructions[5]:play()
		self.back = true
	else 
		if self.time >= 40 and not self.press then
			self.state = "Press each letter"
			ILevel.addInstruction(self, "pressEachLetter", 3)
			ILevel.addInstruction(self, "aBitFaster", 3)
			self.instructions[6]:play()
			self.timerrr = EasyLD.timer.after(1.5, function() self.instructions[7]:play() end)
			self.press = true
		end
	end
end

function Level7:draw()
	ILevel.draw(self)
end

return Level7