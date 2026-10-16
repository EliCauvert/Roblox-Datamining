local Enums = require(script:FindFirstAncestor("VirtualEvents").Parent.VirtualEventsState).enums
local SendEventDeferredModule = require(script.Parent.sendEventDeferred)

return function(p1) --[[ Line: 13 ]]
	-- upvalues: SendEventDeferredModule (copy), Enums (copy)
	SendEventDeferredModule(Enums.AnalyticsEvent.EventDetailsPageVisit, p1)
end