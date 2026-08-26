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

local function canStartInterval(p1)
	-- upvalues: appChatPerfEventInfoModule (ref), appChatTTITrackerModule (ref)
	local parentTTI = appChatPerfEventInfoModule.getParentTTI(p1)
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

local function _(p1)
	-- upvalues: fFlagAppChatScrollFrameTimeTrackingModule (ref), appChatPerfEventModule (ref), list_1 (ref), list (ref)
	return if fFlagAppChatScrollFrameTimeTrackingModule and (p1 == appChatPerfEventModule.ScrollConversationList or p1 == appChatPerfEventModule.ScrollMessageList) then list_1 else list
end

local t_1 = {
	start = function(p1, _)
		-- upvalues: appChatPerfEventInfoModule (ref), canStartInterval (ref), appChatPerf (ref), intervalPerformanceTracker (ref), fFlagAppChatScrollFrameTimeTrackingModule (ref), appChatPerfEventModule (ref), list_1 (ref), list (ref), t (ref)
		local intervalName = appChatPerfEventInfoModule.getIntervalName(p1)
		local var1, var2 = canStartInterval(p1)
		
		if not var1 then
			appChatPerf:debug("Perf start ignored: {} (reason={})", p1, var2 or "unknown")
			
			return false
		end
		appChatPerf:debug("Interval Start: {}", intervalName)
		intervalPerformanceTracker:startTracking(intervalName, nil, if fFlagAppChatScrollFrameTimeTrackingModule and (p1 == appChatPerfEventModule.ScrollConversationList or p1 == appChatPerfEventModule.ScrollMessageList) then list_1 else list, true, true)
		t[p1] = true
		
		return true
	end,
	finish = function(p1)
		-- upvalues: appChatPerfEventInfoModule (ref), t (ref), appChatPerf (ref), intervalPerformanceTracker (ref)
		local intervalName = appChatPerfEventInfoModule.getIntervalName(p1)
		
		if t[p1] then
			appChatPerf:debug("Interval Stop: {}", intervalName)
			intervalPerformanceTracker:stopAndLogTracking(intervalName)
			t[p1] = false
			
			return true
		end
		return false
	end,
	cancel = function(p1)
		-- upvalues: appChatPerfEventInfoModule (ref), t (ref), appChatPerf (ref), intervalPerformanceTracker (ref)
		local intervalName = appChatPerfEventInfoModule.getIntervalName(p1)
		
		if t[p1] then
			appChatPerf:debug("Interval Cancel: {}", intervalName)
			intervalPerformanceTracker:cancelTracking(intervalName)
			t[p1] = false
			
			return true
		end
		return false
	end,
	isActive = function(p1)
		-- upvalues: t (ref)
		return t[p1] == true
	end,
	cancelIntervalsForTTI = function(p1, p2)
		-- upvalues: appChatPerfEventInfoModule (ref), t (ref), appChatPerf (ref), intervalPerformanceTracker (ref)
		for i, v in appChatPerfEventInfoModule.getIntervalsForTTI(p1) do
			if t[v] then
				local intervalName = appChatPerfEventInfoModule.getIntervalName(v)
				appChatPerf:debug("Canceling interval ({}): {}", p2, intervalName)
				intervalPerformanceTracker:cancelTracking(intervalName)
				t[v] = false
			end
		end
	end
}
appChatTTITrackerModule.setOnConversationSwitch(function(p3)
	-- upvalues: t_1 (ref)
	t_1.cancelIntervalsForTTI(p3, "conversation_switch")
end)

return t_1