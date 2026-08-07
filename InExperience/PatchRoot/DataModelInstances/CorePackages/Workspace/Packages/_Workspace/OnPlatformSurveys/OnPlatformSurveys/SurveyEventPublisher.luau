local parent = script.Parent
local parent_1 = parent.Parent
local messageBus = require(parent_1.MessageBus).MessageBus
local tModule = require(parent_1.t)
local t = {
	mid = messageBus.getMessageId("Game", "openSurvey"),
	validateParams = tModule.strictInterface({
		eventType = tModule.valueOf(require(parent.Enums.WebViewEventType)),
		customProps = tModule.optional(tModule.table)
	})
}

return {
	publishSurveyEvent = function(p0) --[[ line: 30 ]]
		-- upvalues: messageBus (ref), t (ref)
		messageBus.publish(t, { eventType = p0 })
	end,
	OPEN_SURVEY_EVENT_DESCRIPTOR = t
}