local AppChat = script:FindFirstAncestor("AppChat")
local AppChatPerf = require(AppChat.Logger):new("AppChatPerf")
local IntervalPerformanceTracker = require(AppChat.Parent.IntervalPerformanceTracker).IntervalPerformanceTracker
local AppChatPerfEventInfoModule = require(AppChat.Telemetry.AppChatPerfEventInfo)
local AppChatTTITrackerModule = require(AppChat.Telemetry.AppChatTTITracker)
local list = { "duration", "averageFPS", "longestFrameTime" }
local t = {}

local function canStartInterval(Key)
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

local AppChatIntervalTrackerModule = {
	start = function(Key, _): boolean
		-- upvalues: AppChatPerfEventInfoModule (copy), canStartInterval (copy), AppChatPerf (copy), IntervalPerformanceTracker (copy), list (copy), t (copy)
		local IntervalName = AppChatPerfEventInfoModule.getIntervalName(Key)
		local CanStartInterval, CanStartInterval2 = canStartInterval(Key)
		
		if CanStartInterval then
			AppChatPerf:debug("Interval Start: {}", IntervalName)
			IntervalPerformanceTracker:startTracking(IntervalName, nil, list, true, true)
			t[Key] = true
			
			return true
		else
			AppChatPerf:debug("Perf start ignored: {} (reason={})", Key, CanStartInterval2 or "unknown")
			
			return false
		end
	end,
	finish = function(Key): boolean
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
	cancel = function(Key): boolean
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
	isActive = function(p1): boolean
		-- upvalues: t (copy)
		return t[p1] == true
	end,
	cancelIntervalsForTTI = function(p1, p2)
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
AppChatTTITrackerModule.setOnConversationSwitch(function(p3)
	-- upvalues: AppChatIntervalTrackerModule (copy)
	AppChatIntervalTrackerModule.cancelIntervalsForTTI(p3, "conversation_switch")
end)

return AppChatIntervalTrackerModule