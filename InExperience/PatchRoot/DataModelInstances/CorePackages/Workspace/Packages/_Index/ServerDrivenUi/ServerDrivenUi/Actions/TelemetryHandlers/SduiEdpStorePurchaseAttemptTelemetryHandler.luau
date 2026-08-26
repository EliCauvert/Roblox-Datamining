local parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local edpStoreAnalyticsModule = require(parent.EdpStoreAnalytics)
local edpStoreAnalyticsLogger = edpStoreAnalyticsModule.EdpStoreAnalyticsLogger
local storeEnums = edpStoreAnalyticsModule.Constants.StoreEnums
local productKind = require(parent.PurchasePromptLite).Enums.ProductKind
local getActionTelemetryFieldValue = require(parent.SduiCoreSystem).getActionTelemetryFieldValue
local t = {
	[productKind.Gamepass] = storeEnums.ProductType.GamePasses,
	[productKind.DeveloperSubscription] = storeEnums.ProductType.Subscriptions,
	[productKind.Product] = storeEnums.ProductType.DeveloperProducts
}

return function(p1, p2, _)
	-- upvalues: getActionTelemetryFieldValue (ref), t (ref), edpStoreAnalyticsLogger (ref), storeEnums (ref)
	local var1 = getActionTelemetryFieldValue(p1, p2, "kind")
	local var2 = var1 and t[var1]
	
	if var2 == nil then
		return
	end
	local var3 = getActionTelemetryFieldValue(p1, p2, "productId")
	edpStoreAnalyticsLogger.logEvent(storeEnums.ActionType.PurchaseAttemptClick, var2, getActionTelemetryFieldValue(p1, p2, "edpLocationType"), tonumber(getActionTelemetryFieldValue(p1, p2, "universeId")), tonumber(var3), tostring(var3))
end