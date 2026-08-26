local parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local edpStoreAnalyticsModule = require(parent.EdpStoreAnalytics)
local edpStoreAnalyticsLogger = edpStoreAnalyticsModule.EdpStoreAnalyticsLogger
local storeEnums = edpStoreAnalyticsModule.Constants.StoreEnums
local getActionTelemetryFieldValue = require(parent.SduiCoreSystem).getActionTelemetryFieldValue

return function(p1, p2, _)
	-- upvalues: getActionTelemetryFieldValue (ref), edpStoreAnalyticsLogger (ref), storeEnums (ref)
	local var1 = getActionTelemetryFieldValue(p1, p2, "productType")
	
	if var1 == nil then
		return
	end
	local var2 = getActionTelemetryFieldValue(p1, p2, "productId")
	edpStoreAnalyticsLogger.logEvent(storeEnums.ActionType.ItemClick, var1, getActionTelemetryFieldValue(p1, p2, "edpLocationType"), tonumber(getActionTelemetryFieldValue(p1, p2, "universeId")), tonumber(var2), tostring(var2))
end