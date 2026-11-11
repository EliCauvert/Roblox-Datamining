local AppChat = script:FindFirstAncestor("AppChat")
local _ = require(AppChat.Parent.TimeToInteractiveTracker)
local AppChatPerfEventInfoModule = require(AppChat.Telemetry.AppChatPerfEventInfo)
local AppChatTTITrackerModule = require(AppChat.Telemetry.AppChatTTITracker)
local AppChatIntervalTrackerModule = require(AppChat.Telemetry.AppChatIntervalTracker)

return {
	Events = AppChatPerfEventInfoModule.Events,
	Milestone = AppChatTTITrackerModule.Milestone,
	Hooks = AppChatTTITrackerModule.Hooks,
	setSharedContext = function(p1)
		-- upvalues: AppChatTTITrackerModule (copy)
		AppChatTTITrackerModule.setSharedContext(p1)
	end,
	isActive = function(p1, p2)
		-- upvalues: AppChatPerfEventInfoModule (copy), AppChatTTITrackerModule (copy), AppChatIntervalTrackerModule (copy)
		local P2 = p2 or {}
		
		return if AppChatPerfEventInfoModule.isTTIEvent(p1) then AppChatTTITrackerModule.isActive(p1, P2) else AppChatIntervalTrackerModule.isActive(p1)
	end,
	start = function(p1, p2)
		-- upvalues: AppChatPerfEventInfoModule (copy), AppChatTTITrackerModule (copy), AppChatIntervalTrackerModule (copy)
		local P4 = p2 or {}
		
		return if AppChatPerfEventInfoModule.isTTIEvent(p1) then AppChatTTITrackerModule.start(p1, P4) else AppChatIntervalTrackerModule.start(p1, P4)
	end,
	finish = function(p1, p2)
		-- upvalues: AppChatPerfEventInfoModule (copy), AppChatTTITrackerModule (copy), AppChatIntervalTrackerModule (copy)
		local P6 = p2 or {}
		
		return if AppChatPerfEventInfoModule.isTTIEvent(p1) then AppChatTTITrackerModule.finish(p1, P6) else AppChatIntervalTrackerModule.finish(p1)
	end,
	getEventName = function(p1)
		-- upvalues: AppChatPerfEventInfoModule (copy), AppChatTTITrackerModule (copy)
		return if AppChatPerfEventInfoModule.isTTIEvent(p1) then AppChatTTITrackerModule.getEventName(p1) else nil
	end,
	trackMilestone = function(p1, p2, p3)
		-- upvalues: AppChatPerfEventInfoModule (copy), AppChatTTITrackerModule (copy)
		local P10 = p3 or {}
		
		return if AppChatPerfEventInfoModule.isTTIEvent(p1) then AppChatTTITrackerModule.trackMilestone(p1, p2, P10) else false
	end,
	trackSubphase = function(p1, p2, p3, p4)
		-- upvalues: AppChatPerfEventInfoModule (copy), AppChatTTITrackerModule (copy)
		local P14 = p4 or {}
		
		return if AppChatPerfEventInfoModule.isTTIEvent(p1) then AppChatTTITrackerModule.trackSubphase(p1, p2, p3, P14) else false
	end,
	trackRequest = function(p1, p2, p3, p4)
		-- upvalues: AppChatPerfEventInfoModule (copy), AppChatTTITrackerModule (copy)
		local P18 = p4 or {}
		
		return if AppChatPerfEventInfoModule.isTTIEvent(p1) then AppChatTTITrackerModule.trackRequest(p1, p2, p3, P18) else false
	end,
	cancel = function(p1, p2)
		-- upvalues: AppChatPerfEventInfoModule (copy), AppChatTTITrackerModule (copy), AppChatIntervalTrackerModule (copy)
		local P20 = p2 or {}
		
		return if AppChatPerfEventInfoModule.isTTIEvent(p1) then AppChatTTITrackerModule.cancel(p1, P20) else AppChatIntervalTrackerModule.cancel(p1)
	end
}