local createSignal = require(script.Parent.Parent.Signal).createSignal
local animationStepSignalModule = require(script.Parent.AnimationStepSignal)
local _ = require(script.Parent.types)
local t = {}
t.__index = t

local function createSingleMotor(p1)
	-- upvalues: createSignal (ref), t (ref)
	local var1, var2 = createSignal()
	local var3, var4 = createSignal()
	local t_1 = {
		__goal = nil,
		__running = false,
		__state = { complete = true, value = p1 },
		__onComplete = var1,
		__fireOnComplete = var2,
		__onStep = var3,
		__fireOnStep = var4
	}
	setmetatable(t_1, t)
	
	return t_1
end

function t.start(p1)
	-- upvalues: animationStepSignalModule (ref)
	if p1.__running then return end
	p1.__connection = animationStepSignalModule:Connect(function(p2)
		-- upvalues: p1 (ref)
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

function t.stop(p1)
	if p1.__connection ~= nil then
		p1.__connection:Disconnect()
	end
	p1.__running = false
end

function t.step(p1, p2)
	if p1.__state.complete then return end
	if p1.__goal == nil then return end
	local var1 = p1.__goal.step(p1.__state, p2)
	
	if var1 ~= nil then
		p1.__state = var1
	end
	p1.__fireOnStep(p1.__state.value)
	
	if p1.__state.complete and p1.__running then
		p1:stop()
		p1.__fireOnComplete(p1.__state.value)
	end
end

function t.setGoal(value, p1)
	value.__goal = p1
	value.__state.complete = false
	value:start()
end

function t.onStep(p1, p2)
	local var1 = p1.__onStep:subscribe(p2)
	
	return function()
		-- upvalues: var1 (ref)
		var1:unsubscribe()
	end
end

function t.onComplete(p1, p2)
	local var1 = p1.__onComplete:subscribe(p2)
	
	return function()
		-- upvalues: var1 (ref)
		var1:unsubscribe()
	end
end

function t.destroy(p1)
	p1:stop()
end

return createSingleMotor