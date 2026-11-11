local Parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local EdpStoreAnalyticsModule = require(Parent.EdpStoreAnalytics)
local EdpStoreAnalyticsLogger = EdpStoreAnalyticsModule.EdpStoreAnalyticsLogger
local StoreEnums = EdpStoreAnalyticsModule.Constants.StoreEnums
local ProductKind = require(Parent.PurchasePromptLite).Enums.ProductKind
local GetActionTelemetryFieldValueFunction = require(Parent.SduiCoreSystem).getActionTelemetryFieldValue
local config = {
	[ProductKind.Gamepass] = StoreEnums.ProductType.GamePasses,
	[ProductKind.DeveloperSubscription] = StoreEnums.ProductType.Subscriptions,
	[ProductKind.Product] = StoreEnums.ProductType.DeveloperProducts
}

return function(p1, p2, _)
	-- upvalues: GetActionTelemetryFieldValueFunction (copy), config (copy), EdpStoreAnalyticsLogger (copy), StoreEnums (copy)
	local Kind = GetActionTelemetryFieldValueFunction(p1, p2, "kind")
	local Entry = Kind and config[Kind]
	
	if Entry ~= nil then
		local EdpLocationType = GetActionTelemetryFieldValueFunction(p1, p2, "edpLocationType")
		local UniverseId = GetActionTelemetryFieldValueFunction(p1, p2, "universeId")
		local ProductId = GetActionTelemetryFieldValueFunction(p1, p2, "productId")
		EdpStoreAnalyticsLogger.logEvent(StoreEnums.ActionType.PurchaseAttemptClick, Entry, EdpLocationType, tonumber(UniverseId), tonumber(ProductId), (tostring(ProductId)))
		
		return
	end
end