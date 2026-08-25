local parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local edpStoreAnalyticsModule = require(parent.EdpStoreAnalytics)
local edpStoreAnalyticsLogger = edpStoreAnalyticsModule.EdpStoreAnalyticsLogger
local storeEnums = edpStoreAnalyticsModule.Constants.StoreEnums
local getActionTelemetryFieldValue = require(parent.SduiCoreSystem).getActionTelemetryFieldValue

return function(p0, p1, _)
	-- upvalues: getActionTelemetryFieldValue (ref), edpStoreAnalyticsLogger (ref), storeEnums (ref)
	local var1 = getActionTelemetryFieldValue(p0, p1, "productType")
	
	if var1 == nil then
		return
	end
	local var2 = getActionTelemetryFieldValue(p0, p1, "productId")
	edpStoreAnalyticsLogger.logEvent(storeEnums.ActionType.ItemClick, var1, getActionTelemetryFieldValue(p0, p1, "edpLocationType"), tonumber(getActionTelemetryFieldValue(p0, p1, "universeId")), tonumber(var2), tostring(var2))
end