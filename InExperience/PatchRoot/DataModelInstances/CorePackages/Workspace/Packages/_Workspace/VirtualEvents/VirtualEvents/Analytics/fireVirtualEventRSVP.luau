local virtualEvents = script:FindFirstAncestor("VirtualEvents")
local enums = require(virtualEvents.Parent.VirtualEventsState).enums
local _ = require(virtualEvents.Parent.VirtualEventsState)
local sendEventDeferredModule = require(script.Parent.sendEventDeferred)

return function(p1)
	-- upvalues: sendEventDeferredModule (ref), enums (ref)
	sendEventDeferredModule(enums.AnalyticsEvent.VirtualEventRSVP, p1)
end