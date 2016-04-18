local class = require 'EasyLD.lib.middleclass'

local TextUp = class('TextUp')

function TextUp:initialize(score, combo)
	self.box = EasyLD.box:new(EasyLD.window.w/2 - 50, EasyLD.window.h/2 - 30, 100, 60)
	self.score = "+"..score
	self.size = 20 + (math.ceil(combo / 5) * 10)
	self.v = EasyLD.vector:new((math.random() - 0.5), -0.5)
	self.v:normalize()
	self.v = self.v * 150

	self.color = EasyLD.color:new(255, 255, 255)
	self.mid = EasyLD.window.h/4
end

function TextUp:update(dt)
	if self.box.y < -50 then return end
	self.box:moveTo(self.box.x + self.v.x * dt, self.box.y + self.v.y * dt)
	self.color.a = math.min(math.max(self.box.y, 0) / self.mid, 1) * 255
end

function TextUp:draw()
	if self.box.y < -50 then return end
	font:print(self.score, self.size, self.box, "center", "center", self.color)
end

return TextUp