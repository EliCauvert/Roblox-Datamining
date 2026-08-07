local appChat = script:FindFirstAncestor("AppChat")
local _ = require(appChat.Parent.TimeToInteractiveTracker)
local appChatPerfEventInfoModule = require(appChat.Telemetry.AppChatPerfEventInfo)
local appChatTTITrackerModule = require(appChat.Telemetry.AppChatTTITracker)
local appChatIntervalTrackerModule = require(appChat.Telemetry.AppChatIntervalTracker)

return {
	Events = appChatPerfEventInfoModule.Events,
	Milestone = appChatTTITrackerModule.Milestone,
	Hooks = appChatTTITrackerModule.Hooks,
	setSharedContext = function(value) --[[ line: 33 ]]
		-- upvalues: appChatTTITrackerModule (ref)
		appChatTTITrackerModule.setSharedContext(value)
	end,
	isActive = function(p0, p1) --[[ line: 37 ]]
		-- upvalues: appChatPerfEventInfoModule (ref), appChatTTITrackerModule (ref), appChatIntervalTrackerModule (ref)
		return if appChatPerfEventInfoModule.isTTIEvent(p0) then appChatTTITrackerModule.isActive(p0, p1 or {}) else appChatIntervalTrackerModule.isActive(p0)
	end,
	start = function(p2, p3) --[[ line: 47 ]]
		-- upvalues: appChatPerfEventInfoModule (ref), appChatTTITrackerModule (ref), appChatIntervalTrackerModule (ref)
		p3 = p3 or {}
		
		return if appChatPerfEventInfoModule.isTTIEvent(p2) then appChatTTITrackerModule.start(p2, p3) else appChatIntervalTrackerModule.start(p2, p3)
	end,
	finish = function(p4, p5) --[[ line: 55 ]]
		-- upvalues: appChatPerfEventInfoModule (ref), appChatTTITrackerModule (ref), appChatIntervalTrackerModule (ref)
		return if appChatPerfEventInfoModule.isTTIEvent(p4) then appChatTTITrackerModule.finish(p4, p5 or {}) else appChatIntervalTrackerModule.finish(p4)
	end,
	getEventName = function(p6) --[[ line: 63 ]]
		-- upvalues: appChatPerfEventInfoModule (ref), appChatTTITrackerModule (ref)
		return if appChatPerfEventInfoModule.isTTIEvent(p6) then appChatTTITrackerModule.getEventName(p6) else nil
	end,
	trackMilestone = function(p7, p8, p9) --[[ line: 70 ]]
		-- upvalues: appChatPerfEventInfoModule (ref), appChatTTITrackerModule (ref)
		return if appChatPerfEventInfoModule.isTTIEvent(p7) then appChatTTITrackerModule.trackMilestone(p7, p8, p9 or {}) else false
	end,
	trackSubphase = function(p10, p11, p12, p13) --[[ line: 78 ]]
		-- upvalues: appChatPerfEventInfoModule (ref), appChatTTITrackerModule (ref)
		return if appChatPerfEventInfoModule.isTTIEvent(p10) then appChatTTITrackerModule.trackSubphase(p10, p11, p12, p13 or {}) else false
	end,
	trackRequest = function(p14, p15, p16, p17) --[[ line: 91 ]]
		-- upvalues: appChatPerfEventInfoModule (ref), appChatTTITrackerModule (ref)
		return if appChatPerfEventInfoModule.isTTIEvent(p14) then appChatTTITrackerModule.trackRequest(p14, p15, p16, p17 or {}) else false
	end,
	cancel = function(p18, p19) --[[ line: 104 ]]
		-- upvalues: appChatPerfEventInfoModule (ref), appChatTTITrackerModule (ref), appChatIntervalTrackerModule (ref)
		return if appChatPerfEventInfoModule.isTTIEvent(p18) then appChatTTITrackerModule.cancel(p18, p19 or {}) else appChatIntervalTrackerModule.cancel(p18)
	end
}