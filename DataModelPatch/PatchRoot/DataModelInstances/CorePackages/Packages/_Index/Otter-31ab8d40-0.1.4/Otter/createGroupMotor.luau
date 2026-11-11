local RunService = game:GetService("RunService")
local AssignModule = require(script.Parent.assign)
local CreateSignalModule = require(script.Parent.createSignal)
local config = { prototype = {} }
config.__index = config.prototype

local function createGroupMotor(List)
	-- upvalues: CreateSignalModule (copy), config (copy)
	assert(typeof(List) == "table")
	local t = {}
	
	for i, Value in pairs(List) do
		t[i] = { complete = true, value = Value }
	end
	local config1 = {
		__allComplete = true,
		__running = false,
		__goals = {},
		__states = t,
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
		p1.__running = false
	end
end

function config.prototype.step(p1, StepResult)
	assert(typeof(StepResult) == "number")
	
	if p1.__allComplete then return end
	local Flag = true
	local t = {}
	
	for i, state in pairs(p1.__states) do
		if not state.complete then
			local Goal = p1.__goals[i]
			
			if Goal == nil then
				state.complete = true
			else
				local StepResult1 = Goal:step(state, StepResult)
				
				if StepResult1 ~= nil then
					state = StepResult1
					p1.__states[i] = StepResult1
				end
			end
			if not state.complete then
				Flag = false
			end
		end
		t[i] = state.value
	end
	local AllComplete = p1.__allComplete
	p1.__allComplete = Flag
	p1.__onStep:fire(t)
	
	if p1.__allComplete and not AllComplete and p1.__running then
		p1:stop()
		p1.__onComplete:fire(t)
	end
end

function config.prototype.setGoal(p2, List)
	-- upvalues: AssignModule (copy)
	assert(typeof(List) == "table")
	p2.__goals = AssignModule({}, p2.__goals, List)
	
	for i in pairs(List) do
		local State = p2.__states[i]
		
		if State == nil then
			error(("Cannot set goal for the value %s because it doesn't exist"):format((tostring(i))), 2)
		end
		State.complete = false
	end
	p2.__allComplete = false
	p2:start()
end

function config.prototype.onStep(p3, p4)
	assert(typeof(p4) == "function")
	
	return p3.__onStep:subscribe(p4)
end

function config.prototype.onComplete(p3, p4)
	assert(typeof(p4) == "function")
	
	return p3.__onComplete:subscribe(p4)
end

function config.prototype.destroy(p3)
	p3:stop()
end

return createGroupMotor