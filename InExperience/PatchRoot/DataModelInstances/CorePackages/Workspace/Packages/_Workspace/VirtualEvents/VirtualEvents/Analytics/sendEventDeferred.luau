local virtualEvents = script:FindFirstAncestor("VirtualEvents")
local eventIngestService = game:GetService("EventIngestService")
local httpService = game:GetService("HttpService")
local getPlatformTarget = require(virtualEvents.Parent.Analytics).getPlatformTarget
local loggerModule = require(virtualEvents.logger)

return function(p0, p1)
	-- upvalues: loggerModule (ref), httpService (ref), eventIngestService (ref), getPlatformTarget (ref)
	loggerModule:debug(string.format("Fired %q with payload %s", p0, httpService:JSONEncode(p1)))
	eventIngestService:SendEventDeferred(getPlatformTarget(), "virtualEvents", p0, p1)
end