local HttpService = game:GetService("HttpService")
local TelemetryService = game:GetService("TelemetryService")
local BuildExperience = script:FindFirstAncestor("BuildExperience")
local FFlagBuildExperienceChatOpenIdModule = require(BuildExperience.Flags.FFlagBuildExperienceChatOpenId)
local FFlagBuildExperienceTurnWorkTelemetryModule = require(BuildExperience.Flags.FFlagBuildExperienceTurnWorkTelemetry)
local GetBuildExperienceEventFieldsModule = require(script.Parent.getBuildExperienceEventFields)
local config = {
	eventName = "buildExperienceEvent",
	backends = { "Points", "EventIngest" },
	throttlingPercentage = game:DefineFastInt("BuildExperienceEventThrottleHundredthsPercent", 0),
	lastUpdated = if FFlagBuildExperienceTurnWorkTelemetryModule then { 2026, 11, 23 } elseif FFlagBuildExperienceChatOpenIdModule then { 2026, 11, 11 } else { 2026, 11, 2 },
	description = if FFlagBuildExperienceTurnWorkTelemetryModule then "Client events for Build tab interactions, chat opens, prompt chips, Library browsing and contextual prompt submissions, prompt send lifecycle (start, stall, stop, failure), taps on a chat turn's step list, how long the turn ran in view and in the background, what its step titles came from, and how long its header and steps were open, playtesting, private invites, private playtest preview taps, monetization, ad-upsell impressions and clicks, and Analytics page goal card and locked-action impressions and clicks." else "Client events for Build tab interactions, chat opens, prompt chips, Library browsing and contextual prompt submissions, prompt send lifecycle (start, stall, stop, failure), playtesting, private invites, private playtest preview taps, monetization, ad-upsell impressions and clicks, and Analytics page goal card and locked-action impressions and clicks."
}

return function(EventType, p1, Input)
	-- upvalues: HttpService (copy), TelemetryService (copy), config (copy), FFlagBuildExperienceChatOpenIdModule (copy), GetBuildExperienceEventFieldsModule (copy)
	local config1 = {
		eventType = EventType,
		universeId = p1.universeId,
		placeId = p1.placeId,
		conversationId = p1.conversationId,
		messageId = p1.messageId,
		turnId = p1.turnId,
		parameters = if Input then HttpService:JSONEncode(Input) else nil
	}
	TelemetryService:LogEvent(config, {
		standardizedFields = { "addUserId", "addSessionId" },
		customFields = if FFlagBuildExperienceChatOpenIdModule then GetBuildExperienceEventFieldsModule(EventType, p1, Input) else config1
	})
end