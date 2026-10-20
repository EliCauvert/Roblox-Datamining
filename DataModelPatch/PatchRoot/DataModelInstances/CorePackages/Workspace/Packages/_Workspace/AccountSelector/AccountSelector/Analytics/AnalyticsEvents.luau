local EventConstantsModule = require(script.Parent.EventConstants)
local NewResult = require(script.Parent.Parent.dependencies).Analytics.AnalyticsReporters.EventIngest.new((game:GetService("EventIngestService")))

return {
	sendPageLoadEvent = function(p1, Origin, State)
		-- upvalues: NewResult (copy), EventConstantsModule (copy)
		NewResult:sendEventDeferred(p1, EventConstantsModule.eventNames.pageLoad, { origin = Origin, state = State })
	end,
	sendSelectEvent = function(p1, Origin, State)
		-- upvalues: NewResult (copy), EventConstantsModule (copy)
		NewResult:sendEventDeferred(p1, EventConstantsModule.eventNames.buttonClick, {
			origin = Origin,
			btn = EventConstantsModule.btn.select,
			state = State
		})
	end,
	sendModalShownEvent = function(p1, Origin)
		-- upvalues: NewResult (copy), EventConstantsModule (copy)
		NewResult:sendEventDeferred(p1, EventConstantsModule.eventNames.modalShown, { origin = Origin })
	end,
	sendButtonClickEvent = function(p1, Origin, Btn)
		-- upvalues: NewResult (copy), EventConstantsModule (copy)
		NewResult:sendEventDeferred(p1, EventConstantsModule.eventNames.buttonClick, { origin = Origin, btn = Btn })
	end
}