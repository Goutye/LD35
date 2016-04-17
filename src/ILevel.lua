local class = require 'EasyLD.lib.middleclass'

local ILevel = class('ILevel')

local sfx = {}
sfx.valid = EasyLD.sfx:new("assets/sfx/valid.wav")
sfx.fail = EasyLD.sfx:new("assets/sfx/fail2.wav")
sfx.shift = EasyLD.sfx:new("assets/sfx/shift.wav")

local voice = {}
voice.square = EasyLD.sfx:new("assets/voices/square.wav", 1)
voice.snake = EasyLD.sfx:new("assets/voices/snake.wav", 1)
voice.pentagon = EasyLD.sfx:new("assets/voices/pentagon.wav", 1)
voice.triangle = EasyLD.sfx:new("assets/voices/triangle.wav", 1)
voice.dog = EasyLD.sfx:new("assets/voices/dog.wav", 1)
voice.cat = EasyLD.sfx:new("assets/voices/cat.wav", 1)
voice.ludumDare = EasyLD.sfx:new("assets/voices/ludumDare.wav", 1)
voice.ludumDare2 = EasyLD.sfx:new("assets/voices/ludumDare2.wav", 1)
voice.circle = EasyLD.sfx:new("assets/voices/circle.wav", 1)
voice.empty = EasyLD.sfx:new("assets/voices/empty.wav", 1)

local voiceInstru = {}

voiceInstru.aBitFaster = EasyLD.sfx:new("assets/voices/aBitFaster.wav", 1)
voiceInstru.beCareful = EasyLD.sfx:new("assets/voices/beCareful.wav", 1)
voiceInstru.dogChasingCat = EasyLD.sfx:new("assets/voices/dogChasingCat.wav", 1)
voiceInstru.firstLetter = EasyLD.sfx:new("assets/voices/firstLetter.wav", 1)
voiceInstru.firstLetterOfEachWord = EasyLD.sfx:new("assets/voices/firstLetterOfEachWord.wav", 1)
voiceInstru.lastLetter = EasyLD.sfx:new("assets/voices/lastLetter.wav", 1)
voiceInstru.pressEachLetter = EasyLD.sfx:new("assets/voices/pressEachLetter.wav", 1)
voiceInstru.triangleBeforeSquare = EasyLD.sfx:new("assets/voices/triangleBeforeSquare.wav", 1)

local surf = nil
local system = nil
local systemFail = nil

local surface = {}
local system = {}
local systemUpdate = {}

function ILevel:initialize(score, lvl)
	self.voiceTimeTable = {} --Time where the voice is displayed
	self.voiceTable = {} --Voice
	self.eventTable = {} --Square ? Triangle ?
	self.eventTimeTable = {} --Time where you have to be Square, triangle, etc
	self.currentEvent = 1
	self.currentVoice = 1

	self.isLudum = false
	self.state = "Press First letter" --Your state
	self.time = 0
	self.timeIntro = 0
	self.timeMaxIntro = 2

	self.instructions = {}
	self.instructionsTime = {}
	self.currentInstruction = 1

	self.level = lvl or 1

	self.point = 0
	self.combo = 1

	if score ~= nil then
		self.point = score.point
		self.combo = score.combo
	end

	self.pointDisplay = self.point
	self.timerPoint = nil
	self.basePoint = 100

	self.levelSuccess = false

	if surf == nil then
		self:initShape()

		system.s = self:newSystem(surface.s)
		system.sa = self:newSystem("assets/images/snake.png")
		system.es = system.s
		system.esa = system.sa

		system.c = self:newSystem(surface.c)
		system.ec = system.c
		system.ca = self:newSystem("assets/images/cat.png")
		system.tca = system.ca

		system.t = self:newSystem(surface.t)
		system.et = system.t

		system.p = self:newSystem(surface.p)
		system.np = system.p

		system.d = self:newSystem("assets/images/dog.png")
		system.gd = system.d



		table.insert(systemUpdate, system.s)
		table.insert(systemUpdate, system.d)
		table.insert(systemUpdate, system.sa)
		table.insert(systemUpdate, system.c)
		table.insert(systemUpdate, system.ca)
		table.insert(systemUpdate, system.p)
		table.insert(systemUpdate, system.t)

		local letters = {"l", "u", "du", "m", "a", "r", "e"}
		for _,v in ipairs(letters) do
			system[v] = self:newSystem(surface[v])
			system[v]:setSizes({[0] = 32,
					[0.3] = 128,
					[0.7] = 64,
					[1] = 16})
			table.insert(systemUpdate, system[v])
		end

		systemFail = EasyLD.particles:new(EasyLD.point:new(WINDOW_WIDTH/2, WINDOW_HEIGHT/2), surface.c)
		systemFail:setEmissionRate(10)
		systemFail:setLifeTime(2)
		systemFail:setInitialVelocity(400)
		systemFail:setInitialAcceleration(00)
		systemFail:setDirection(0, math.pi*2)
		systemFail:setColors({[0] = EasyLD.color:new(0,0,0,200), 
						[0.1] = EasyLD.color:new(255,255,255,200), 
						[0.5] = EasyLD.color:new(120,120,125,150), 
						[1] = EasyLD.color:new(0,0,0,00)})
		systemFail:setSizes({[0] = 64,
						[0.1] = 256,
						[0.5] = 64,
						[1] = 16})
		systemFail:setDuration(0.8)
		systemFail:setEmissionRate({[0] = 10, [0.5] = 50, [0.7] = 25, [1] = 10}, {"quadinout", "linear", "bounceout"})
		systemFail:setRelativeRotation(6)
	end

	self.system = system
