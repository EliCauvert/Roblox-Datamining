-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:55 2026 Pacific Standard Time.

local runService = game:GetService("RunService")
local createSignalModule = require(script.Parent.createSignal)
local t = { prototype = {} }
t.__index = t.prototype

local function createSingleMotor(p0) --[[ line: 9 ]]
	-- upvalues: createSignalModule (ref), t (ref)
	assert(typeof(p0) == "number")
	local t_1 = {
		__goal = nil,
		__running = false,
		__state = { complete = true, value = p0 },
		__onComplete = createSignalModule(),
		__onStep = createSignalModule()
	}
	setmetatable(t_1, t)
	
	return t_1
end

function t.prototype.start(p1) --[[ line: 28 ]]
	-- upvalues: runService (ref)
	if p1.__running then
		return
	end
	p1.__connection = runService.Heartbeat:Connect(function(p2) --[[ line: 33 ]]
		-- upvalues: p1 (ref)
		p1:step(p2)
	end)
	p1.__running = true
end

function t.prototype.stop(p3) --[[ line: 40 ]]
	if p3.__connection ~= nil then
		p3.__connection:Disconnect()
	end
	p3.__running = false
end

function t.prototype.step(p4, p5) --[[ line: 48 ]]
	assert(typeof(p5) == "number")
	
	if p4.__state.complete then return end
	if p4.__goal == nil then return end
	local state = p4.__goal:step(p4.__state, p5)
	
	if state ~= nil then
		p4.__state = state
	end
	p4.__onStep:fire(p4.__state.value)
	
	if p4.__state.complete and p4.__running then
		p4:stop()
		p4.__onComplete:fire(p4.__state.value)
	end
end

function t.prototype.setGoal(value, p6) --[[ line: 73 ]]
	value.__goal = p6
	value.__state.complete = false
	value:start()
end

function t.prototype.onStep(p7, p8) --[[ line: 79 ]]
	assert(typeof(p8) == "function")
	
	return p7.__onStep:subscribe(p8)
end

function t.prototype.onComplete(p9, p10) --[[ line: 85 ]]
	assert(typeof(p10) == "function")
	
	return p9.__onComplete:subscribe(p10)
end

function t.prototype.destroy(p11) --[[ line: 91 ]]
	p11:stop()
end

return createSingleMotor