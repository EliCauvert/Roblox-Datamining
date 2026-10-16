local CreateSignalFunction = require(script.Parent.Parent.Signal).createSignal
local AnimationStepSignalModule = require(script.Parent.AnimationStepSignal)
local _ = require(script.Parent.types)
local Module = {}
Module.__index = Module

local function createSingleMotor(Value) --[[ Line: 41 ]]
	-- upvalues: CreateSignalFunction (copy), Module (copy)
	local Signal, Signal2 = CreateSignalFunction()
	local Signal1, Signal2_1 = CreateSignalFunction()
	local config = {
		__goal = nil,
		__running = false,
		__state = { complete = true, value = Value },
		__onComplete = Signal,
		__fireOnComplete = Signal2,
		__onStep = Signal1,
		__fireOnStep = Signal2_1
	}
	setmetatable(config, Module)
	
	return config
end

function Module.start(p1) --[[ Line: 63 ]]
	-- upvalues: AnimationStepSignalModule (copy)
	if p1.__running then return end
	p1.__connection = AnimationStepSignalModule:Connect(function(p2) --[[ Line: 68 ]]
		-- upvalues: p1 (copy)
		p1:step(p2)
	end)
	p1.__running = true
	
	if p1.__goal and p1.__goal.startingValue then
		p1.__state.value = p1.__goal.startingValue
		
		if p1.__state.initialValue then
			p1.__state.initialValue = p1.__goal.startingValue
		end
		p1:step(0)
	end
end

function Module.stop(p1) --[[ Line: 83 ]]
	if p1.__connection ~= nil then
		p1.__connection:Disconnect()
	end
	p1.__running = false
end

function Module.step(p1, p2) --[[ Line: 91 ]]
	if p1.__state.complete then return end
	if p1.__goal == nil then return end
	local StepResult = p1.__goal.step(p1.__state, p2)
	
	if StepResult ~= nil then
		p1.__state = StepResult
	end
	p1.__fireOnStep(p1.__state.value)
	
	if p1.__state.complete and p1.__running then
		p1:stop()
		p1.__fireOnComplete(p1.__state.value)
	end
end

function Module.setGoal(p1, p2) --[[ Line: 114 ]]
	p1.__goal = p2
	p1.__state.complete = false
	p1:start()
end

function Module.onStep(p1, p2) --[[ Line: 120 ]]
	local SubscribeResult = p1.__onStep:subscribe(p2)
	
	return function() --[[ Line: 123 ]]
		-- upvalues: SubscribeResult (copy)
		SubscribeResult:unsubscribe()
	end
end

function Module.onComplete(p1, p2) --[[ Line: 128 ]]
	local SubscribeResult = p1.__onComplete:subscribe(p2)
	
	return function() --[[ Line: 131 ]]
		-- upvalues: SubscribeResult (copy)
		SubscribeResult:unsubscribe()
	end
end

function Module.destroy(p1) --[[ Line: 136 ]]
	p1:stop()
end

return createSingleMotor