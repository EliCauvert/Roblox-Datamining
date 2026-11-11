local EventConstantsModule = require(script.Parent.EventConstants)
local NewResult = require(script.Parent.Parent.dependencies).Analytics.AnalyticsReporters.EventIngest.new((game:GetService("EventIngestService")))

return {
	sendModalShownEvent = function(p1, State)
		-- upvalues: NewResult (copy), EventConstantsModule (copy)
		NewResult:sendEventDeferred(p1, EventConstantsModule.eventNames.modalShown, { state = State })
	end,
	sendButtonClickEvent = function(p1, Btn, State)
		-- upvalues: NewResult (copy), EventConstantsModule (copy)
		NewResult:sendEventDeferred(p1, EventConstantsModule.eventNames.buttonClick, { btn = Btn, state = State })
	end
}