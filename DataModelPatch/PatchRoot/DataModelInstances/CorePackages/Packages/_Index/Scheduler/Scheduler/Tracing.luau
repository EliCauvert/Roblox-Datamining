local Parent = script.Parent.Parent
local Set = require(Parent.LuauPolyfill).Set
local TracingModule = {}
local EnableSchedulerTracing = require(Parent.Shared).ReactFeatureFlags.enableSchedulerTracing
local Id = 0
local Count = 0
local v1 = nil
local v2 = nil

if EnableSchedulerTracing then
	v1 = { current = Set.new() }
	v2 = { current = nil }
end
TracingModule.__interactionsRef = v1
TracingModule.__subscriberRef = v2

function TracingModule.unstable_clear(Callback)
	-- upvalues: EnableSchedulerTracing (copy), v1 (ref), Set (copy)
	if not EnableSchedulerTracing then
		return Callback()
	end
	local Current = v1.current
	v1.current = Set.new()
	local Success, Result = pcall(Callback)
	v1.current = Current
	
	if not Success then
		error(Result)
	end
	return Result
end

function TracingModule.unstable_getCurrent()
	-- upvalues: EnableSchedulerTracing (copy), v1 (ref)
	return if EnableSchedulerTracing then v1.current else nil
end

function TracingModule.unstable_getThreadID(): number
	-- upvalues: Count (ref)
	Count += 1
	
	return Count
end

function TracingModule.unstable_trace(Name, Timestamp, Callback, p1)
	-- upvalues: EnableSchedulerTracing (copy), Id (ref), v1 (ref), Set (copy), v2 (ref)
	local v3 = if p1 == nil then 0 else p1
	
	if not EnableSchedulerTracing then
		return Callback()
	end
	local config = { __count = 1, id = Id, name = Name, timestamp = Timestamp }
	Id += 1
	local Current = v1.current
	local NewSet = Set.new(Current)
	NewSet:add(config)
	v1.current = NewSet
	local Current1 = v2.current
	local v4 = nil
	local Success, Result = pcall(function()
		-- upvalues: Current1 (copy), config (copy)
		if Current1 ~= nil then
			Current1.onInteractionTraced(config)
		end
	end)
	local Success1, Result1 = pcall(function()
		-- upvalues: Current1 (copy), NewSet (copy), v3 (copy)
		if Current1 ~= nil then
			Current1.onWorkStarted(NewSet, v3)
		end
	end)
	local Success2, Result2 = pcall(function()
		-- upvalues: v4 (ref), Callback (copy)
		v4 = Callback()
	end)
	v1.current = Current
	local Success3, Result3 = pcall(function()
		-- upvalues: Current1 (copy), NewSet (copy), v3 (copy)
		if Current1 ~= nil then
			Current1.onWorkStopped(NewSet, v3)
		end
	end)
	config.__count -= 1
	
	if Current1 ~= nil and config.__count == 0 then
		Current1.onInteractionScheduledWorkCompleted(config)
	end
	if not Success3 then
		error(Result3)
	end
	if not Success2 then
		error(Result2)
	end
	if not Success1 then
		error(Result1)
	end
	if not Success then
		error(Result)
	end
	return v4
end

function TracingModule.unstable_wrap(Callback, p1: number)
	-- upvalues: EnableSchedulerTracing (copy), v1 (ref), v2 (ref)
	if p1 == nil then
		p1 = 0
	end
	if not EnableSchedulerTracing then
		return Callback
	end
	local Current = v1.current
	local Current1 = v2.current
	
	if Current1 ~= nil then
		Current1.onWorkScheduled(Current, p1)
	end
	for _, value in Current do
		value.__count += 1
	end
	local Flag = false
	
	local function Cancel()
		-- upvalues: Current1 (ref), v2 (upval), Current (copy), p1 (ref)
		Current1 = v2.current
		local Success, Result = pcall(function()
			-- upvalues: Current1 (upval), Current (upval), p1 (upval)
			if Current1 ~= nil then
				Current1.onWorkCanceled(Current, p1)
			end
		end)
		
		for _, value in Current do
			value.__count -= 1
			
			if Current1 ~= nil and value.__count == 0 then
				Current1.onInteractionScheduledWorkCompleted(value)
			end
		end
		if not Success then
			error(Result)
		end
	end
	
	local t = {}
	setmetatable(t, {
		__call = function(_, ...)
			-- upvalues: v1 (upval), Current (copy), Current1 (ref), v2 (upval), p1 (ref), Callback (copy), Flag (ref)
			local Current2 = v1.current
			v1.current = Current
			Current1 = v2.current
			local Success, Result = pcall(function(...)
				-- upvalues: Current1 (upval), Current (upval), p1 (upval), Callback (upval), v1 (upval), Current2 (copy)
				local v3 = nil
				local Success, Result = pcall(function()
					-- upvalues: Current1 (upval), Current (upval), p1 (upval)
					if Current1 ~= nil then
						Current1.onWorkStarted(Current, p1)
					end
				end)
				local Success1, Result1 = pcall(function(...)
					-- upvalues: v3 (ref), Callback (upval)
					v3 = Callback(...)
				end, ...)
				v1.current = Current2
				
				if Current1 ~= nil then
					Current1.onWorkStopped(Current, p1)
				end
				if not Success1 then
					error(Result1)
				end
				if not Success then
					error(Result)
				end
				return v3
			end, ...)
			
			if not Flag then
				Flag = true
				
				for _, value in Current do
					value.__count -= 1
					
					if Current1 ~= nil and value.__count == 0 then
						Current1.onInteractionScheduledWorkCompleted(value)
					end
				end
			end
			if not Success then
				error(Result)
			end
			return Result
		end
	})
	t.cancel = Cancel
	
	return t
end

return TracingModule