-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:31:11 2026 Pacific Standard Time.

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

local function logEvent(p0) --[[ line: 46 ]]
	-- upvalues: var5 (write), var6 (write), var3 (write), console (ref), t (ref), var4 (write)
	if var5 ~= nil then
		var6 += #p0
		
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
		table.insert(var5, p0)
	end
end

function t.startLoggingProfilingEvents() --[[ line: 70 ]]
	-- upvalues: var3 (write), var4 (write), var5 (write), var6 (write)
	var3 = 131072
	var4 = {}
	var5 = var4
	var6 = 1
end

function t.stopLoggingProfilingEvents() --[[ line: 77 ]]
	-- upvalues: var4 (write), var3 (write), var5 (write), var6 (write)
	var3 = 0
	var4 = nil
	var5 = nil
	var6 = 1
	
	return var4
end

function t.markTaskStart(p1, p2) --[[ line: 87 ]]
	-- upvalues: enableProfiling (ref), var5 (write), logEvent (ref)
	if enableProfiling and var5 ~= nil then
		logEvent({ 1, p2 * 1000, p1.id, p1.priorityLevel })
	end
end

function t.markTaskCompleted(p3, p4) --[[ line: 98 ]]
	-- upvalues: enableProfiling (ref), var5 (write), logEvent (ref)
	if enableProfiling and var5 ~= nil then
		logEvent({ 2, p4 * 1000, p3.id })
	end
end

function t.markTaskCanceled(p5, p6) --[[ line: 109 ]]
	-- upvalues: enableProfiling (ref), var5 (write), logEvent (ref)
	if enableProfiling and var5 ~= nil then
		logEvent({ 4, p6 * 1000, p5.id })
	end
end

function t.markTaskErrored(p7, p8) --[[ line: 117 ]]
	-- upvalues: enableProfiling (ref), var5 (write), logEvent (ref)
	if enableProfiling and var5 ~= nil then
		logEvent({ 3, p8 * 1000, p7.id })
	end
end

function t.markTaskRun(p9, p10) --[[ line: 125 ]]
	-- upvalues: enableProfiling (ref), var1 (write), var5 (write), logEvent (ref)
	if enableProfiling then
		var1 += 1
		
		if var5 ~= nil then
			logEvent({ 5, p10 * 1000, p9.id, var1 })
		end
	end
end

function t.markTaskYield(p11, p12) --[[ line: 135 ]]
	-- upvalues: enableProfiling (ref), var5 (write), logEvent (ref), var1 (write)
	if enableProfiling and var5 ~= nil then
		logEvent({ 6, p12 * 1000, p11.id, var1 })
	end
end

function t.markSchedulerSuspended(p13) --[[ line: 143 ]]
	-- upvalues: enableProfiling (ref), var2 (write), var5 (write), logEvent (ref)
	if enableProfiling then
		var2 += 1
		
		if var5 ~= nil then
			logEvent({ 7, p13 * 1000, var2 })
		end
	end
end

function t.markSchedulerUnsuspended(p14) --[[ line: 153 ]]
	-- upvalues: enableProfiling (ref), var5 (write), logEvent (ref), var2 (write)
	if enableProfiling and var5 ~= nil then
		logEvent({ 8, p14 * 1000, var2 })
	end
end

return t