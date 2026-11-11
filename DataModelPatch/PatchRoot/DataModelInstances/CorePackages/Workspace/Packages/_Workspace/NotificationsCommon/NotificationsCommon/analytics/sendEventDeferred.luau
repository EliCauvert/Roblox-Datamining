local EventIngestService = game:GetService("EventIngestService")
local GetPlatformTargetFunction = require(script.Parent.Parent.Parent.Analytics).getPlatformTarget

return function(EventContext, EventName, p1)
	-- upvalues: EventIngestService (copy), GetPlatformTargetFunction (copy)
	EventIngestService:SendEventDeferred(GetPlatformTargetFunction(), EventContext, EventName, if p1 then p1 else {})
end