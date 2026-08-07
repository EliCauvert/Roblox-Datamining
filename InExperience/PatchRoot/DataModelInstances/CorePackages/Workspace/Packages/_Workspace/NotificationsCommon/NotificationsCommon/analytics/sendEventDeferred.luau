local eventIngestService = game:GetService("EventIngestService")
local getPlatformTarget = require(script.Parent.Parent.Parent.Analytics).getPlatformTarget

return function(p0, p1, p2) --[[ line: 5 ]]
	-- upvalues: eventIngestService (ref), getPlatformTarget (ref)
	eventIngestService:SendEventDeferred(getPlatformTarget(), p0, p1, p2 or {})
end