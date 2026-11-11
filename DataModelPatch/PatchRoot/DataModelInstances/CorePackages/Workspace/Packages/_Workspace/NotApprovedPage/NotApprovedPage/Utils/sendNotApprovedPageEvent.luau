local Parent = script:FindFirstAncestor("NotApprovedPage").Parent
local CryoModule = require(Parent.Cryo)
local ArgCheckModule = require(Parent.ArgCheck)
local RbxAnalyticsService = game:GetService("RbxAnalyticsService")
local TelemetryService = game:GetService("TelemetryService")
local NotApprovedPageEventThrottleHunderedthsPercent = game:DefineFastInt("NotApprovedPageEventThrottleHunderedthsPercent", 10000)

function sendNotApprovedPageEvent(p1)
	-- upvalues: ArgCheckModule (copy), NotApprovedPageEventThrottleHunderedthsPercent (copy), CryoModule (copy), RbxAnalyticsService (copy), TelemetryService (copy)
	ArgCheckModule.assert(p1 ~= nil, "Additional arguments need to be provided to NotApprovedPageEventReporter.")
	ArgCheckModule.assert(p1.eventType ~= nil, "Event type needs to be provided to NotApprovedPageEventReporter")
	TelemetryService:LogEvent({
		eventName = "NotApprovedPageEvent",
		description = "Event for the Not Approved Page",
		links = "https://github.rbx.com/Roblox/proto-schemas/blob/master/production/eventstream/trustsafety/trustsafety_not_approved_page_event.proto",
		backends = { "EventIngest" },
		throttlingPercentage = NotApprovedPageEventThrottleHunderedthsPercent,
		lastUpdated = { 2025, 6, 12 }
	}, {
		customFields = CryoModule.Dictionary.join(p1 or {}, {
			context = "NotApprovedPageV2",
			platform = "UniversalApp",
			timestamp = DateTime.now().UnixTimestampMillis,
			sid = RbxAnalyticsService:GetSessionId()
		})
	})
end

return sendNotApprovedPageEvent