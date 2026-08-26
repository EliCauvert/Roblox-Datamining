local parent = script.Parent.Parent
local object = require(parent.Collections).Object
local createSignal = require(parent.Signal).createSignal
local animationStepSignalModule = require(script.Parent.AnimationStepSignal)
local _ = require(script.Parent.types)
local t = {}
t.__index = t

local function createGroupMotor(p1)
	-- upvalues: createSignal (ref), t (ref)
	local t_1 = {}
	
	for i, v in pairs(p1) do
		t_1[i] = { complete = true, value = v }
	end
	local var1, var2 = createSignal()
	local var3, var4 = createSignal()
	local t_2 = {
		__allComplete = true,
		__running = false,
		__goals = {},
		__states = t_1,
		__onComplete = var1,
		__fireOnComplete = var2,
		__onStep = var3,
		__fireOnStep = var4
	}
	setmetatable(t_2, t)
	
	return t_2
end

function t.start(p2, p3)
	-- upvalues: animationStepSignalModule (ref)
	if p2.__running then return end
	p2.__connection = animationStepSignalModule:Connect(function(p4)
		-- upvalues: p2 (ref)
		p2:step(p4)
	end)
	p2.__running = true
	
	if p3 then
		p2:step(0)
	end
end

function t.stop(p2)
	if p2.__connection ~= nil then
		p2.__connection:Disconnect()
		p2.__running = false
	end
end

function t.step(p2, p3)
	if p2.__allComplete then return end
	local var5 = true
	local t = {}
	
	for i, v in pairs(p2.__states) do
		local v
		if v.complete then
			t[i] = v.value
			continue
		end
		local var6 = p2.__goals[i]
		
		if var6 == nil then
			v.complete = true
		else
			local var7 = var6.step(v, p3)
			
			if var7 ~= nil then
				v = var7
				p2.__states[i] = var7
			end
		end
		if not v.complete then
			var5 = false
		end
	end
	local allComplete = p2.__allComplete
	p2.__allComplete = var5
	p2.__fireOnStep(t)
	
	if p2.__allComplete and not allComplete and p2.__running then
		p2:stop()
		p2.__fireOnComplete(t)
	end
end

function t.setGoal(value, p4)
	-- upvalues: object (ref)
	value.__goals = object.assign({}, value.__goals, p4)
	local var8 = false
	local t = {}
	
	for i, v in pairs(p4) do
		local var9 = value.__states[i]
		
		if v.startingValue then
			var8 = true
			var9.value = v.startingValue
			
			if var9.initialValue then
				var9.initialValue = v.startingValue
			end
		end
		t[i] = var9.value
		
		if var9 == nil then
			error(("Cannot set goal for the value %s because it doesn't exist"):format(tostring(i)), 2)
		end
		var9.complete = false
	end
	value.__allComplete = false
	value:start(var8)
end

function t.onStep(p5, p6)
	local var10 = p5.__onStep:subscribe(p6)
	
	return function()
		-- upvalues: var10 (ref)
		var10:unsubscribe()
	end
end

function t.onComplete(p5, p6)
	local var10 = p5.__onComplete:subscribe(p6)
	
	return function()
		-- upvalues: var10 (ref)
		var10:unsubscribe()
	end
end

function t.destroy(p5)
	p5:stop()
end

return createGroupMotor