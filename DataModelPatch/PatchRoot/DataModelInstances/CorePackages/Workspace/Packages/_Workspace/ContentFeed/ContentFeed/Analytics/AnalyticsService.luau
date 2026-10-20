local Parent = script.Parent.Parent.Parent
local EventIngestService = game:GetService("EventIngestService")
local GetPlatformTargetFunction = require(Parent.Analytics).getPlatformTarget

return {
	EventStream = {
		setRBXEventStream = function(_, EventContext, EventName, p1)
			-- upvalues: EventIngestService (copy), GetPlatformTargetFunction (copy)
			EventIngestService:SetRBXEventStream(GetPlatformTargetFunction(), EventContext, EventName, p1 or {})
		end
	},
	Telemetry = require(Parent.LoggingProtocol).default
}