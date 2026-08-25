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

return function(p0, p1, _)
	-- upvalues: getActionTelemetryFieldValue (ref), t (ref), edpStoreAnalyticsLogger (ref), storeEnums (ref)
	local var2 = getActionTelemetryFieldValue(p0, p1, "kind")
	local var3 = var2 and t[var2]
	
	if var3 == nil then
		return
	end
	local var4 = getActionTelemetryFieldValue(p0, p1, "productId")
	edpStoreAnalyticsLogger.logEvent(storeEnums.ActionType.PurchaseAttemptClick, var3, getActionTelemetryFieldValue(p0, p1, "edpLocationType"), tonumber(getActionTelemetryFieldValue(p0, p1, "universeId")), tonumber(var4), tostring(var4))
end