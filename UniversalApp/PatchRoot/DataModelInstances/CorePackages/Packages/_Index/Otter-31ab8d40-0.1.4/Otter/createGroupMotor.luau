local runService = game:GetService("RunService")
local assignModule = require(script.Parent.assign)
local createSignalModule = require(script.Parent.createSignal)
local t = { prototype = {} }
t.__index = t.prototype

local function createGroupMotor(p1)
	-- upvalues: createSignalModule (ref), t (ref)
	assert(typeof(p1) == "table")
	local t_1 = {}
	
	for i, v in pairs(p1) do
		t_1[i] = { complete = true, value = v }
	end
	local t_2 = {
		__allComplete = true,
		__running = false,
		__goals = {},
		__states = t_1,
		__onComplete = createSignalModule(),
		__onStep = createSignalModule()
	}
	setmetatable(t_2, t)
	
	return t_2
end

function t.prototype.start(p2)
	-- upvalues: runService (ref)
	if p2.__running then
		return
	end
	p2.__connection = runService.Heartbeat:Connect(function(p3)
		-- upvalues: p2 (ref)
		p2:step(p3)
	end)
	p2.__running = true
end

function t.prototype.stop(p2)
	if p2.__connection ~= nil then
		p2.__connection:Disconnect()
		p2.__running = false
	end
end

function t.prototype.step(p2, p3)
	assert(typeof(p3) == "number")
	
	if p2.__allComplete then return end
	local var1 = true
	local t = {}
	
	for i, v in pairs(p2.__states) do
		local v
		if v.complete then
			t[i] = v.value
			continue
		end
		local var2 = p2.__goals[i]
		
		if var2 == nil then
			v.complete = true
		else
			local var3 = var2:step(v, p3)
			
			if var3 ~= nil then
				v = var3
				p2.__states[i] = var3
			end
		end
		if not v.complete then
			var1 = false
		end
	end
	local allComplete = p2.__allComplete
	p2.__allComplete = var1
	p2.__onStep:fire(t)
	
	if p2.__allComplete and not allComplete and p2.__running then
		p2:stop()
		p2.__onComplete:fire(t)
	end
end

function t.prototype.setGoal(value, p4)
	-- upvalues: assignModule (ref)
	assert(typeof(p4) == "table")
	value.__goals = assignModule({}, value.__goals, p4)
	
	for i in pairs(p4) do
		local var4 = value.__states[i]
		
		if var4 == nil then
			error(("Cannot set goal for the value %s because it doesn't exist"):format(tostring(i)), 2)
		end
		var4.complete = false
	end
	value.__allComplete = false
	value:start()
end

function t.prototype.onStep(p5, p6)
	assert(typeof(p6) == "function")
	
	return p5.__onStep:subscribe(p6)
end

function t.prototype.onComplete(p5, p6)
	assert(typeof(p6) == "function")
	
	return p5.__onComplete:subscribe(p6)
end

function t.prototype.destroy(p5)
	p5:stop()
end

return createGroupMotor