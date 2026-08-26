local appChat = script:FindFirstAncestor("AppChat")
local _ = require(appChat.Parent.TimeToInteractiveTracker)
local appChatPerfEventInfoModule = require(appChat.Telemetry.AppChatPerfEventInfo)
local appChatTTITrackerModule = require(appChat.Telemetry.AppChatTTITracker)
local appChatIntervalTrackerModule = require(appChat.Telemetry.AppChatIntervalTracker)

return {
	Events = appChatPerfEventInfoModule.Events,
	Milestone = appChatTTITrackerModule.Milestone,
	Hooks = appChatTTITrackerModule.Hooks,
	setSharedContext = function(value)
		-- upvalues: appChatTTITrackerModule (ref)
		appChatTTITrackerModule.setSharedContext(value)
	end,
	isActive = function(p1, p2)
		-- upvalues: appChatPerfEventInfoModule (ref), appChatTTITrackerModule (ref), appChatIntervalTrackerModule (ref)
		return if appChatPerfEventInfoModule.isTTIEvent(p1) then appChatTTITrackerModule.isActive(p1, p2 or {}) else appChatIntervalTrackerModule.isActive(p1)
	end,
	start = function(p1, p2)
		-- upvalues: appChatPerfEventInfoModule (ref), appChatTTITrackerModule (ref), appChatIntervalTrackerModule (ref)
		p2 = p2 or {}
		
		return if appChatPerfEventInfoModule.isTTIEvent(p1) then appChatTTITrackerModule.start(p1, p2) else appChatIntervalTrackerModule.start(p1, p2)
	end,
	finish = function(p1, p2)
		-- upvalues: appChatPerfEventInfoModule (ref), appChatTTITrackerModule (ref), appChatIntervalTrackerModule (ref)
		return if appChatPerfEventInfoModule.isTTIEvent(p1) then appChatTTITrackerModule.finish(p1, p2 or {}) else appChatIntervalTrackerModule.finish(p1)
	end,
	getEventName = function(p1)
		-- upvalues: appChatPerfEventInfoModule (ref), appChatTTITrackerModule (ref)
		return if appChatPerfEventInfoModule.isTTIEvent(p1) then appChatTTITrackerModule.getEventName(p1) else nil
	end,
	trackMilestone = function(p1, p2, p3)
		-- upvalues: appChatPerfEventInfoModule (ref), appChatTTITrackerModule (ref)
		return if appChatPerfEventInfoModule.isTTIEvent(p1) then appChatTTITrackerModule.trackMilestone(p1, p2, p3 or {}) else false
	end,
	trackSubphase = function(p1, p2, p3, p4)
		-- upvalues: appChatPerfEventInfoModule (ref), appChatTTITrackerModule (ref)
		return if appChatPerfEventInfoModule.isTTIEvent(p1) then appChatTTITrackerModule.trackSubphase(p1, p2, p3, p4 or {}) else false
	end,
	trackRequest = function(p1, p2, p3, p4)
		-- upvalues: appChatPerfEventInfoModule (ref), appChatTTITrackerModule (ref)
		return if appChatPerfEventInfoModule.isTTIEvent(p1) then appChatTTITrackerModule.trackRequest(p1, p2, p3, p4 or {}) else false
	end,
	cancel = function(p1, p2)
		-- upvalues: appChatPerfEventInfoModule (ref), appChatTTITrackerModule (ref), appChatIntervalTrackerModule (ref)
		return if appChatPerfEventInfoModule.isTTIEvent(p1) then appChatTTITrackerModule.cancel(p1, p2 or {}) else appChatIntervalTrackerModule.cancel(p1)
	end
}