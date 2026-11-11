local RunService = game:GetService("RunService")
local CreateSignalModule = require(script.Parent.createSignal)
local config = { prototype = {} }
config.__index = config.prototype

local function createSingleMotor(Value)
	-- upvalues: CreateSignalModule (copy), config (copy)
	assert(typeof(Value) == "number")
	local config1 = {
		__goal = nil,
		__running = false,
		__state = { complete = true, value = Value },
		__onComplete = CreateSignalModule(),
		__onStep = CreateSignalModule()
	}
	setmetatable(config1, config)
	
	return config1
end

function config.prototype.start(p1)
	-- upvalues: RunService (copy)
	if not p1.__running then
		p1.__connection = RunService.Heartbeat:Connect(function(DeltaTime)
			-- upvalues: p1 (copy)
			p1:step(DeltaTime)
		end)
		p1.__running = true
		
		return
	end
end

function config.prototype.stop(p1)
	if p1.__connection ~= nil then
		p1.__connection:Disconnect()
	end
	p1.__running = false
end

function config.prototype.step(p1, p2)
	assert(typeof(p2) == "number")
	
	if p1.__state.complete then return end
	if p1.__goal == nil then return end
	local StepResult = p1.__goal:step(p1.__state, p2)
	
	if StepResult ~= nil then
		p1.__state = StepResult
	end
	p1.__onStep:fire(p1.__state.value)
	
	if p1.__state.complete and p1.__running then
		p1:stop()
		p1.__onComplete:fire(p1.__state.value)
	end
end

function config.prototype.setGoal(p1, p2)
	p1.__goal = p2
	p1.__state.complete = false
	p1:start()
end

function config.prototype.onStep(p1, p2)
	assert(typeof(p2) == "function")
	
	return p1.__onStep:subscribe(p2)
end

function config.prototype.onComplete(p1, p2)
	assert(typeof(p2) == "function")
	
	return p1.__onComplete:subscribe(p2)
end

function config.prototype.destroy(p1)
	p1:stop()
end

return createSingleMotor