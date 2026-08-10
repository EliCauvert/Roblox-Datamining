local appChat = script:FindFirstAncestor("AppChat")
local appChatPerf = require(appChat.Logger):new("AppChatPerf")
local intervalPerformanceTracker = require(appChat.Parent.IntervalPerformanceTracker).IntervalPerformanceTracker
local appChatPerfEventModule = require(appChat.Telemetry.AppChatPerfEvent)
local appChatPerfEventInfoModule = require(appChat.Telemetry.AppChatPerfEventInfo)
local appChatTTITrackerModule = require(appChat.Telemetry.AppChatTTITracker)
local fFlagAppChatScrollFrameTimeTrackingModule = require(appChat.Flags.FFlagAppChatScrollFrameTimeTracking)
local list = { "duration", "averageFPS", "longestFrameTime" }
local list_1 = {
	"duration", "averageFPS", "framesCount", "longestFrameTime", "frameTimeAvgMs",
	"frameTimeStdDevMs", "frameTimeDistributionMs", "frameBuckets",
	"rawFrameTimesMs"
}
local t = {}

local function canStartInterval(p0) --[[ line: 53 ]]
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

local function _(p1) --[[ line: 73 | named "getMetricsToTrack" ]]
	-- upvalues: fFlagAppChatScrollFrameTimeTrackingModule (ref), appChatPerfEventModule (ref), list_1 (ref), list (ref)
	return if fFlagAppChatScrollFrameTimeTrackingModule and (p1 == appChatPerfEventModule.ScrollConversationList or p1 == appChatPerfEventModule.ScrollMessageList) then list_1 else list
end

local t_1 = {
	start = function(p2, _) --[[ line: 89 ]]
		-- upvalues: appChatPerfEventInfoModule (ref), canStartInterval (ref), appChatPerf (ref), intervalPerformanceTracker (ref), fFlagAppChatScrollFrameTimeTrackingModule (ref), appChatPerfEventModule (ref), list_1 (ref), list (ref), t (ref)
		local intervalName = appChatPerfEventInfoModule.getIntervalName(p2)
		local var15, var16 = canStartInterval(p2)
		
		if not var15 then
			appChatPerf:debug("Perf start ignored: {} (reason={})", p2, var16 or "unknown")
			
			return false
		end
		appChatPerf:debug("Interval Start: {}", intervalName)
		intervalPerformanceTracker:startTracking(intervalName, nil, if fFlagAppChatScrollFrameTimeTrackingModule and (p2 == appChatPerfEventModule.ScrollConversationList or p2 == appChatPerfEventModule.ScrollMessageList) then list_1 else list, true, true)
		t[p2] = true
		
		return true
	end,
	finish = function(p3) --[[ line: 110 ]]
		-- upvalues: appChatPerfEventInfoModule (ref), t (ref), appChatPerf (ref), intervalPerformanceTracker (ref)
		local intervalName = appChatPerfEventInfoModule.getIntervalName(p3)
		
		if t[p3] then
			appChatPerf:debug("Interval Stop: {}", intervalName)
			intervalPerformanceTracker:stopAndLogTracking(intervalName)
			t[p3] = false
			
			return true
		end
		return false
	end,
	cancel = function(p4) --[[ line: 121 ]]
		-- upvalues: appChatPerfEventInfoModule (ref), t (ref), appChatPerf (ref), intervalPerformanceTracker (ref)
		local intervalName = appChatPerfEventInfoModule.getIntervalName(p4)
		
		if t[p4] then
			appChatPerf:debug("Interval Cancel: {}", intervalName)
			intervalPerformanceTracker:cancelTracking(intervalName)
			t[p4] = false
			
			return true
		end
		return false
	end,
	isActive = function(p5) --[[ line: 132 ]]
		-- upvalues: t (ref)
		return t[p5] == true
	end,
	cancelIntervalsForTTI = function(p6, p7) --[[ line: 138 ]]
		-- upvalues: appChatPerfEventInfoModule (ref), t (ref), appChatPerf (ref), intervalPerformanceTracker (ref)
		for i, v in appChatPerfEventInfoModule.getIntervalsForTTI(p6) do
			if t[v] then
				local intervalName = appChatPerfEventInfoModule.getIntervalName(v)
				appChatPerf:debug("Canceling interval ({}): {}", p7, intervalName)
				intervalPerformanceTracker:cancelTracking(intervalName)
				t[v] = false
			end
		end
	end
}
appChatTTITrackerModule.setOnConversationSwitch(function(p8) --[[ line: 151 ]]
	-- upvalues: t_1 (ref)
	t_1.cancelIntervalsForTTI(p8, "conversation_switch")
end)

return t_1