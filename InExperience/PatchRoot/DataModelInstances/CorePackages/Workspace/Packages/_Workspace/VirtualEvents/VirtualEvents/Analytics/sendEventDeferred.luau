local virtualEvents = script:FindFirstAncestor("VirtualEvents")
local eventIngestService = game:GetService("EventIngestService")
local httpService = game:GetService("HttpService")
local getPlatformTarget = require(virtualEvents.Parent.Analytics).getPlatformTarget
local loggerModule = require(virtualEvents.logger)

return function(p1, p2)
	-- upvalues: loggerModule (ref), httpService (ref), eventIngestService (ref), getPlatformTarget (ref)
	loggerModule:debug(string.format("Fired %q with payload %s", p1, httpService:JSONEncode(p2)))
	eventIngestService:SendEventDeferred(getPlatformTarget(), "virtualEvents", p1, p2)
end