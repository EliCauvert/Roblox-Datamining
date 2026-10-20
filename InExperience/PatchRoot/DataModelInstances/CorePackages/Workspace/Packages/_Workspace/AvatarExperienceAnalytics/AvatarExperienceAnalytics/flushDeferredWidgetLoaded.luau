local GetUnifiedDeferredEventStoreModule = require(script.Parent.Store.getUnifiedDeferredEventStore)
local WIDGETLOADED = require(script.Parent.UnifiedEventLogEnums).MarketplaceUnifiedAction.WIDGET_LOADED

return function()
	-- upvalues: GetUnifiedDeferredEventStoreModule (copy), WIDGETLOADED (copy)
	local UnifiedDeferredEventStoreModule = GetUnifiedDeferredEventStoreModule(false)
	UnifiedDeferredEventStoreModule.markEntered()
	
	for _, value in UnifiedDeferredEventStoreModule.takePending(WIDGETLOADED) do
		value()
	end
end