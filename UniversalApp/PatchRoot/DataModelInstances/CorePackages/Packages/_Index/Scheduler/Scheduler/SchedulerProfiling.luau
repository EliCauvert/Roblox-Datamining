local console = require(script.Parent.Parent.Shared).console
local t = {}
local _ = require(script.Parent.SchedulerPriorities)
local enableProfiling = require(script.Parent.SchedulerFeatureFlags).enableProfiling
local var1 = 0
local var2 = 0
local var3 = 0
local var4 = nil
local var5 = nil
local var6 = 1

local function logEvent(p1)
	-- upvalues: var5 (write), var6 (write), var3 (write), console (ref), t (ref), var4 (write)
	if var5 ~= nil then
		var6 += #p1
		
		if var3 < var6 + 1 then
			var3 *= 2
			
			if var3 > 524288 then
				console.error("Scheduler Profiling: Event log exceeded maximum size. Don't forget to call `stopLoggingProfilingEvents()`.")
				t.stopLoggingProfilingEvents()
				
				return
			end
			local t_1 = {}
			table.insert(t_1, var5)
			var4 = t_1
			var5 = t_1
		end
		table.insert(var5, p1)
	end
end

function t.startLoggingProfilingEvents()
	-- upvalues: var3 (write), var4 (write), var5 (write), var6 (write)
	var3 = 131072
	var4 = {}
	var5 = var4
	var6 = 1
end

function t.stopLoggingProfilingEvents()
	-- upvalues: var4 (write), var3 (write), var5 (write), var6 (write)
	var3 = 0
	var4 = nil
	var5 = nil
	var6 = 1
	
	return var4
end

function t.markTaskStart(p1, p2)
	-- upvalues: enableProfiling (ref), var5 (write), logEvent (ref)
	if enableProfiling and var5 ~= nil then
		logEvent({ 1, p2 * 1000, p1.id, p1.priorityLevel })
	end
end

function t.markTaskCompleted(p1, p2)
	-- upvalues: enableProfiling (ref), var5 (write), logEvent (ref)
	if enableProfiling and var5 ~= nil then
		logEvent({ 2, p2 * 1000, p1.id })
	end
end

function t.markTaskCanceled(p1, p2)
	-- upvalues: enableProfiling (ref), var5 (write), logEvent (ref)
	if enableProfiling and var5 ~= nil then
		logEvent({ 4, p2 * 1000, p1.id })
	end
end

function t.markTaskErrored(p1, p2)
	-- upvalues: enableProfiling (ref), var5 (write), logEvent (ref)
	if enableProfiling and var5 ~= nil then
		logEvent({ 3, p2 * 1000, p1.id })
	end
end

function t.markTaskRun(p1, p2)
	-- upvalues: enableProfiling (ref), var1 (write), var5 (write), logEvent (ref)
	if enableProfiling then
		var1 += 1
		
		if var5 ~= nil then
			logEvent({ 5, p2 * 1000, p1.id, var1 })
		end
	end
end

function t.markTaskYield(p1, p2)
	-- upvalues: enableProfiling (ref), var5 (write), logEvent (ref), var1 (write)
	if enableProfiling and var5 ~= nil then
		logEvent({ 6, p2 * 1000, p1.id, var1 })
	end
end

function t.markSchedulerSuspended(p1)
	-- upvalues: enableProfiling (ref), var2 (write), var5 (write), logEvent (ref)
	if enableProfiling then
		var2 += 1
		
		if var5 ~= nil then
			logEvent({ 7, p1 * 1000, var2 })
		end
	end
end

function t.markSchedulerUnsuspended(p1)
	-- upvalues: enableProfiling (ref), var5 (write), logEvent (ref), var2 (write)
	if enableProfiling and var5 ~= nil then
		logEvent({ 8, p1 * 1000, var2 })
	end
end

return t