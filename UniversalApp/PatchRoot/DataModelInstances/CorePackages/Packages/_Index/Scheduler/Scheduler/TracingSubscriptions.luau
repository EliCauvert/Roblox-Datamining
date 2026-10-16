local Parent = script.Parent.Parent
local Object = require(Parent.LuauPolyfill).Object
local EnableSchedulerTracing = require(Parent.Shared).ReactFeatureFlags.enableSchedulerTracing
local SubscriberRef = require(script.Parent.Tracing).__subscriberRef
local T = if EnableSchedulerTracing then {} else {}
local TracingSubscriptionsModule = {
	unstable_subscribe = function(Key) --[[ Line: 30 ]]
		-- upvalues: EnableSchedulerTracing (copy), T (ref), Object (copy), SubscriberRef (copy)
		if EnableSchedulerTracing then
			T[Key] = true
			
			if #Object.keys(T) == 1 then
				SubscriberRef.current = {
					onInteractionScheduledWorkCompleted = onInteractionScheduledWorkCompleted,
					onInteractionTraced = onInteractionTraced,
					onWorkCanceled = onWorkCanceled,
					onWorkScheduled = onWorkScheduled,
					onWorkStarted = onWorkStarted,
					onWorkStopped = onWorkStopped
				}
			end
		end
	end,
	unstable_unsubscribe = function(Key) --[[ Line: 47 ]]
		-- upvalues: EnableSchedulerTracing (copy), T (ref), Object (copy), SubscriberRef (copy)
		if EnableSchedulerTracing then
			T[Key] = nil
			
			if #Object.keys(T) == 0 then
				SubscriberRef.current = nil
			end
		end
	end
}

function onInteractionTraced(p1) --[[ Line: 57 ]]
	-- upvalues: T (ref)
	local Flag = false
	local v1 = nil
	
	for i, _ in T do
		local Success, Result = pcall(i.onInteractionTraced, p1)
		
		if not Success and not Flag then
			Flag = true
			v1 = Result
		end
	end
	if Flag then
		error(v1)
	end
end

function onInteractionScheduledWorkCompleted(p2) --[[ Line: 79 ]]
	-- upvalues: T (ref)
	local Flag = false
	local v2 = nil
	
	for i, _ in T do
		local Success, Result = pcall(i.onInteractionScheduledWorkCompleted, p2)
		
		if not Success and not Flag then
			Flag = true
			v2 = Result
		end
	end
	if Flag then
		error(v2)
	end
end

function onWorkScheduled(p3, p4) --[[ Line: 102 ]]
	-- upvalues: T (ref)
	local Flag = false
	local v3 = nil
	
	for i, _ in T do
		local Success, Result = pcall(i.onWorkScheduled, p3, p4)
		
		if not Success and not Flag then
			Flag = true
			v3 = Result
		end
	end
	if Flag then
		error(v3)
	end
end

function onWorkStarted(p5, p6) --[[ Line: 124 ]]
	-- upvalues: T (ref)
	local Flag = false
	local v4 = nil
	
	for i, _ in T do
		local Success, Result = pcall(i.onWorkStarted, p5, p6)
		
		if not Success and not Flag then
			Flag = true
			v4 = Result
		end
	end
	if Flag then
		error(v4)
	end
end

function onWorkStopped(p7, p8) --[[ Line: 146 ]]
	-- upvalues: T (ref)
	local Flag = false
	local v5 = nil
	
	for i, _ in T do
		local Success, Result = pcall(i.onWorkStopped, p7, p8)
		
		if not Success and not Flag then
			Flag = true
			v5 = Result
		end
	end
	if Flag then
		error(v5)
	end
end

function onWorkCanceled(p9, p10) --[[ Line: 168 ]]
	-- upvalues: T (ref)
	local Flag = false
	local v6 = nil
	
	for i, _ in T do
		local Success, Result = pcall(i.onWorkCanceled, p9, p10)
		
		if not Success and not Flag then
			Flag = true
			v6 = Result
		end
	end
	if Flag then
		error(v6)
	end
end

return TracingSubscriptionsModule