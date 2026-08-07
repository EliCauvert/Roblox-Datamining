local genericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local parent = genericAbuseReporting.Parent
local localPlayer = game:GetService("Players").LocalPlayer
local telemetryService = game:GetService("TelemetryService")
local argCheckModule = require(parent.ArgCheck)
local dashModule = require(parent.Dash)
local abuseEntrypointModule = require(genericAbuseReporting.Enums.AbuseEntrypoint)
local _ = require(genericAbuseReporting.Enums.AbuseVector)
local t = {
	Abandoned = "EVENT_ABANDONED",
	Error = "EVENT_ERROR",
	Rendered = "EVENT_RENDERED",
	Submitted = "EVENT_SUBMITTED"
}
local t_1 = {
	eventName = "DynamicAbuseReportEvent",
	description = "Event to track dynamic abuse report",
	links = "https://github.rbx.com/Roblox/proto-schemas/pull/6068",
	lastUpdated = { 2024, 6, 18 },
	backends = { "EventIngest", "Points" },
	throttlingPercentage = game:DefineFastInt("DynamicAbuseReportThrottleHundredthsPercent", 0)
}

local function buildCustomFields(p0) --[[ line: 60 ]]
	-- upvalues: dashModule (ref), localPlayer (ref), abuseEntrypointModule (ref)
	return {
		abuse_vector = p0.context.abuseVector,
		user_id = if localPlayer then localPlayer.UserId else 0,
		event_type = p0.eventType,
		entry_point = abuseEntrypointModule.APP,
		meta = if p0.meta then dashModule.pretty(p0.meta, { depth = 10, multiline = false }) else nil
	}
end

return {
	sendAnalyticsEvent = function(p1) --[[ line: 76 ]]
		-- upvalues: argCheckModule (ref), telemetryService (ref), t_1 (ref), buildCustomFields (ref)
		argCheckModule.assert(p1.context, "customFields must be provided")
		argCheckModule.assert(p1.context.abuseVector, "customFields.abuse_vector must be provided")
		telemetryService:LogEvent(t_1, { customFields = buildCustomFields(p1) })
	end,
	TelemetryEventType = t
}