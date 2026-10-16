local VirtualEvents = script:FindFirstAncestor("VirtualEvents")
local Enums = require(VirtualEvents.Parent.VirtualEventsState).enums
local _ = require(VirtualEvents.Parent.VirtualEventsState)
local SendEventDeferredModule = require(script.Parent.sendEventDeferred)

return function(p1) --[[ Line: 16 ]]
	-- upvalues: SendEventDeferredModule (copy), Enums (copy)
	SendEventDeferredModule(Enums.AnalyticsEvent.VirtualEventRSVP, p1)
end