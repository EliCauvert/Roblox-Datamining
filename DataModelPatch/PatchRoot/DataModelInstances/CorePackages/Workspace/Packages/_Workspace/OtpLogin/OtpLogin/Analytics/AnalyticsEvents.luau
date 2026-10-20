local EventConstantsModule = require(script.Parent.EventConstants)
local NewResult = require(script.Parent.Parent.dependencies).Analytics.AnalyticsReporters.EventIngest.new((game:GetService("EventIngestService")))

return {
	sendPageLoadEvent = function(p1, Origin)
		-- upvalues: NewResult (copy), EventConstantsModule (copy)
		NewResult:sendEventDeferred(p1, EventConstantsModule.eventNames.pageLoad, { origin = Origin })
	end,
	sendFormInteractionEvent = function(p1, Origin, Field)
		-- upvalues: NewResult (copy), EventConstantsModule (copy)
		NewResult:sendEventDeferred(p1, EventConstantsModule.eventNames.formInteraction, { origin = Origin, field = Field })
	end,
	sendButtonClickEvent = function(p1, Origin, Btn)
		-- upvalues: NewResult (copy), EventConstantsModule (copy)
		NewResult:sendEventDeferred(p1, EventConstantsModule.eventNames.buttonClick, { origin = Origin, btn = Btn })
	end,
	sendMsgShownEvent = function(p1, Origin, Field, p2)
		-- upvalues: NewResult (copy), EventConstantsModule (copy)
		NewResult:sendEventDeferred(p1, EventConstantsModule.eventNames.msgShown, {
			origin = Origin,
			field = Field,
			errorCode = tostring(p2)
		})
	end
}