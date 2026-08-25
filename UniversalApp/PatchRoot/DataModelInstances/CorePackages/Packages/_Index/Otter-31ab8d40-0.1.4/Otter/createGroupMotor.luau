local runService = game:GetService("RunService")
local assignModule = require(script.Parent.assign)
local createSignalModule = require(script.Parent.createSignal)
local t = { prototype = {} }
t.__index = t.prototype

local function createGroupMotor(p0)
	-- upvalues: createSignalModule (ref), t (ref)
	assert(typeof(p0) == "table")
	local t_1 = {}
	
	for i, v in pairs(p0) do
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

function t.prototype.stop(p3)
	if p3.__connection ~= nil then
		p3.__connection:Disconnect()
		p3.__running = false
	end
end

function t.prototype.step(p4, p5)
	assert(typeof(p5) == "number")
	
	if p4.__allComplete then return end
	local var7 = true
	local t = {}
	
	for i, v in pairs(p4.__states) do
		local v
		if v.complete then
			t[i] = v.value
			continue
		end
		local var9 = p4.__goals[i]
		
		if var9 == nil then
			v.complete = true
		else
			local var10 = var9:step(v, p5)
			
			if var10 ~= nil then
				v = var10
				p4.__states[i] = var10
			end
		end
		if not v.complete then
			var7 = false
		end
	end
	local allComplete = p4.__allComplete
	p4.__allComplete = var7
	p4.__onStep:fire(t)
	
	if p4.__allComplete and not allComplete and p4.__running then
		p4:stop()
		p4.__onComplete:fire(t)
	end
end

function t.prototype.setGoal(value, p6)
	-- upvalues: assignModule (ref)
	assert(typeof(p6) == "table")
	value.__goals = assignModule({}, value.__goals, p6)
	
	for i in pairs(p6) do
		local var11 = value.__states[i]
		
		if var11 == nil then
			error(("Cannot set goal for the value %s because it doesn't exist"):format(tostring(i)), 2)
		end
		var11.complete = false
	end
	value.__allComplete = false
	value:start()
end

function t.prototype.onStep(p7, p8)
	assert(typeof(p8) == "function")
	
	return p7.__onStep:subscribe(p8)
end

function t.prototype.onComplete(p9, p10)
	assert(typeof(p10) == "function")
	
	return p9.__onComplete:subscribe(p10)
end

function t.prototype.destroy(p11)
	p11:stop()
end

return createGroupMotor