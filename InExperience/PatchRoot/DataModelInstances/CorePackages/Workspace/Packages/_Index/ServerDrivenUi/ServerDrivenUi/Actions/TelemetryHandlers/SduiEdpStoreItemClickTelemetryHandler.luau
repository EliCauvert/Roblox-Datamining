local Parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local EdpStoreAnalyticsModule = require(Parent.EdpStoreAnalytics)
local EdpStoreAnalyticsLogger = EdpStoreAnalyticsModule.EdpStoreAnalyticsLogger
local StoreEnums = EdpStoreAnalyticsModule.Constants.StoreEnums
local GetActionTelemetryFieldValueFunction = require(Parent.SduiCoreSystem).getActionTelemetryFieldValue

return function(p1, p2, _) --[[ Line: 16 | Named "SduiEdpStoreItemClickTelemetryHandler" ]]
	-- upvalues: GetActionTelemetryFieldValueFunction (copy), EdpStoreAnalyticsLogger (copy), StoreEnums (copy)
	local ProductType = GetActionTelemetryFieldValueFunction(p1, p2, "productType")
	
	if ProductType ~= nil then
		local EdpLocationType = GetActionTelemetryFieldValueFunction(p1, p2, "edpLocationType")
		local UniverseId = GetActionTelemetryFieldValueFunction(p1, p2, "universeId")
		local ProductId = GetActionTelemetryFieldValueFunction(p1, p2, "productId")
		EdpStoreAnalyticsLogger.logEvent(StoreEnums.ActionType.ItemClick, ProductType, EdpLocationType, tonumber(UniverseId), tonumber(ProductId), (tostring(ProductId)))
		
		return
	end
end