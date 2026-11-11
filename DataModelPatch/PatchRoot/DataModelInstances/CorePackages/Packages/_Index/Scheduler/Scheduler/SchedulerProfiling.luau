local Console = require(script.Parent.Parent.Shared).console
local SchedulerProfilingModule = {}
local _ = require(script.Parent.SchedulerPriorities)
local EnableProfiling = require(script.Parent.SchedulerFeatureFlags).enableProfiling
local Count = 0
local Count1 = 0
local v1 = 0
local T = nil
local List = nil
local Total = 1

local function logEvent(p1)
	-- upvalues: List (ref), Total (ref), v1 (ref), Console (copy), SchedulerProfilingModule (copy), T (ref)
	if List ~= nil then
		Total += #p1
		
		if v1 < Total + 1 then
			v1 *= 2
			
			if v1 > 524288 then
				Console.error("Scheduler Profiling: Event log exceeded maximum size. Don't forget to call `stopLoggingProfilingEvents()`.")
				SchedulerProfilingModule.stopLoggingProfilingEvents()
				
				return
			end
			local List1 = {}
			table.insert(List1, List)
			T = List1
			List = List1
		end
		table.insert(List, p1)
	end
end

function SchedulerProfilingModule.startLoggingProfilingEvents()
	-- upvalues: v1 (ref), T (ref), List (ref), Total (ref)
	v1 = 131072
	T = {}
	List = T
	Total = 1
end

function SchedulerProfilingModule.stopLoggingProfilingEvents()
	-- upvalues: T (ref), v1 (ref), List (ref), Total (ref)
	local T1 = T
	v1 = 0
	T = nil
	List = nil
	Total = 1
	
	return T1
end

function SchedulerProfilingModule.markTaskStart(p1, p2: number)
	-- upvalues: EnableProfiling (copy), List (ref), logEvent (copy)
	if EnableProfiling and List ~= nil then
		logEvent({ 1, p2 * 1000, p1.id, p1.priorityLevel })
	end
end

function SchedulerProfilingModule.markTaskCompleted(p1, p2: number)
	-- upvalues: EnableProfiling (copy), List (ref), logEvent (copy)
	if EnableProfiling and List ~= nil then
		logEvent({ 2, p2 * 1000, p1.id })
	end
end

function SchedulerProfilingModule.markTaskCanceled(p1, p2: number)
	-- upvalues: EnableProfiling (copy), List (ref), logEvent (copy)
	if EnableProfiling and List ~= nil then
		logEvent({ 4, p2 * 1000, p1.id })
	end
end

function SchedulerProfilingModule.markTaskErrored(p1, p2: number)
	-- upvalues: EnableProfiling (copy), List (ref), logEvent (copy)
	if EnableProfiling and List ~= nil then
		logEvent({ 3, p2 * 1000, p1.id })
	end
end

function SchedulerProfilingModule.markTaskRun(p1, p2: number)
	-- upvalues: EnableProfiling (copy), Count (ref), List (ref), logEvent (copy)
	if EnableProfiling then
		Count += 1
		
		if List ~= nil then
			logEvent({ 5, p2 * 1000, p1.id, Count })
		end
	end
end

function SchedulerProfilingModule.markTaskYield(p1, p2: number)
	-- upvalues: EnableProfiling (copy), List (ref), logEvent (copy), Count (ref)
	if EnableProfiling and List ~= nil then
		logEvent({ 6, p2 * 1000, p1.id, Count })
	end
end

function SchedulerProfilingModule.markSchedulerSuspended(p1: number)
	-- upvalues: EnableProfiling (copy), Count1 (ref), List (ref), logEvent (copy)
	if EnableProfiling then
		Count1 += 1
		
		if List ~= nil then
			logEvent({ 7, p1 * 1000, Count1 })
		end
	end
end

function SchedulerProfilingModule.markSchedulerUnsuspended(p1: number)
	-- upvalues: EnableProfiling (copy), List (ref), logEvent (copy), Count1 (ref)
	if EnableProfiling and List ~= nil then
		logEvent({ 8, p1 * 1000, Count1 })
	end
end

return SchedulerProfilingModule