local runService = game:GetService("RunService")
local createSignalModule = require(script.Parent.createSignal)
local t = { prototype = {} }
t.__index = t.prototype

local function createSingleMotor(p1)
	-- upvalues: createSignalModule (ref), t (ref)
	assert(typeof(p1) == "number")
	local t_1 = {
		__goal = nil,
		__running = false,
		__state = { complete = true, value = p1 },
		__onComplete = createSignalModule(),
		__onStep = createSignalModule()
	}
	setmetatable(t_1, t)
	
	return t_1
end

function t.prototype.start(p1)
	-- upvalues: runService (ref)
	if p1.__running then
		return
	end
	p1.__connection = runService.Heartbeat:Connect(function(p2)
		-- upvalues: p1 (ref)
		p1:step(p2)
	end)
	p1.__running = true
end

function t.prototype.stop(p1)
	if p1.__connection ~= nil then
		p1.__connection:Disconnect()
	end
	p1.__running = false
end

function t.prototype.step(p1, p2)
	assert(typeof(p2) == "number")
	
	if p1.__state.complete then return end
	if p1.__goal == nil then return end
	local state = p1.__goal:step(p1.__state, p2)
	
	if state ~= nil then
		p1.__state = state
	end
	p1.__onStep:fire(p1.__state.value)
	
	if p1.__state.complete and p1.__running then
		p1:stop()
		p1.__onComplete:fire(p1.__state.value)
	end
end

function t.prototype.setGoal(value, p1)
	value.__goal = p1
	value.__state.complete = false
	value:start()
end

function t.prototype.onStep(p1, p2)
	assert(typeof(p2) == "function")
	
	return p1.__onStep:subscribe(p2)
end

function t.prototype.onComplete(p1, p2)
	assert(typeof(p2) == "function")
	
	return p1.__onComplete:subscribe(p2)
end

function t.prototype.destroy(p1)
	p1:stop()
end

return createSingleMotor