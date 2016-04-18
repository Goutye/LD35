local class = require 'EasyLD.lib.middleclass'

local IScreen = require 'EasyLD.IScreen'
local TitleScreen = class('TitleScreen', IScreen)

local GameScreen = require 'screens.GameScreen'

local surface = {}

local music = {}
music[1] = EasyLD.music:new("assets/music/music1.wav", "static")
music[1]:setVolume(0.2)
music[2] = EasyLD.music:new("assets/music/music1.wav", "static")
music[2]:setVolume(0.2)
playlist = nil


function TitleScreen:initialize()
	self.playlist = EasyLD.playlist:new("background", nil, true)
	self.playlist:add(music[1])
	self.playlist:add(music[2])
	playlist = self.playlist
	self.playlist:play()
	self:initShape()

	self.s = EasyLD.particles:new(EasyLD.point:new(0, 0), "assets/images/dog.png")
	self.s:setEmissionRate(20)
	self.s:setLifeTime(4)
	self.s:setInitialVelocity(200)
	self.s:setInitialAcceleration(00)
	self.s:setDirection(-math.pi/4, math.pi/2)
	self.s:setColors({[0] = EasyLD.color:new(255,0,0,200), 
					[0.3] = EasyLD.color:new(255,0,255,200), 
					[0.7] = EasyLD.color:new(0,0,255,150), 
					[1] = EasyLD.color:new(0,0,255,00)})
	self.s:setSizes({[0] = 32,
					[0.3] = 64,
					[0.7] = 32,
					[1] = 16})
	--self.s:setSpinEmitter(math.pi/2)
	self.s:setRelativeRotation(9)
	self.s:start()

	self.s2 = EasyLD.particles:new(EasyLD.point:new(WINDOW_WIDTH, 0), "assets/images/cat.png")
	self.s2:setEmissionRate(20)
	self.s2:setLifeTime(4)
	self.s2:setInitialVelocity(200)
	self.s2:setInitialAcceleration(00)
	self.s2:setDirection(-3*math.pi/4, math.pi/2)
	self.s2:setColors({[0] = EasyLD.color:new(255,0,0,200), 
					[0.3] = EasyLD.color:new(255,0,255,200), 
					[0.7] = EasyLD.color:new(0,0,255,150), 
					[1] = EasyLD.color:new(0,0,255,00)})
	self.s2:setSizes({[0] = 32,
					[0.3] = 64,
					[0.7] = 32,
					[1] = 16})
	--self.s2:setSpinEmitter(math.pi/2)
	self.s2:setRelativeRotation(2)
	self.s2:start()

	self.s3 = EasyLD.particles:new(EasyLD.point:new(0, WINDOW_HEIGHT), surface.p)
	self.s3:setEmissionRate(20)
	self.s3:setLifeTime(4)
	self.s3:setInitialVelocity(200)
	self.s3:setInitialAcceleration(00)
	self.s3:setDirection(math.pi/4, math.pi/2)
	self.s3:setColors({[0] = EasyLD.color:new(255,0,0,200), 
					[0.3] = EasyLD.color:new(255,0,255,200), 
					[0.7] = EasyLD.color:new(0,0,255,150), 
					[1] = EasyLD.color:new(0,0,255,00)})
	self.s3:setSizes({[0] = 32,
					[0.3] = 64,
					[0.7] = 32,
					[1] = 16})
	--self.s3:setSpinEmitter(math.pi/2)
	self.s3:setRelativeRotation(2)
	self.s3:start()

	self.s4 = EasyLD.particles:new(EasyLD.point:new(WINDOW_WIDTH, WINDOW_HEIGHT), surface.t)
	self.s4:setEmissionRate(20)
	self.s4:setLifeTime(4)
	self.s4:setInitialVelocity(200)
	self.s4:setInitialAcceleration(00)
	self.s4:setDirection(3*math.pi/4, math.pi/2)
	self.s4:setColors({[0] = EasyLD.color:new(255,0,0,200), 
					[0.3] = EasyLD.color:new(255,0,255,200), 
					[0.7] = EasyLD.color:new(0,0,255,150), 
					[1] = EasyLD.color:new(0,0,255,00)})
	self.s4:setSizes({[0] = 32,
					[0.3] = 64,
					[0.7] = 32,
					[1] = 16})
	--self.s4:setSpinEmitter(math.pi/2)
	self.s4:setRelativeRotation(2)
	self.s4:start()
end

function TitleScreen:initShape()
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

function TitleScreen:preCalcul(dt)
	return dt
end

function TitleScreen:update(dt)
	if EasyLD.keyboard:isPressed(" ") then
		EasyLD.screen:nextScreen(GameScreen:new(), "fade", nil, 0.5, false, "quad")
	end

	self.s:update(dt)
	self.s2:update(dt)
	self.s3:update(dt)
	self.s4:update(dt)
end

function TitleScreen:draw()
	self.s:draw()
	self.s2:draw()
	self.s3:draw()
	self.s4:draw()
	
	font:printOutLine("Controls: Keyboard", 30, EasyLD.box:new(0, 300,EasyLD.window.w, EasyLD.window.h), "center", "top", EasyLD.color:new(255,255,255), EasyLD.color:new(0,0,0), 1)
	font:printOutLine("[SPACE]: Pause", 30, EasyLD.box:new(0, 330,EasyLD.window.w, EasyLD.window.h), "center", "top", EasyLD.color:new(255,255,255), EasyLD.color:new(0,0,0), 1)
	font:printOutLine("[SPACE] to start", 50, EasyLD.box:new(0, 400,EasyLD.window.w, EasyLD.window.h), "center", "top", EasyLD.color:new(255,255,255), EasyLD.color:new(0,0,0), 1)

	local b = EasyLD.box:new(0, 300,EasyLD.window.w/3, EasyLD.window.h)
	b:rotate(-math.pi/12, 0, 0)
	font:printOutLine("20 levels - 15 minutes", 30, b, "center", "center", EasyLD.color:new(255,255,255), EasyLD.color:new(0,0,0), 1)
	b.y = b.y + 30
	font:printOutLine("Will you beat the mark?", 30, b, "center", "center", EasyLD.color:new(255,255,255), EasyLD.color:new(0,0,0), 1)

	font:printOutLine("Listen And Shift", 60, EasyLD.box:new(0, 100,EasyLD.window.w, EasyLD.window.h), "center", "top", EasyLD.color:new(255,255,255), EasyLD.color:new(0,0,0), 1)
	font:printOutLine("shapeshift - LD35", 20, EasyLD.box:new(0, 0,EasyLD.window.w, EasyLD.window.h - 20), "right", "bottom", EasyLD.color:new(255,255,255), EasyLD.color:new(0,0,0), 1)
	font:printOutLine("A Game made by Goutye", 20, EasyLD.box:new(0, 0,EasyLD.window.w, EasyLD.window.h), "right", "bottom", EasyLD.color:new(255,255,255), EasyLD.color:new(0,0,0), 1)
end

function TitleScreen:onEnd()
end

return TitleScreen