end

function ILevel:newSystem(surf)
	s = EasyLD.particles:new(EasyLD.point:new(WINDOW_WIDTH/2, WINDOW_HEIGHT/2), surf)
	s:setEmissionRate(10)
	s:setLifeTime(4)
	s:setInitialVelocity(200)
	s:setInitialAcceleration(00)
	s:setDirection(0, math.pi*2)
	s:setColors({[0] = EasyLD.color:new(255,0,0,200), 
					[0.3] = EasyLD.color:new(255,0,255,200), 
					[0.7] = EasyLD.color:new(0,0,255,150), 
					[1] = EasyLD.color:new(0,0,255,00)})
	s:setSizes({[0] = 32,
					[0.3] = 64,
					[0.7] = 32,
					[1] = 16})
	s:setDuration(1)
	s:setEmissionRate({[0] = 2, [0.5] = 100, [0.7] = 50, [1] = 10}, {"quadinout", "linear", "bounceout"})
	s:setSpinEmitter(math.pi/2)
	s:setRelativeRotation(9)
	return s
end

function ILevel:initShape()
	local p = {}
	local point = EasyLD.point:new(32, 0)
	table.insert(p, point)
	for i = 1, 4 do
		point = point:copy()
		point:rotate(2*math.pi/5, 32, 32)
		table.insert(p, point)
	end
	local pentagon = EasyLD.polygon:new("fill", nil, unpack(p))

	surface.p = EasyLD.surface:new(64,64)
	surface.p:drawOn()
	pentagon:draw()
	EasyLD.surface:drawOnScreen()

	surface.s = EasyLD.surface:new(64,64)
	surface.s:drawOn()
	EasyLD.box:new(0,0,64,64):draw()
	EasyLD.surface:drawOnScreen()

	surface.c = EasyLD.surface:new(64,64)
	surface.c:drawOn()
	EasyLD.circle:new(32,32,32):draw()
	EasyLD.surface:drawOnScreen()

	local p = {}
	local point = EasyLD.point:new(32, 0)
	table.insert(p, point)
	for i = 1, 4 do
		point = point:copy()
		point:rotate(2*math.pi/3, 32, 32)
		table.insert(p, point)
	end
	local triangle = EasyLD.polygon:new("fill", nil, unpack(p))

	surface.t = EasyLD.surface:new(64,64)
	surface.t:drawOn()
	triangle:draw()
	EasyLD.surface:drawOnScreen()

	local letters = {"l", "u", "du", "m", "a", "r", "e"}
	for _,v in ipairs(letters) do
		surface[v] = EasyLD.surface:new(64,64)
		surface[v]:drawOn()
		font:print(string.sub(v, 1, 1), 80, EasyLD.box:new(0, 0, 64, 64), "center", "center", EasyLD.color:new(255,255,255))
		EasyLD.surface:drawOnScreen()
	end
end

function ILevel:intro()
	if math.floor(self.timeIntro * 10) % 2 == 0 then
		if not self.clign then
			self.clign = true
			--sfx.valid:play()
		end
	else
		self.clign = false
	end

	if self.currentInstruction <= #self.instructions and self.timeIntro >= self.instructionsTime[self.currentInstruction] then
		self.instructions[self.currentInstruction]:play()
		self.currentInstruction = self.currentInstruction + 1
	end
end

