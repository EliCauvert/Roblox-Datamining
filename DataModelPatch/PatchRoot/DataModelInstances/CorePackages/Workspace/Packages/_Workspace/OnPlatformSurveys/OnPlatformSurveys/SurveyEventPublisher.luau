local Parent = script.Parent
local Parent1 = Parent.Parent
local MessageBus = require(Parent1.MessageBus).MessageBus
local TModule = require(Parent1.t)
local config = {
	mid = MessageBus.getMessageId("Game", "openSurvey"),
	validateParams = TModule.strictInterface({
		eventType = TModule.valueOf((require(Parent.Enums.WebViewEventType))),
		customProps = TModule.optional(TModule.table)
	})
}

return {
	publishSurveyEvent = function(EventType)
		-- upvalues: MessageBus (copy), config (copy)
		MessageBus.publish(config, { eventType = EventType })
	end,
	OPEN_SURVEY_EVENT_DESCRIPTOR = config
}