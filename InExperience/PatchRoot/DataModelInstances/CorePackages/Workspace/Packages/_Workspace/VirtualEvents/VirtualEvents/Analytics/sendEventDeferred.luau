local VirtualEvents = script:FindFirstAncestor("VirtualEvents")
local EventIngestService = game:GetService("EventIngestService")
local HttpService = game:GetService("HttpService")
local GetPlatformTargetFunction = require(VirtualEvents.Parent.Analytics).getPlatformTarget
local LoggerModule = require(VirtualEvents.logger)

return function(EventName, AdditionalArgs) --[[ Line: 9 | Named "sendEventDeferred" ]]
	-- upvalues: LoggerModule (copy), HttpService (copy), EventIngestService (copy), GetPlatformTargetFunction (copy)
	LoggerModule:debug(string.format("Fired %q with payload %s", EventName, HttpService:JSONEncode(AdditionalArgs)))
	EventIngestService:SendEventDeferred(GetPlatformTargetFunction(), "virtualEvents", EventName, AdditionalArgs)
end