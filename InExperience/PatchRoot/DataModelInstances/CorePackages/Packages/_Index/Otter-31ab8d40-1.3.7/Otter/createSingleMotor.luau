local createSignal = require(script.Parent.Parent.Signal).createSignal
local animationStepSignalModule = require(script.Parent.AnimationStepSignal)
local _ = require(script.Parent.types)
local t = {}
t.__index = t

local function createSingleMotor(p0)
	-- upvalues: createSignal (ref), t (ref)
	local var3, var4 = createSignal()
	local var5, var6 = createSignal()
	local t_1 = {
		__goal = nil,
		__running = false,
		__state = { complete = true, value = p0 },
		__onComplete = var3,
		__fireOnComplete = var4,
		__onStep = var5,
		__fireOnStep = var6
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

function t.stop(p3)
	if p3.__connection ~= nil then
		p3.__connection:Disconnect()
	end
	p3.__running = false
end

function t.step(p4, p5)
	if p4.__state.complete then return end
	if p4.__goal == nil then return end
	local var8 = p4.__goal.step(p4.__state, p5)
	
	if var8 ~= nil then
		p4.__state = var8
	end
	p4.__fireOnStep(p4.__state.value)
	
	if p4.__state.complete and p4.__running then
		p4:stop()
		p4.__fireOnComplete(p4.__state.value)
	end
end

function t.setGoal(value, p6)
	value.__goal = p6
	value.__state.complete = false
	value:start()
end

function t.onStep(p7, p8)
	local var9 = p7.__onStep:subscribe(p8)
	
	return function()
		-- upvalues: var9 (ref)
		var9:unsubscribe()
	end
end

function t.onComplete(p9, p10)
	local var10 = p9.__onComplete:subscribe(p10)
	
	return function()
		-- upvalues: var10 (ref)
		var10:unsubscribe()
	end
end

function t.destroy(p11)
	p11:stop()
end

return createSingleMotor