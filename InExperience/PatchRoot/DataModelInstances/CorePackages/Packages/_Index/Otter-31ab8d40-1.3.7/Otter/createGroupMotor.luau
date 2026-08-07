local parent = script.Parent.Parent
local object = require(parent.Collections).Object
local createSignal = require(parent.Signal).createSignal
local animationStepSignalModule = require(script.Parent.AnimationStepSignal)
local _ = require(script.Parent.types)
local t = {}
t.__index = t

local function createGroupMotor(p0) --[[ line: 53 ]]
	-- upvalues: createSignal (ref), t (ref)
	local t_1 = {}
	
	for i, v in pairs(p0) do
		t_1[i] = { complete = true, value = v }
	end
	local var4, var5 = createSignal()
	local var6, var7 = createSignal()
	local t_2 = {
		__allComplete = true,
		__running = false,
		__goals = {},
		__states = t_1,
		__onComplete = var4,
		__fireOnComplete = var5,
		__onStep = var6,
		__fireOnStep = var7
	}
	setmetatable(t_2, t)
	
	return t_2
end

function t.start(p1, p2) --[[ line: 82 ]]
	-- upvalues: animationStepSignalModule (ref)
	if p1.__running then return end
	p1.__connection = animationStepSignalModule:Connect(function(p3) --[[ line: 87 ]]
		-- upvalues: p1 (ref)
		p1:step(p3)
	end)
	p1.__running = true
	
	if p2 then
		p1:step(0)
	end
end

function t.stop(p4) --[[ line: 98 ]]
	if p4.__connection ~= nil then
		p4.__connection:Disconnect()
		p4.__running = false
	end
end

function t.step(p5, p6) --[[ line: 105 ]]
	if p5.__allComplete then return end
	local var9 = true
	local t = {}
	
	for i, v in pairs(p5.__states) do
		local v
		if v.complete then
			t[i] = v.value
			continue
		end
		local var11 = p5.__goals[i]
		
		if var11 == nil then
			v.complete = true
		else
			local var12 = var11.step(v, p6)
			
			if var12 ~= nil then
				v = var12
				p5.__states[i] = var12
			end
		end
		if not v.complete then
			var9 = false
		end
	end
	local allComplete = p5.__allComplete
	p5.__allComplete = var9
	p5.__fireOnStep(t)
	
	if p5.__allComplete and not allComplete and p5.__running then
		p5:stop()
		p5.__fireOnComplete(t)
	end
end

function t.setGoal(value, p7) --[[ line: 150 ]]
	-- upvalues: object (ref)
	value.__goals = object.assign({}, value.__goals, p7)
	local var13 = false
	local t = {}
	
	for i, v in pairs(p7) do
		local var15 = value.__states[i]
		
		if v.startingValue then
			var13 = true
			var15.value = v.startingValue
			
			if var15.initialValue then
				var15.initialValue = v.startingValue
			end
		end
		t[i] = var15.value
		
		if var15 == nil then
			error(("Cannot set goal for the value %s because it doesn't exist"):format(tostring(i)), 2)
		end
		var15.complete = false
	end
	value.__allComplete = false
	value:start(var13)
end

function t.onStep(p8, p9) --[[ line: 177 ]]
	local var16 = p8.__onStep:subscribe(p9)
	
	return function() --[[ line: 180 ]]
		-- upvalues: var16 (ref)
		var16:unsubscribe()
	end
end

function t.onComplete(p10, p11) --[[ line: 185 ]]
	local var17 = p10.__onComplete:subscribe(p11)
	
	return function() --[[ line: 188 ]]
		-- upvalues: var17 (ref)
		var17:unsubscribe()
	end
end

function t.destroy(p12) --[[ line: 193 ]]
	p12:stop()
end

return createGroupMotor