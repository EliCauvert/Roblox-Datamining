-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:31:11 2026 Pacific Standard Time.

local t = {}
local parent = script.Parent.Parent
local object = require(parent.LuauPolyfill).Object
local enableSchedulerTracing = require(parent.Shared).ReactFeatureFlags.enableSchedulerTracing
local subscriberRef = require(script.Parent.Tracing).__subscriberRef
local var1 = if enableSchedulerTracing then {} else {}

function t.unstable_subscribe(p0) --[[ line: 30 ]]
	-- upvalues: enableSchedulerTracing (ref), var1 (write), object (ref), subscriberRef (ref)
	if enableSchedulerTracing then
		var1[p0] = true
		
		if #object.keys(var1) == 1 then
			subscriberRef.current = {
				onInteractionScheduledWorkCompleted = onInteractionScheduledWorkCompleted,
				onInteractionTraced = onInteractionTraced,
				onWorkCanceled = onWorkCanceled,
				onWorkScheduled = onWorkScheduled,
				onWorkStarted = onWorkStarted,
				onWorkStopped = onWorkStopped
			}
		end
	end
end

function t.unstable_unsubscribe(p1) --[[ line: 47 ]]
	-- upvalues: enableSchedulerTracing (ref), var1 (write), object (ref), subscriberRef (ref)
	if enableSchedulerTracing then
		var1[p1] = nil
		
		if #object.keys(var1) == 0 then
			subscriberRef.current = nil
		end
	end
end

function onInteractionTraced(p2) --[[ line: 57 ]]
	-- upvalues: var1 (write)
	local var2 = false
	local var3 = nil
	
	for i, v in var1 do
		local ok, status = pcall(i.onInteractionTraced, p2)
		
		if not ok and not var2 then
			var2 = true
			var3 = status
		end
	end
	if var2 then
		error(var3)
	end
end

function onInteractionScheduledWorkCompleted(p3) --[[ line: 79 ]]
	-- upvalues: var1 (write)
	local var4 = false
	local var5 = nil
	
	for i, v in var1 do
		local ok, status = pcall(i.onInteractionScheduledWorkCompleted, p3)
		
		if not ok and not var4 then
			var4 = true
			var5 = status
		end
	end
	if var4 then
		error(var5)
	end
end

function onWorkScheduled(p4, p5) --[[ line: 102 ]]
	-- upvalues: var1 (write)
	local var6 = false
	local var7 = nil
	
	for i, v in var1 do
		local ok, status = pcall(i.onWorkScheduled, p4, p5)
		
		if not ok and not var6 then
			var6 = true
			var7 = status
		end
	end
	if var6 then
		error(var7)
	end
end

function onWorkStarted(p6, p7) --[[ line: 124 ]]
	-- upvalues: var1 (write)
	local var8 = false
	local var9 = nil
	
	for i, v in var1 do
		local ok, status = pcall(i.onWorkStarted, p6, p7)
		
		if not ok and not var8 then
			var8 = true
			var9 = status
		end
	end
	if var8 then
		error(var9)
	end
end

function onWorkStopped(p8, p9) --[[ line: 146 ]]
	-- upvalues: var1 (write)
	local var10 = false
	local var11 = nil
	
	for i, v in var1 do
		local ok, status = pcall(i.onWorkStopped, p8, p9)
		
		if not ok and not var10 then
			var10 = true
			var11 = status
		end
	end
	if var10 then
		error(var11)
	end
end

function onWorkCanceled(p10, p11) --[[ line: 168 ]]
	-- upvalues: var1 (write)
	local var12 = false
	local var13 = nil
	
	for i, v in var1 do
		local ok, status = pcall(i.onWorkCanceled, p10, p11)
		
		if not ok and not var12 then
			var12 = true
			var13 = status
		end
	end
	if var12 then
		error(var13)
	end
end

return t