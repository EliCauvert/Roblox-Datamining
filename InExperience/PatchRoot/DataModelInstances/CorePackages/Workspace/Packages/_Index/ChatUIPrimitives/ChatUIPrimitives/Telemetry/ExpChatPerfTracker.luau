local chatUIPrimitives = script:FindFirstAncestor("ChatUIPrimitives")
local parent = chatUIPrimitives.Parent
local intervalPerformanceTracker = require(parent.IntervalPerformanceTracker).IntervalPerformanceTracker
local timeToInteractiveTracker = require(parent.TimeToInteractiveTracker).TimeToInteractiveTracker
local expChatPerfTracker = require(parent.Lumberyak).Logger.new(nil, "ExpChatPerfTracker")
local expChatPerfEventConfigModule = require(script.Parent.ExpChatPerfEventConfig)
local eventTypes = expChatPerfEventConfigModule.EventTypes
local events = expChatPerfEventConfigModule.Events
local eventConfig = expChatPerfEventConfigModule.EventConfig
local socialLuaAnalyticsModule = require(parent.SocialLuaAnalytics)
local scrollIntervalTrackerModule = require(parent.ScrollIntervalTracker)
local fFlagExpChatScrollPerfTrackingModule = require(chatUIPrimitives.Flags.FFlagExpChatScrollPerfTracking)
local fFlagExpChatMigrateScrollIntervalTrackerModule = require(chatUIPrimitives.Flags.FFlagExpChatMigrateScrollIntervalTracker)
local t = {
	start = function(p0, p1) --[[ line: 24 ]]
		-- upvalues: eventConfig (ref), eventTypes (ref), timeToInteractiveTracker (ref), intervalPerformanceTracker (ref), expChatPerfTracker (ref)
		local var8 = eventConfig[p0] or {}
		
		if var8.type == eventTypes.TTI then
			var8.onStart(p1)
			timeToInteractiveTracker.trackStart(var8.baseName)
			
			return true
		elseif var8.type ~= eventTypes.Interval then
			expChatPerfTracker:warning(`ExpChatPerfTracker.start: unknown event type for event: {p0}`)
			
			return false
		elseif var8.canStart(p1) then
			intervalPerformanceTracker:cancelTracking(var8.name)
			var8.onStart(p1)
			intervalPerformanceTracker:startTracking(var8.name, nil, var8.intervalMetrics, true, true)
			
			return true
		end
		return false
	end,
	finish = function(p2, p3) --[[ line: 46 ]]
		-- upvalues: eventConfig (ref), eventTypes (ref), timeToInteractiveTracker (ref), intervalPerformanceTracker (ref), expChatPerfTracker (ref)
		local var9 = eventConfig[p2] or {}
		
		if var9.type == eventTypes.TTI then
			if var9.canFinish(p3) then
				timeToInteractiveTracker.trackEnd(var9.baseName)
				
				return
			end
			return
		elseif var9.type ~= eventTypes.Interval then
			expChatPerfTracker:warning(`ExpChatPerfTracker.finish: unknown event type for event: {p2}`)
			
			return
		elseif var9.canFinish(p3) then
			var9.onFinish(p3)
			intervalPerformanceTracker:stopAndLogTracking(var9.name)
			
			return
		end
	end,
	cancel = function(p4, p5) --[[ line: 64 ]]
		-- upvalues: eventConfig (ref), eventTypes (ref), timeToInteractiveTracker (ref), intervalPerformanceTracker (ref), expChatPerfTracker (ref)
		local var10 = eventConfig[p4] or {}
		
		if var10.type == eventTypes.TTI then
			timeToInteractiveTracker.resetEvent(var10.baseName)
			
			return
		elseif var10.type == eventTypes.Interval then
			var10.onFinish(p5)
			intervalPerformanceTracker:cancelTracking(var10.name)
			
			return
		end
		expChatPerfTracker:warning(`ExpChatPerfTracker.cancel: unknown event type for event: {p4}`)
	end
}

function t.cancelAll() --[[ line: 76 ]]
	-- upvalues: eventConfig (ref), t (ref)
	for i, v in eventConfig do
		t.cancel(i)
	end
end

t.Events = events

if fFlagExpChatScrollPerfTrackingModule then
	function t.startChatWindowScrollInterval(p6, p7, p8) --[[ line: 85 ]]
		-- upvalues: t (ref), fFlagExpChatMigrateScrollIntervalTrackerModule (ref), scrollIntervalTrackerModule (ref), socialLuaAnalyticsModule (ref)
		local t_1 = { debugName = p6 }
		
		local var12 = function(p9) --[[ line: 93 ]]
			-- upvalues: t (copy), p6 (ref)
			return t.start(p6, p9)
		end
		
		local var13 = function(p10) --[[ line: 96 ]]
			-- upvalues: t (copy), p6 (ref)
			t.finish(p6, p10)
		end
		
		return if fFlagExpChatMigrateScrollIntervalTrackerModule then scrollIntervalTrackerModule.createScrollIntervalTracker(var12, var13, p7, p8, t_1) else socialLuaAnalyticsModule.Performance.createScrollIntervalTracker(var12, var13, p7, p8, t_1)
	end
end
return t