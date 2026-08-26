local eventIngestService = game:GetService("EventIngestService")
local getPlatformTarget = require(script.Parent.Parent.Parent.Analytics).getPlatformTarget

return function(p1, p2, p3)
	-- upvalues: eventIngestService (ref), getPlatformTarget (ref)
	eventIngestService:SendEventDeferred(getPlatformTarget(), p1, p2, p3 or {})
end