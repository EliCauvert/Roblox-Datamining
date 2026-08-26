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
local fFlagExpChatMigrateScrollIntervalTrackerModule = require(chatUIPrimitives.Flags.FFlagExpChatMigrateScrollIntervalTracker)
local fFlagExpChatPerfTrackerTabNameModule = require(chatUIPrimitives.Flags.FFlagExpChatPerfTrackerTabName)
local t = {
	start = function(p1, p2, p3)
		-- upvalues: eventConfig (ref), eventTypes (ref), timeToInteractiveTracker (ref), fFlagExpChatPerfTrackerTabNameModule (ref), intervalPerformanceTracker (ref), expChatPerfTracker (ref)
		local var1 = eventConfig[p1] or {}
		
		if var1.type == eventTypes.TTI then
			var1.onStart(p2)
			timeToInteractiveTracker.trackStart(var1.baseName)
			
			if fFlagExpChatPerfTrackerTabNameModule and p3 and p3.tabName then
				timeToInteractiveTracker.updateMetadata(var1.baseName, { page = p3.tabName })
			end
			return true
		elseif var1.type ~= eventTypes.Interval then
			expChatPerfTracker:warning(`ExpChatPerfTracker.start: unknown event type for event: {p1}`)
			
			return false
		elseif not var1.canStart(p2) then
			return false
		end
		intervalPerformanceTracker:cancelTracking(var1.name)
		var1.onStart(p2)
		
		if fFlagExpChatPerfTrackerTabNameModule and p3 then
			intervalPerformanceTracker:startTracking(var1.name, nil, var1.intervalMetrics, true, true, p3)
		else
			intervalPerformanceTracker:startTracking(var1.name, nil, var1.intervalMetrics, true, true)
		end
		return true
	end,
	finish = function(p4, p5, p6)
		-- upvalues: eventConfig (ref), eventTypes (ref), fFlagExpChatPerfTrackerTabNameModule (ref), timeToInteractiveTracker (ref), expChatPerfTracker (ref), intervalPerformanceTracker (ref)
		local var2 = eventConfig[p4] or {}
		
		if var2.type == eventTypes.TTI then
			if not var2.canFinish(p5) then return end
			if fFlagExpChatPerfTrackerTabNameModule and p6 and p6.tabName then
				timeToInteractiveTracker.updateMetadata(var2.baseName, { page = p6.tabName })
			end
			timeToInteractiveTracker.trackEnd(var2.baseName)
			
			return
		elseif var2.type ~= eventTypes.Interval then
			expChatPerfTracker:warning(`ExpChatPerfTracker.finish: unknown event type for event: {p4}`)
			
			return
		elseif not var2.canFinish(p5) then return end
		if fFlagExpChatPerfTrackerTabNameModule and p6 then
			expChatPerfTracker:warning("Unable to update finished interval extra fields")
		end
		var2.onFinish(p5)
		intervalPerformanceTracker:stopAndLogTracking(var2.name)
	end,
	cancel = function(p7, p8)
		-- upvalues: eventConfig (ref), eventTypes (ref), timeToInteractiveTracker (ref), intervalPerformanceTracker (ref), expChatPerfTracker (ref)
		local var3 = eventConfig[p7] or {}
		
		if var3.type == eventTypes.TTI then
			timeToInteractiveTracker.resetEvent(var3.baseName)
			
			return
		elseif var3.type == eventTypes.Interval then
			var3.onFinish(p8)
			intervalPerformanceTracker:cancelTracking(var3.name)
			
			return
		end
		expChatPerfTracker:warning(`ExpChatPerfTracker.cancel: unknown event type for event: {p7}`)
	end
}

function t.cancelAll()
	-- upvalues: eventConfig (ref), t (ref)
	for i, v in eventConfig do
		t.cancel(i)
	end
end

t.Events = events

function t.startChatWindowScrollInterval(p9, p10, p11, p12)
	-- upvalues: t (ref), fFlagExpChatMigrateScrollIntervalTrackerModule (ref), scrollIntervalTrackerModule (ref), socialLuaAnalyticsModule (ref)
	local t_1 = { debugName = p9 }
	
	local var4 = function(p13)
		-- upvalues: t (copy), p9 (ref), p12 (ref)
		return t.start(p9, p13, p12)
	end
	
	local var5 = function(p13)
		-- upvalues: t (copy), p9 (ref)
		t.finish(p9, p13)
	end
	
	return if fFlagExpChatMigrateScrollIntervalTrackerModule then scrollIntervalTrackerModule.createScrollIntervalTracker(var4, var5, p10, p11, t_1) else socialLuaAnalyticsModule.Performance.createScrollIntervalTracker(var4, var5, p10, p11, t_1)
end

return t