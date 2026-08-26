local enums = require(script:FindFirstAncestor("VirtualEvents").Parent.VirtualEventsState).enums
local sendEventDeferredModule = require(script.Parent.sendEventDeferred)

return function(p1)
	-- upvalues: sendEventDeferredModule (ref), enums (ref)
	sendEventDeferredModule(enums.AnalyticsEvent.EventDetailsPageVisit, p1)
end