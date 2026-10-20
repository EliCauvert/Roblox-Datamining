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
local FFlagExpChatMigrateScrollIntervalTrackerModule = require(ChatUIPrimitives.Flags.FFlagExpChatMigrateScrollIntervalTracker)
local FFlagExpChatPerfTrackerTabNameModule = require(ChatUIPrimitives.Flags.FFlagExpChatPerfTrackerTabName)
local ExpChatPerfTrackerModule = {
	start = function(DebugName, p1, p2): boolean
		-- upvalues: EventConfig (copy), EventTypes (copy), TimeToInteractiveTracker (copy), FFlagExpChatPerfTrackerTabNameModule (copy), IntervalPerformanceTracker (copy), ExpChatPerfTracker (copy)
		local EventConfigEntry = EventConfig[DebugName] or {}
		
		if EventConfigEntry.type == EventTypes.TTI then
			EventConfigEntry.onStart(p1)
			TimeToInteractiveTracker.trackStart(EventConfigEntry.baseName)
			
			if FFlagExpChatPerfTrackerTabNameModule and p2 and p2.tabName then
				TimeToInteractiveTracker.updateMetadata(EventConfigEntry.baseName, { page = p2.tabName })
			end
			return true
		else
			if EventConfigEntry.type ~= EventTypes.Interval then
				ExpChatPerfTracker:warning(`ExpChatPerfTracker.start: unknown event type for event: {DebugName}`)
				
				return false
			end
			if not EventConfigEntry.canStart(p1) then
				return false
			end
			IntervalPerformanceTracker:cancelTracking(EventConfigEntry.name)
			EventConfigEntry.onStart(p1)
			
			if FFlagExpChatPerfTrackerTabNameModule and p2 then
				IntervalPerformanceTracker:startTracking(EventConfigEntry.name, nil, EventConfigEntry.intervalMetrics, true, true, p2)
			else
				IntervalPerformanceTracker:startTracking(EventConfigEntry.name, nil, EventConfigEntry.intervalMetrics, true, true)
			end
			return true
		end
	end,
	finish = function(DebugName, p3, p4)
		-- upvalues: EventConfig (copy), EventTypes (copy), FFlagExpChatPerfTrackerTabNameModule (copy), TimeToInteractiveTracker (copy), ExpChatPerfTracker (copy), IntervalPerformanceTracker (copy)
		local EventConfigEntry = EventConfig[DebugName] or {}
		
		if EventConfigEntry.type == EventTypes.TTI then
			if not EventConfigEntry.canFinish(p3) then return end
			if FFlagExpChatPerfTrackerTabNameModule and p4 and p4.tabName then
				TimeToInteractiveTracker.updateMetadata(EventConfigEntry.baseName, { page = p4.tabName })
			end
			TimeToInteractiveTracker.trackEnd(EventConfigEntry.baseName)
			
			return
		else
			if EventConfigEntry.type ~= EventTypes.Interval then
				ExpChatPerfTracker:warning(`ExpChatPerfTracker.finish: unknown event type for event: {DebugName}`)
				
				return
			end
			if not EventConfigEntry.canFinish(p3) then return end
			if FFlagExpChatPerfTrackerTabNameModule and p4 then
				ExpChatPerfTracker:warning("Unable to update finished interval extra fields")
			end
			EventConfigEntry.onFinish(p3)
			IntervalPerformanceTracker:stopAndLogTracking(EventConfigEntry.name)
		end
	end,
	cancel = function(p5, p6)
		-- upvalues: EventConfig (copy), EventTypes (copy), TimeToInteractiveTracker (copy), IntervalPerformanceTracker (copy), ExpChatPerfTracker (copy)
		local EventConfigEntry = EventConfig[p5] or {}
		
		if EventConfigEntry.type == EventTypes.TTI then
			TimeToInteractiveTracker.resetEvent(EventConfigEntry.baseName)
			
			return
		end
		if EventConfigEntry.type == EventTypes.Interval then
			EventConfigEntry.onFinish(p6)
			IntervalPerformanceTracker:cancelTracking(EventConfigEntry.name)
			
			return
		else
			ExpChatPerfTracker:warning(`ExpChatPerfTracker.cancel: unknown event type for event: {p5}`)
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

function ExpChatPerfTrackerModule.startChatWindowScrollInterval(DebugName, p7, p8, p9)
	-- upvalues: ExpChatPerfTrackerModule (copy), FFlagExpChatMigrateScrollIntervalTrackerModule (copy), ScrollIntervalTrackerModule (copy), SocialLuaAnalyticsModule (copy)
	local config = { debugName = DebugName }
	
	local function v17(p10)
		-- upvalues: ExpChatPerfTrackerModule (upval), DebugName (copy), p9 (copy)
		return ExpChatPerfTrackerModule.start(DebugName, p10, p9)
	end
	
	local function v18(p10)
		-- upvalues: ExpChatPerfTrackerModule (upval), DebugName (copy)
		ExpChatPerfTrackerModule.finish(DebugName, p10)
	end
	
	return if FFlagExpChatMigrateScrollIntervalTrackerModule then ScrollIntervalTrackerModule.createScrollIntervalTracker(v17, v18, p7, p8, config) else SocialLuaAnalyticsModule.Performance.createScrollIntervalTracker(v17, v18, p7, p8, config)
end

return ExpChatPerfTrackerModule