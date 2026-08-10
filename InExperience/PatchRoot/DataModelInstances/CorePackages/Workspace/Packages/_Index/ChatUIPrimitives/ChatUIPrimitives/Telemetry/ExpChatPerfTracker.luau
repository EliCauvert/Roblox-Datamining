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
local fFlagExpChatPerfTrackerTabNameModule = require(chatUIPrimitives.Flags.FFlagExpChatPerfTrackerTabName)
local t = {
	start = function(p0, p1, p2) --[[ line: 27 ]]
		-- upvalues: eventConfig (ref), eventTypes (ref), timeToInteractiveTracker (ref), fFlagExpChatPerfTrackerTabNameModule (ref), intervalPerformanceTracker (ref), expChatPerfTracker (ref)
		local var9 = eventConfig[p0] or {}
		
		if var9.type == eventTypes.TTI then
			var9.onStart(p1)
			timeToInteractiveTracker.trackStart(var9.baseName)
			
			if fFlagExpChatPerfTrackerTabNameModule and p2 and p2.tabName then
				timeToInteractiveTracker.updateMetadata(var9.baseName, { page = p2.tabName })
			end
			return true
		elseif var9.type ~= eventTypes.Interval then
			expChatPerfTracker:warning(`ExpChatPerfTracker.start: unknown event type for event: {p0}`)
			
			return false
		elseif not var9.canStart(p1) then
			return false
		end
		intervalPerformanceTracker:cancelTracking(var9.name)
		var9.onStart(p1)
		
		if fFlagExpChatPerfTrackerTabNameModule and p2 then
			intervalPerformanceTracker:startTracking(var9.name, nil, var9.intervalMetrics, true, true, p2)
		else
			intervalPerformanceTracker:startTracking(var9.name, nil, var9.intervalMetrics, true, true)
		end
		return true
	end,
	finish = function(p3, p4, p5) --[[ line: 63 ]]
		-- upvalues: eventConfig (ref), eventTypes (ref), fFlagExpChatPerfTrackerTabNameModule (ref), timeToInteractiveTracker (ref), expChatPerfTracker (ref), intervalPerformanceTracker (ref)
		local var10 = eventConfig[p3] or {}
		
		if var10.type == eventTypes.TTI then
			if not var10.canFinish(p4) then return end
			if fFlagExpChatPerfTrackerTabNameModule and p5 and p5.tabName then
				timeToInteractiveTracker.updateMetadata(var10.baseName, { page = p5.tabName })
			end
			timeToInteractiveTracker.trackEnd(var10.baseName)
			
			return
		elseif var10.type ~= eventTypes.Interval then
			expChatPerfTracker:warning(`ExpChatPerfTracker.finish: unknown event type for event: {p3}`)
			
			return
		elseif not var10.canFinish(p4) then return end
		if fFlagExpChatPerfTrackerTabNameModule and p5 then
			expChatPerfTracker:warning("Unable to update finished interval extra fields")
		end
		var10.onFinish(p4)
		intervalPerformanceTracker:stopAndLogTracking(var10.name)
	end,
	cancel = function(p6, p7) --[[ line: 87 ]]
		-- upvalues: eventConfig (ref), eventTypes (ref), timeToInteractiveTracker (ref), intervalPerformanceTracker (ref), expChatPerfTracker (ref)
		local var11 = eventConfig[p6] or {}
		
		if var11.type == eventTypes.TTI then
			timeToInteractiveTracker.resetEvent(var11.baseName)
			
			return
		elseif var11.type == eventTypes.Interval then
			var11.onFinish(p7)
			intervalPerformanceTracker:cancelTracking(var11.name)
			
			return
		end
		expChatPerfTracker:warning(`ExpChatPerfTracker.cancel: unknown event type for event: {p6}`)
	end
}

function t.cancelAll() --[[ line: 99 ]]
	-- upvalues: eventConfig (ref), t (ref)
	for i, v in eventConfig do
		t.cancel(i)
	end
end

t.Events = events

if fFlagExpChatScrollPerfTrackingModule then
	function t.startChatWindowScrollInterval(p8, p9, p10, p11) --[[ line: 108 ]]
		-- upvalues: t (ref), fFlagExpChatMigrateScrollIntervalTrackerModule (ref), scrollIntervalTrackerModule (ref), socialLuaAnalyticsModule (ref)
		local t_1 = { debugName = p8 }
		
		local var13 = function(p12) --[[ line: 117 ]]
			-- upvalues: t (copy), p8 (ref), p11 (ref)
			return t.start(p8, p12, p11)
		end
		
		local var14 = function(p13) --[[ line: 120 ]]
			-- upvalues: t (copy), p8 (ref)
			t.finish(p8, p13)
		end
		
		return if fFlagExpChatMigrateScrollIntervalTrackerModule then scrollIntervalTrackerModule.createScrollIntervalTracker(var13, var14, p9, p10, t_1) else socialLuaAnalyticsModule.Performance.createScrollIntervalTracker(var13, var14, p9, p10, t_1)
	end
end
return t