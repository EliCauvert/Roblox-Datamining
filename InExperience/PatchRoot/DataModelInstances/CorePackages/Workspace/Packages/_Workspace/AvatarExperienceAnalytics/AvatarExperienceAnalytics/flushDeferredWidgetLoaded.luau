local getUnifiedDeferredEventStoreModule = require(script.Parent.Store.getUnifiedDeferredEventStore)
local WIDGET_LOADED = require(script.Parent.UnifiedEventLogEnums).MarketplaceUnifiedAction.WIDGET_LOADED

return function() --[[ line: 6 | named "flushDeferredWidgetLoaded" ]]
	-- upvalues: getUnifiedDeferredEventStoreModule (ref), WIDGET_LOADED (ref)
	local var1 = getUnifiedDeferredEventStoreModule(false)
	var1.markEntered()
	
	for i, v in var1.takePending(WIDGET_LOADED) do
		v()
	end
end