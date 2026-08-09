local appChat = script:FindFirstAncestor("AppChat")
local appChatPerf = require(appChat.Logger):new("AppChatPerf")
local intervalPerformanceTracker = require(appChat.Parent.IntervalPerformanceTracker).IntervalPerformanceTracker
local appChatPerfEventInfoModule = require(appChat.Telemetry.AppChatPerfEventInfo)
local appChatTTITrackerModule = require(appChat.Telemetry.AppChatTTITracker)
local list = { "duration", "averageFPS", "longestFrameTime" }
local t = {}

local function canStartInterval(p0) --[[ line: 40 ]]
	-- upvalues: appChatPerfEventInfoModule (ref), appChatTTITrackerModule (ref)
	local parentTTI = appChatPerfEventInfoModule.getParentTTI(p0)
	local TTIPage = appChatPerfEventInfoModule.getTTIPage(parentTTI)
	
	if not appChatTTITrackerModule.isInteractive(parentTTI) then
		return false, TTIPage .. "_not_interactive"
	end
	local interactiveTimestamp = appChatTTITrackerModule.getInteractiveTimestamp(parentTTI)
	
	if interactiveTimestamp and os.clock() - interactiveTimestamp < 0.5 then
		return false, TTIPage .. "_interactive_settling_delay"
	end
	return true, nil
end

local t_1 = {
	start = function(p1, _) --[[ line: 66 ]]
		-- upvalues: appChatPerfEventInfoModule (ref), canStartInterval (ref), appChatPerf (ref), intervalPerformanceTracker (ref), list (ref), t (ref)
		local intervalName = appChatPerfEventInfoModule.getIntervalName(p1)
		local var12, var13 = canStartInterval(p1)
		
		if var12 then
			appChatPerf:debug("Interval Start: {}", intervalName)
			intervalPerformanceTracker:startTracking(intervalName, nil, list, true, true)
			t[p1] = true
			
			return true
		end
		appChatPerf:debug("Perf start ignored: {} (reason={})", p1, var13 or "unknown")
		
		return false
	end,
	finish = function(p2) --[[ line: 87 ]]
		-- upvalues: appChatPerfEventInfoModule (ref), t (ref), appChatPerf (ref), intervalPerformanceTracker (ref)
		local intervalName = appChatPerfEventInfoModule.getIntervalName(p2)
		
		if t[p2] then
			appChatPerf:debug("Interval Stop: {}", intervalName)
			intervalPerformanceTracker:stopAndLogTracking(intervalName)
			t[p2] = false
			
			return true
		end
		return false
	end,
	cancel = function(p3) --[[ line: 98 ]]
		-- upvalues: appChatPerfEventInfoModule (ref), t (ref), appChatPerf (ref), intervalPerformanceTracker (ref)
		local intervalName = appChatPerfEventInfoModule.getIntervalName(p3)
		
		if t[p3] then
			appChatPerf:debug("Interval Cancel: {}", intervalName)
			intervalPerformanceTracker:cancelTracking(intervalName)
			t[p3] = false
			
			return true
		end
		return false
	end,
	isActive = function(p4) --[[ line: 109 ]]
		-- upvalues: t (ref)
		return t[p4] == true
	end,
	cancelIntervalsForTTI = function(p5, p6) --[[ line: 115 ]]
		-- upvalues: appChatPerfEventInfoModule (ref), t (ref), appChatPerf (ref), intervalPerformanceTracker (ref)
		for i, v in appChatPerfEventInfoModule.getIntervalsForTTI(p5) do
			if t[v] then
				local intervalName = appChatPerfEventInfoModule.getIntervalName(v)
				appChatPerf:debug("Canceling interval ({}): {}", p6, intervalName)
				intervalPerformanceTracker:cancelTracking(intervalName)
				t[v] = false
			end
		end
	end
}
appChatTTITrackerModule.setOnConversationSwitch(function(p7) --[[ line: 128 ]]
	-- upvalues: t_1 (ref)
	t_1.cancelIntervalsForTTI(p7, "conversation_switch")
end)

return t_1