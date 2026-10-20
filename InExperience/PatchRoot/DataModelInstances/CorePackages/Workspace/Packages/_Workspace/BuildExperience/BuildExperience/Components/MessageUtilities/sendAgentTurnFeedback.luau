local TelemetryService = game:GetService("TelemetryService")
local BuildExperience = script:FindFirstAncestor("BuildExperience")
local _ = require(BuildExperience.Chat.chatTypes)
local _ = require(script.Parent.FeedbackAction)
local Debug = require(BuildExperience.Parent.DataHydration.CreatorAgentChat).debug
local config = {
	eventName = "agentTurnFeedback",
	description = "Fires when a user interacts with an agent turn (thumbs up, thumbs down, copy, or revert).",
	backends = { "Points", "EventIngest" },
	throttlingPercentage = game:DefineFastInt("AgentTurnFeedbackEventThrottleHundredthsPercent", 0),
	lastUpdated = { 2026, 7, 30 }
}

return function(Action, p1)
	-- upvalues: Debug (copy), TelemetryService (copy), config (copy)
	local CustomFields = {
		action = Action,
		universeid = p1.universeId,
		placeid = p1.placeId,
		sessionid = p1.sessionId,
		sequenceId = p1.sequenceId,
		turnId = p1.turnId
	}
	Debug.log("info", "agent_turn_feedback sending event", { customFields = CustomFields })
	TelemetryService:LogEvent(config, {
		standardizedFields = { "addUserId" },
		customFields = CustomFields
	})
end