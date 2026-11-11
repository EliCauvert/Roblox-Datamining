local Parent = script.Parent.Parent
local Object = require(Parent.Collections).Object
local CreateSignalFunction = require(Parent.Signal).createSignal
local AnimationStepSignalModule = require(script.Parent.AnimationStepSignal)
local _ = require(script.Parent.types)
local Module = {}
Module.__index = Module

local function createGroupMotor(List)
	-- upvalues: CreateSignalFunction (copy), Module (copy)
	local t = {}
	
	for i, Value in pairs(List) do
		t[i] = { complete = true, value = Value }
	end
	local Signal, Signal2 = CreateSignalFunction()
	local Signal1, Signal2_1 = CreateSignalFunction()
	local config = {
		__allComplete = true,
		__running = false,
		__goals = {},
		__states = t,
		__onComplete = Signal,
		__fireOnComplete = Signal2,
		__onStep = Signal1,
		__fireOnStep = Signal2_1
	}
	setmetatable(config, Module)
	
	return config
end

function Module.start(p1, p2)
	-- upvalues: AnimationStepSignalModule (copy)
	if p1.__running then return end
	p1.__connection = AnimationStepSignalModule:Connect(function(p3)
		-- upvalues: p1 (copy)
		p1:step(p3)
	end)
	p1.__running = true
	
	if p2 then
		p1:step(0)
	end
end

function Module.stop(p1)
	if p1.__connection ~= nil then
		p1.__connection:Disconnect()
		p1.__running = false
	end
end

function Module.step(StepResult, p1)
	if StepResult.__allComplete then return end
	local Flag = true
	local t = {}
	
	for i, state in pairs(StepResult.__states) do
		if not state.complete then
			local Goal = StepResult.__goals[i]
			
			if Goal == nil then
				state.complete = true
			else
				local StepResult1 = Goal.step(state, p1)
				
				if StepResult1 ~= nil then
					state = StepResult1
					StepResult.__states[i] = StepResult1
				end
			end
			if not state.complete then
				Flag = false
			end
		end
		t[i] = state.value
	end
	local AllComplete = StepResult.__allComplete
	StepResult.__allComplete = Flag
	StepResult.__fireOnStep(t)
	
	if StepResult.__allComplete and not AllComplete and StepResult.__running then
		StepResult:stop()
		StepResult.__fireOnComplete(t)
	end
end

function Module.setGoal(p2, List)
	-- upvalues: Object (copy)
	p2.__goals = Object.assign({}, p2.__goals, List)
	local Flag = false
	local t = {}
	
	for i, value in pairs(List) do
		local State = p2.__states[i]
		
		if value.startingValue then
			Flag = true
			State.value = value.startingValue
			
			if State.initialValue then
				State.initialValue = value.startingValue
			end
		end
		t[i] = State.value
		
		if State == nil then
			error(("Cannot set goal for the value %s because it doesn't exist"):format((tostring(i))), 2)
		end
		State.complete = false
	end
	p2.__allComplete = false
	p2:start(Flag)
end

function Module.onStep(p3, p4)
	local SubscribeResult = p3.__onStep:subscribe(p4)
	
	return function()
		-- upvalues: SubscribeResult (copy)
		SubscribeResult:unsubscribe()
	end
end

function Module.onComplete(p3, p4)
	local SubscribeResult = p3.__onComplete:subscribe(p4)
	
	return function()
		-- upvalues: SubscribeResult (copy)
		SubscribeResult:unsubscribe()
	end
end

function Module.destroy(p3)
	p3:stop()
end

return createGroupMotor