function ILevel:update(dt)
	if self.timeIntro < self.timeMaxIntro then
		self.timeIntro = self.timeIntro + dt
		self:intro()
		return
	else
		self.time = self.time + dt
	end

	if EasyLD.keyboard:lastKeyPressed() ~= nil then
		self.state = EasyLD.keyboard:lastKeyPressed()
		sfx.shift:play()
	end

	if self.currentVoice <= #self.voiceTable then
		if self.time >= self.voiceTimeTable[self.currentVoice] then
			self.voiceTable[self.currentVoice]:play()

			self.currentVoice = self.currentVoice + 1
		end
	end

	if self.currentEvent <= #self.eventTable then
		if self.time >= self.eventTimeTable[self.currentEvent] then
			if self.state == string.sub(self.eventTable[self.currentEvent], 1, 1) then
				self.point = self.point + 1 * self.combo * self.basePoint
				self.combo = self.combo + 1
				self:onValid()

				if self.timerPoint then
					self.timerPoint:stop()
				end

				self.timerPoint = EasyLD.flux.to(self, (0.5 + 0.1 * self.combo), {pointDisplay = self.point}):ease("quadout")
			else
				self.combo = 1
				self:onFail()
			end

			self.currentEvent = self.currentEvent + 1
		end
	end

	if self.currentEvent > #self.eventTable and not self.levelSuccess then
		self.levelSuccess = true
		
		self.timer = EasyLD.timer.after(2, function () 
											self:onSuccess()
											end)
	end

	for _,v in pairs(systemUpdate) do
		v:update(dt)
	end
	systemFail:update(dt)
end
function ILevel:randomPos()
	return EasyLD.window.w/2, EasyLD.window.h/2--math.random(EasyLD.window.w/4, EasyLD.window.w/4*2), math.random(EasyLD.window.h/4, EasyLD.window.h/4*2)
end

function ILevel:onSuccess()
	local i = 0
	for _,v in pairs(systemUpdate) do
		if self.isLudum then
			if i >= 7 then
				v:start()
			end
		else
			if i >= 7 then return end
			v:start()
		end

		i = i + 1
	end
end

function ILevel:onValid()
	sfx.valid:play()
	system[self.eventTable[self.currentEvent]].follower:moveTo(self:randomPos())
	system[self.eventTable[self.currentEvent]]:stop()
	system[self.eventTable[self.currentEvent]]:start()
end

function ILevel:onFail()
	sfx.fail:play()
	systemFail:start()
	EasyLD.camera:shake({x = 10, y = 10}, 1, "quadout")
end

function ILevel:add(state, timeVoice, timeEvent, voiceSound)
	table.insert(self.eventTable, state)
	table.insert(self.eventTimeTable, timeEvent)
	table.insert(self.voiceTable, voice[voiceSound])
	table.insert(self.voiceTimeTable, timeVoice)
end

function ILevel:addInstruction(voiceSound, time)
	table.insert(self.instructions, voiceInstru[voiceSound])
	table.insert(self.instructionsTime, time)
end

function ILevel:getInfo()
	return {point = self.point, combo = self.combo}
end

function ILevel:drawIntro()
	if math.floor(self.timeIntro * 10) % 2 == 0 then
		font:printOutLine("Level " .. self.level, 80, EasyLD.box:new(0, 0,EasyLD.window.w, EasyLD.window.h), "center", "center", EasyLD.color:new(255,255,255), EasyLD.color:new(0,0,0), 1)
	else
		font:printOutLine("Level " .. self.level, 80, EasyLD.box:new(0, 0,EasyLD.window.w, EasyLD.window.h), "center", "center", EasyLD.color:new(255,0,math.random(100, 255)), EasyLD.color:new(0,0,0), 1)
	end
end

function ILevel:draw()
	systemFail:draw()

	if self.timeIntro >= self.timeMaxIntro then
		font:printOutLine(self.state, 80, EasyLD.box:new(0, 0,EasyLD.window.w, EasyLD.window.h), "center", "center", EasyLD.color:new(255,255,255, 255), EasyLD.color:new(0,0,0), 1)
	end

	font:printOutLine("Level " .. self.level, 40, EasyLD.box:new(10, 0,EasyLD.window.w, EasyLD.window.h), "left", "top", EasyLD.color:new(255,255,255), EasyLD.color:new(0,0,0), 1)
	font:printOutLine(math.ceil(self.pointDisplay), 64, EasyLD.box:new(0, 0,EasyLD.window.w, EasyLD.window.h), "center", "top", EasyLD.color:new(255,255,255), EasyLD.color:new(0,0,0), 1)
	font:printOutLine("x".. self.combo, 60, EasyLD.box:new(0, 0,EasyLD.window.w - 10, EasyLD.window.h), "right", "top", EasyLD.color:new(255,255,255), EasyLD.color:new(0,0,0), 1)
	for _,v in pairs(systemUpdate) do
		v:draw()
	end

	if self.timeIntro < self.timeMaxIntro then
		self:drawIntro()
	end
end

return ILevel