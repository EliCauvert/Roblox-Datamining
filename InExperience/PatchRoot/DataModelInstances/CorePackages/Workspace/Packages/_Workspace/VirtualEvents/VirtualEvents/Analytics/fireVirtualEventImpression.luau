local Enums = require(script:FindFirstAncestor("VirtualEvents").Parent.VirtualEventsState).enums
local SendEventDeferredModule = require(script.Parent.sendEventDeferred)

return function(p1)
	-- upvalues: SendEventDeferredModule (copy), Enums (copy)
	SendEventDeferredModule(Enums.AnalyticsEvent.VirtualEventImpression, p1)
end