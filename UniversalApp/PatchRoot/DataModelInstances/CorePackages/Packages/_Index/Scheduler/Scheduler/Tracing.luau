local parent = script.Parent.Parent
local set = require(parent.LuauPolyfill).Set
local t = {}
local enableSchedulerTracing = require(parent.Shared).ReactFeatureFlags.enableSchedulerTracing
local var1 = 0
local var2 = 0
local t_1 = nil
local t_2 = nil

if enableSchedulerTracing then
	t_1 = { current = set.new() }
	t_2 = { current = nil }
end
t.__interactionsRef = t_1
t.__subscriberRef = t_2

function t.unstable_clear(p0) --[[ line: 92 ]]
	-- upvalues: enableSchedulerTracing (ref), t_1 (write), set (ref)
	if not enableSchedulerTracing then
		return p0()
	end
	local current = t_1.current
	t_1.current = set.new()
	local ok, status = pcall(p0)
	t_1.current = current
	
	if not ok then
		error(status)
	end
	return status
end

function t.unstable_getCurrent() --[[ line: 112 ]]
	-- upvalues: enableSchedulerTracing (ref), t_1 (write)
	return if enableSchedulerTracing then t_1.current else nil
end

function t.unstable_getThreadID() --[[ line: 120 ]]
	-- upvalues: var2 (write)
	var2 += 1
	
	return var2
end

function t.unstable_trace(p1, p2, p3, p4) --[[ line: 125 ]]
	-- upvalues: enableSchedulerTracing (ref), var1 (write), t_1 (write), set (ref), t_2 (write)
	local var5 = if p4 ~= nil then 0 else p4
	
	if not enableSchedulerTracing then
		return p3()
	end
	local t = { __count = 1, id = var1, name = p1, timestamp = p2 }
	var1 += 1
	local current = t_1.current
	local var7 = set.new(current)
	var7:add(t)
	t_1.current = var7
	local current_1 = t_2.current
	local var8 = nil
	local ok, status = pcall(function() --[[ line: 159 ]]
		-- upvalues: current_1 (ref), t (ref)
		if current_1 ~= nil then
			current_1.onInteractionTraced(t)
		end
	end)
	local ok_1, status_1 = pcall(function() --[[ line: 166 ]]
		-- upvalues: current_1 (ref), var7 (ref), var5 (ref)
		if current_1 ~= nil then
			current_1.onWorkStarted(var7, var5)
		end
	end)
	local ok_2, status_2 = pcall(function() --[[ line: 174 ]]
		-- upvalues: var8 (write), p3 (ref)
		var8 = p3()
	end)
	t_1.current = current
	local ok_3, status_3 = pcall(function() --[[ line: 180 ]]
		-- upvalues: current_1 (ref), var7 (ref), var5 (ref)
		if current_1 ~= nil then
			current_1.onWorkStopped(var7, var5)
		end
	end)
	t.__count -= 1
	
	if current_1 ~= nil and t.__count == 0 then
		current_1.onInteractionScheduledWorkCompleted(t)
	end
	if not ok_3 then
		error(status_3)
	end
	if not ok_2 then
		error(status_2)
	end
	if not ok_1 then
		error(status_1)
	end
	if not ok then
		error(status)
	end
	return var8
end

function t.unstable_wrap(p5, p6) --[[ line: 213 ]]
	-- upvalues: enableSchedulerTracing (ref), t_1 (write), t_2 (write)
	if p6 == nil then
		p6 = 0
	end
	if not enableSchedulerTracing then
		return p5
	end
	local current = t_1.current
	local current_1 = t_2.current
	
	if current_1 ~= nil then
		current_1.onWorkScheduled(current, p6)
	end
	for i, v in current do
		v.__count += 1
	end
	local var9 = false
	
	local function _wrapped(_, ...) --[[ line: 241 ]]
		-- upvalues: t_1 (copy), current (ref), current_1 (write), t_2 (copy), p6 (write), p5 (ref), var9 (write)
		local current_2 = t_1.current
		t_1.current = current
		current_1 = t_2.current
		local ok, status = pcall(function(...) --[[ line: 248 ]]
			-- upvalues: current_1 (copy), current (copy), p6 (copy), p5 (copy), t_1 (copy), current_2 (ref)
			local var13 = nil
			local ok, status = pcall(function() --[[ line: 252 ]]
				-- upvalues: current_1 (copy), current (copy), p6 (copy)
				if current_1 ~= nil then
					current_1.onWorkStarted(current, p6)
				end
			end)
			local ok_1, status_1 = pcall(function(...) --[[ line: 259 ]]
				-- upvalues: var13 (write), p5 (copy)
				var13 = p5(...)
			end, ...)
			t_1.current = current_2
			
			if current_1 ~= nil then
				current_1.onWorkStopped(current, p6)
			end
			if not ok_1 then
				error(status_1)
			end
			if not ok then
				error(status)
			end
			return var13
		end, ...)
		
		if not var9 then
			var9 = true
			
			for i, v in current do
				v.__count -= 1
				
				if current_1 ~= nil and v.__count == 0 then
					current_1.onInteractionScheduledWorkCompleted(v)
				end
			end
		end
		if not ok then
			error(status)
		end
		return status
	end
	
	local var11 = function() --[[ line: 306 ]]
		-- upvalues: current_1 (write), t_2 (copy), current (ref), p6 (write)
		current_1 = t_2.current
		local ok, status = pcall(function() --[[ line: 309 ]]
			-- upvalues: current_1 (copy), current (copy), p6 (copy)
			if current_1 ~= nil then
				current_1.onWorkCanceled(current, p6)
			end
		end)
		
		for i, v in current do
			v.__count -= 1
			
			if current_1 ~= nil and v.__count == 0 then
				current_1.onInteractionScheduledWorkCompleted(v)
			end
		end
		if not ok then
			error(status)
		end
	end
	
	local t = {}
	setmetatable(t, { __call = _wrapped })
	t.cancel = var11
	
	return t
end

return t