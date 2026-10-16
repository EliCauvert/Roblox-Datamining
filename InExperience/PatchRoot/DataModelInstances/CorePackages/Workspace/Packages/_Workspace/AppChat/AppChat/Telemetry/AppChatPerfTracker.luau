local AppChat = script:FindFirstAncestor("AppChat")
local _ = require(AppChat.Parent.TimeToInteractiveTracker)
local AppChatPerfEventInfoModule = require(AppChat.Telemetry.AppChatPerfEventInfo)
local AppChatTTITrackerModule = require(AppChat.Telemetry.AppChatTTITracker)
local AppChatIntervalTrackerModule = require(AppChat.Telemetry.AppChatIntervalTracker)

return {
	Events = AppChatPerfEventInfoModule.Events,
	Milestone = AppChatTTITrackerModule.Milestone,
	Hooks = AppChatTTITrackerModule.Hooks,
	setSharedContext = function(p1) --[[ Line: 33 ]]
		-- upvalues: AppChatTTITrackerModule (copy)
		AppChatTTITrackerModule.setSharedContext(p1)
	end,
	isActive = function(p1, p2) --[[ Line: 37 ]]
		-- upvalues: AppChatPerfEventInfoModule (copy), AppChatTTITrackerModule (copy), AppChatIntervalTrackerModule (copy)
		local P2 = p2 or {}
		
		return if AppChatPerfEventInfoModule.isTTIEvent(p1) then AppChatTTITrackerModule.isActive(p1, P2) else AppChatIntervalTrackerModule.isActive(p1)
	end,
	start = function(p1, p2, p3) --[[ Line: 47 ]]
		-- upvalues: AppChatPerfEventInfoModule (copy), AppChatTTITrackerModule (copy), AppChatIntervalTrackerModule (copy)
		local P4 = p2 or {}
		
		return if AppChatPerfEventInfoModule.isTTIEvent(p1) then AppChatTTITrackerModule.start(p1, P4) else AppChatIntervalTrackerModule.start(p1, P4, p3)
	end,
	finish = function(p1, p2) --[[ Line: 55 ]]
		-- upvalues: AppChatPerfEventInfoModule (copy), AppChatTTITrackerModule (copy), AppChatIntervalTrackerModule (copy)
		local P7 = p2 or {}
		
		return if AppChatPerfEventInfoModule.isTTIEvent(p1) then AppChatTTITrackerModule.finish(p1, P7) else AppChatIntervalTrackerModule.finish(p1)
	end,
	getEventName = function(p1) --[[ Line: 63 ]]
		-- upvalues: AppChatPerfEventInfoModule (copy), AppChatTTITrackerModule (copy)
		return if AppChatPerfEventInfoModule.isTTIEvent(p1) then AppChatTTITrackerModule.getEventName(p1) else nil
	end,
	trackMilestone = function(p1, p2, p3) --[[ Line: 70 ]]
		-- upvalues: AppChatPerfEventInfoModule (copy), AppChatTTITrackerModule (copy)
		local P11 = p3 or {}
		
		return if AppChatPerfEventInfoModule.isTTIEvent(p1) then AppChatTTITrackerModule.trackMilestone(p1, p2, P11) else false
	end,
	trackSubphase = function(p1, p2, p3, p4) --[[ Line: 78 ]]
		-- upvalues: AppChatPerfEventInfoModule (copy), AppChatTTITrackerModule (copy)
		local P15 = p4 or {}
		
		return if AppChatPerfEventInfoModule.isTTIEvent(p1) then AppChatTTITrackerModule.trackSubphase(p1, p2, p3, P15) else false
	end,
	trackRequest = function(p1, p2, p3, p4) --[[ Line: 91 ]]
		-- upvalues: AppChatPerfEventInfoModule (copy), AppChatTTITrackerModule (copy)
		local P19 = p4 or {}
		
		return if AppChatPerfEventInfoModule.isTTIEvent(p1) then AppChatTTITrackerModule.trackRequest(p1, p2, p3, P19) else false
	end,
	cancel = function(p1, p2) --[[ Line: 104 ]]
		-- upvalues: AppChatPerfEventInfoModule (copy), AppChatTTITrackerModule (copy), AppChatIntervalTrackerModule (copy)
		local P21 = p2 or {}
		
		return if AppChatPerfEventInfoModule.isTTIEvent(p1) then AppChatTTITrackerModule.cancel(p1, P21) else AppChatIntervalTrackerModule.cancel(p1)
	end
}