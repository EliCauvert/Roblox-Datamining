local GenericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local Parent = GenericAbuseReporting.Parent
local LocalPlayer = game:GetService("Players").LocalPlayer
local TelemetryService = game:GetService("TelemetryService")
local ArgCheckModule = require(Parent.ArgCheck)
local DashModule = require(Parent.Dash)
local AbuseEntrypointModule = require(GenericAbuseReporting.Enums.AbuseEntrypoint)
local _ = require(GenericAbuseReporting.Enums.AbuseVector)
local config = {
	eventName = "DynamicAbuseReportEvent",
	description = "Event to track dynamic abuse report",
	links = "https://github.rbx.com/Roblox/proto-schemas/pull/6068",
	lastUpdated = { 2024, 6, 18 },
	backends = { "EventIngest", "Points" },
	throttlingPercentage = game:DefineFastInt("DynamicAbuseReportThrottleHundredthsPercent", 0)
}

local function buildCustomFields(p1)
	-- upvalues: DashModule (copy), LocalPlayer (copy), AbuseEntrypointModule (copy)
	return {
		abuse_vector = p1.context.abuseVector,
		user_id = if LocalPlayer then LocalPlayer.UserId else 0,
		event_type = p1.eventType,
		entry_point = AbuseEntrypointModule.APP,
		meta = if p1.meta then DashModule.pretty(p1.meta, { depth = 10, multiline = false }) else nil
	}
end

return {
	sendAnalyticsEvent = function(p1)
		-- upvalues: ArgCheckModule (copy), TelemetryService (copy), config (copy), buildCustomFields (copy)
		ArgCheckModule.assert(p1.context, "customFields must be provided")
		ArgCheckModule.assert(p1.context.abuseVector, "customFields.abuse_vector must be provided")
		TelemetryService:LogEvent(config, { customFields = buildCustomFields(p1) })
	end,
	TelemetryEventType = {
		Abandoned = "EVENT_ABANDONED",
		Error = "EVENT_ERROR",
		Rendered = "EVENT_RENDERED",
		Submitted = "EVENT_SUBMITTED"
	}
}