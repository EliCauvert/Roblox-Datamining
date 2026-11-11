local ChatUIPrimitives = script:FindFirstAncestor("ChatUIPrimitives")
local Parent = ChatUIPrimitives.Parent
local IntervalPerformanceTracker = require(Parent.IntervalPerformanceTracker).IntervalPerformanceTracker
local TimeToInteractiveTracker = require(Parent.TimeToInteractiveTracker).TimeToInteractiveTracker
local ExpChatPerfTracker = require(Parent.Lumberyak).Logger.new(nil, "ExpChatPerfTracker")
local ExpChatPerfEventConfigModule = require(script.Parent.ExpChatPerfEventConfig)
local EventTypes = ExpChatPerfEventConfigModule.EventTypes
local Events = ExpChatPerfEventConfigModule.Events
local EventConfig = ExpChatPerfEventConfigModule.EventConfig
local SocialLuaAnalyticsModule = require(Parent.SocialLuaAnalytics)
local ScrollIntervalTrackerModule = require(Parent.ScrollIntervalTracker)
local FFlagExpChatScrollPerfTrackingModule = require(ChatUIPrimitives.Flags.FFlagExpChatScrollPerfTracking)
local FFlagExpChatMigrateScrollIntervalTrackerModule = require(ChatUIPrimitives.Flags.FFlagExpChatMigrateScrollIntervalTracker)
local ExpChatPerfTrackerModule = {
	start = function(DebugName, p1): boolean
		-- upvalues: EventConfig (copy), EventTypes (copy), TimeToInteractiveTracker (copy), IntervalPerformanceTracker (copy), ExpChatPerfTracker (copy)
		local EventConfigEntry = EventConfig[DebugName] or {}
		
		if EventConfigEntry.type == EventTypes.TTI then
			EventConfigEntry.onStart(p1)
			TimeToInteractiveTracker.trackStart(EventConfigEntry.baseName)
			
			return true
		elseif EventConfigEntry.type ~= EventTypes.Interval then
			ExpChatPerfTracker:warning(`ExpChatPerfTracker.start: unknown event type for event: {DebugName}`)
			
			return false
		elseif EventConfigEntry.canStart(p1) then
			IntervalPerformanceTracker:cancelTracking(EventConfigEntry.name)
			EventConfigEntry.onStart(p1)
			IntervalPerformanceTracker:startTracking(EventConfigEntry.name, nil, EventConfigEntry.intervalMetrics, true, true)
			
			return true
		else
			return false
		end
	end,
	finish = function(DebugName, p2)
		-- upvalues: EventConfig (copy), EventTypes (copy), TimeToInteractiveTracker (copy), IntervalPerformanceTracker (copy), ExpChatPerfTracker (copy)
		local EventConfigEntry = EventConfig[DebugName] or {}
		
		if EventConfigEntry.type == EventTypes.TTI then
			if EventConfigEntry.canFinish(p2) then
				TimeToInteractiveTracker.trackEnd(EventConfigEntry.baseName)
				
				return
			end
			return
		elseif EventConfigEntry.type ~= EventTypes.Interval then
			ExpChatPerfTracker:warning(`ExpChatPerfTracker.finish: unknown event type for event: {DebugName}`)
			
			return
		else
			if EventConfigEntry.canFinish(p2) then
				EventConfigEntry.onFinish(p2)
				IntervalPerformanceTracker:stopAndLogTracking(EventConfigEntry.name)
				
				return
			end
		end
	end,
	cancel = function(p3, p4)
		-- upvalues: EventConfig (copy), EventTypes (copy), TimeToInteractiveTracker (copy), IntervalPerformanceTracker (copy), ExpChatPerfTracker (copy)
		local EventConfigEntry = EventConfig[p3] or {}
		
		if EventConfigEntry.type == EventTypes.TTI then
			TimeToInteractiveTracker.resetEvent(EventConfigEntry.baseName)
			
			return
		end
		if EventConfigEntry.type == EventTypes.Interval then
			EventConfigEntry.onFinish(p4)
			IntervalPerformanceTracker:cancelTracking(EventConfigEntry.name)
			
			return
		else
			ExpChatPerfTracker:warning(`ExpChatPerfTracker.cancel: unknown event type for event: {p3}`)
		end
	end
}

function ExpChatPerfTrackerModule.cancelAll()
	-- upvalues: EventConfig (copy), ExpChatPerfTrackerModule (copy)
	for i, _ in EventConfig do
		ExpChatPerfTrackerModule.cancel(i)
	end
end

ExpChatPerfTrackerModule.Events = Events

if FFlagExpChatScrollPerfTrackingModule then
	function ExpChatPerfTrackerModule.startChatWindowScrollInterval(DebugName, p5, p6)
		-- upvalues: ExpChatPerfTrackerModule (copy), FFlagExpChatMigrateScrollIntervalTrackerModule (copy), ScrollIntervalTrackerModule (copy), SocialLuaAnalyticsModule (copy)
		local config = { debugName = DebugName }
		
		local function v17(p7)
			-- upvalues: ExpChatPerfTrackerModule (upval), DebugName (copy)
			return ExpChatPerfTrackerModule.start(DebugName, p7)
		end
		
		local function v18(p7)
			-- upvalues: ExpChatPerfTrackerModule (upval), DebugName (copy)
			ExpChatPerfTrackerModule.finish(DebugName, p7)
		end
		
		return if FFlagExpChatMigrateScrollIntervalTrackerModule then ScrollIntervalTrackerModule.createScrollIntervalTracker(v17, v18, p5, p6, config) else SocialLuaAnalyticsModule.Performance.createScrollIntervalTracker(v17, v18, p5, p6, config)
	end
end
return ExpChatPerfTrackerModule