local AppChat = script:FindFirstAncestor("AppChat")
local AppChatPerf = require(AppChat.Logger):new("AppChatPerf")
local IntervalPerformanceTracker = require(AppChat.Parent.IntervalPerformanceTracker).IntervalPerformanceTracker
local AppChatPerfEventModule = require(AppChat.Telemetry.AppChatPerfEvent)
local AppChatPerfEventInfoModule = require(AppChat.Telemetry.AppChatPerfEventInfo)
local AppChatTTITrackerModule = require(AppChat.Telemetry.AppChatTTITracker)
local list = { "duration", "averageFPS", "longestFrameTime" }
local list1 = {
	"duration", "averageFPS", "framesCount", "longestFrameTime", "frameTimeAvgMs",
	"frameTimeStdDevMs", "frameTimeDistributionMs", "frameBuckets",
	"rawFrameTimesMs", "rawScrollPositionSamplesCsv"
}
local t = {}

local function canStartInterval(Key) --[[ Line: 53 ]]
	-- upvalues: AppChatPerfEventInfoModule (copy), AppChatTTITrackerModule (copy)
	local ParentTTI = AppChatPerfEventInfoModule.getParentTTI(Key)
	local TTIPage = AppChatPerfEventInfoModule.getTTIPage(ParentTTI)
	
	if not AppChatTTITrackerModule.isInteractive(ParentTTI) then
		return false, TTIPage .. "_not_interactive"
	end
	local InteractiveTimestamp = AppChatTTITrackerModule.getInteractiveTimestamp(ParentTTI)
	
	if InteractiveTimestamp and os.clock() - InteractiveTimestamp < 0.5 then
		return false, TTIPage .. "_interactive_settling_delay"
	else
		return true, nil
	end
end

local function _(ScrollConversationList) --[[ Line: 73 | Named "getMetricsToTrack" ]]
	-- upvalues: AppChatPerfEventModule (copy), list1 (copy), list (copy)
	return if ScrollConversationList == AppChatPerfEventModule.ScrollConversationList or ScrollConversationList == AppChatPerfEventModule.ScrollMessageList then list1 else list
end

local AppChatIntervalTrackerModule = {
	start = function(Key, _, p1): boolean --[[ Line: 86 ]]
		-- upvalues: AppChatPerfEventInfoModule (copy), canStartInterval (copy), AppChatPerf (copy), IntervalPerformanceTracker (copy), AppChatPerfEventModule (copy), list1 (copy), list (copy), t (copy)
		local IntervalName = AppChatPerfEventInfoModule.getIntervalName(Key)
		local CanStartInterval, CanStartInterval2 = canStartInterval(Key)
		
		if CanStartInterval then
			AppChatPerf:debug("Interval Start: {}", IntervalName)
			IntervalPerformanceTracker:startTracking(IntervalName, nil, if Key == AppChatPerfEventModule.ScrollConversationList or Key == AppChatPerfEventModule.ScrollMessageList then list1 else list, true, true, nil, p1)
			t[Key] = true
			
			return true
		else
			AppChatPerf:debug("Perf start ignored: {} (reason={})", Key, CanStartInterval2 or "unknown")
			
			return false
		end
	end,
	finish = function(Key): boolean --[[ Line: 109 ]]
		-- upvalues: AppChatPerfEventInfoModule (copy), t (copy), AppChatPerf (copy), IntervalPerformanceTracker (copy)
		local IntervalName = AppChatPerfEventInfoModule.getIntervalName(Key)
		
		if t[Key] then
			AppChatPerf:debug("Interval Stop: {}", IntervalName)
			IntervalPerformanceTracker:stopAndLogTracking(IntervalName)
			t[Key] = false
			
			return true
		else
			return false
		end
	end,
	cancel = function(Key): boolean --[[ Line: 120 ]]
		-- upvalues: AppChatPerfEventInfoModule (copy), t (copy), AppChatPerf (copy), IntervalPerformanceTracker (copy)
		local IntervalName = AppChatPerfEventInfoModule.getIntervalName(Key)
		
		if t[Key] then
			AppChatPerf:debug("Interval Cancel: {}", IntervalName)
			IntervalPerformanceTracker:cancelTracking(IntervalName)
			t[Key] = false
			
			return true
		else
			return false
		end
	end,
	isActive = function(p1): boolean --[[ Line: 131 ]]
		-- upvalues: t (copy)
		return t[p1] == true
	end,
	cancelIntervalsForTTI = function(p1, p2) --[[ Line: 137 ]]
		-- upvalues: AppChatPerfEventInfoModule (copy), t (copy), AppChatPerf (copy), IntervalPerformanceTracker (copy)
		for _, value in AppChatPerfEventInfoModule.getIntervalsForTTI(p1) do
			if t[value] then
				local IntervalName = AppChatPerfEventInfoModule.getIntervalName(value)
				AppChatPerf:debug("Canceling interval ({}): {}", p2, IntervalName)
				IntervalPerformanceTracker:cancelTracking(IntervalName)
				t[value] = false
			end
		end
	end
}
AppChatTTITrackerModule.setOnConversationSwitch(function(p3) --[[ Line: 150 ]]
	-- upvalues: AppChatIntervalTrackerModule (copy)
	AppChatIntervalTrackerModule.cancelIntervalsForTTI(p3, "conversation_switch")
end)

return AppChatIntervalTrackerModule