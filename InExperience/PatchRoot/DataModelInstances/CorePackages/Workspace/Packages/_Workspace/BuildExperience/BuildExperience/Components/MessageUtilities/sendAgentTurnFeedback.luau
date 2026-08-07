local telemetryService = game:GetService("TelemetryService")
local buildExperience = script:FindFirstAncestor("BuildExperience")
local creatorAgentChatModule = require(buildExperience.Parent.DataHydration.CreatorAgentChat)
local _ = require(buildExperience.Chat.chatTypes)
local _ = require(script.Parent.FeedbackAction)
local debug = creatorAgentChatModule.debug
local t = {
	eventName = "agentTurnFeedback",
	description = "Fires when a user reacts to an agent turn (thumbs up, thumbs down, or revert).",
	backends = { "Points", "EventIngest" },
	throttlingPercentage = game:DefineFastInt("AgentTurnFeedbackEventThrottleHundredthsPercent", 0),
	lastUpdated = { 2026, 6, 12 }
}

return function(p0, p1) --[[ line: 24 | named "sendAgentTurnFeedback" ]]
	-- upvalues: debug (ref), telemetryService (ref), t (ref)
	local t_1 = {
		action = p0,
		universeid = p1.universeId,
		placeid = p1.placeId,
		sessionid = p1.sessionId,
		sequenceId = p1.sequenceId,
		turnId = p1.turnId
	}
	debug.log("info", "agent_turn_feedback sending event", { customFields = t_1 })
	telemetryService:LogEvent(t, { standardizedFields = { "addUserId" }, customFields = t_1 })
end