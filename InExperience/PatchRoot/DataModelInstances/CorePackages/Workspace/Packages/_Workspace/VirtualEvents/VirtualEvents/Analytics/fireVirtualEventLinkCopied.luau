local enums = require(script:FindFirstAncestor("VirtualEvents").Parent.VirtualEventsState).enums
local sendEventDeferredModule = require(script.Parent.sendEventDeferred)

return function(p0) --[[ line: 14 ]]
	-- upvalues: sendEventDeferredModule (ref), enums (ref)
	sendEventDeferredModule(enums.AnalyticsEvent.VirtualEventLinkCopied, p0)
end