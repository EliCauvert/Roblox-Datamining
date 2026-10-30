local PurchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local ProductTypeEnum = require(PurchasePrompt.types).ProductTypeEnum
local FFlagLuaAppsEnablePromptVIPServerPurchase = require(PurchasePrompt.Parent.SharedFlags).FFlagLuaAppsEnablePromptVIPServerPurchase

return function(UniverseId, InfoType, p1, p2, p3, p4, p5, p6, p7, p8, p9)
	-- upvalues: ProductTypeEnum (copy), FFlagLuaAppsEnablePromptVIPServerPurchase (copy)
	local P10 = p9 or {}
	
	return if InfoType == Enum.InfoType.Asset then {
		kind = ProductTypeEnum.Asset,
		id = tostring(UniverseId),
		equipIfPurchased = p1 or false,
		isRobloxPurchase = p2 or false,
		idempotencyKey = p3 or "",
		purchaseAuthToken = p4 or "",
		collectibleItemId = p5 or "",
		collectibleItemInstanceId = p6 or "",
		collectibleProductId = p7 or "",
		expectedPrice = p8 or 0
	} elseif InfoType == Enum.InfoType.GamePass then {
		kind = ProductTypeEnum.Gamepass,
		id = tostring(UniverseId)
	} elseif InfoType == Enum.InfoType.Product then {
		universeId = nil,
		kind = ProductTypeEnum.Product,
		id = tostring(UniverseId),
		equipIfPurchased = p1 or false
	} elseif InfoType == Enum.InfoType.Bundle then {
		kind = ProductTypeEnum.Bundle,
		id = tostring(UniverseId),
		idempotencyKey = p3 or "",
		collectibleItemId = p5 or "",
		collectibleItemInstanceId = p6 or "",
		collectibleProductId = p7 or "",
		expectedPrice = p8 or 0
	} elseif InfoType == ProductTypeEnum.Experience then {
		kind = ProductTypeEnum.Experience,
		universeId = tostring(UniverseId),
		experienceName = P10.name or "",
		experienceIconUrl = P10.imageUrl or ""
	} elseif InfoType == ProductTypeEnum.Look then {
		salesLocationId = 0,
		kind = ProductTypeEnum.Look,
		id = tostring(UniverseId),
		expectedPrice = P10.expectedPrice or (p8 or 0),
		excludedAssetIds = {},
		excludedBundleIds = {}
	} elseif FFlagLuaAppsEnablePromptVIPServerPurchase and InfoType == ProductTypeEnum.VIPServer then {
		kind = ProductTypeEnum.VIPServer,
		universeId = UniverseId
	} else nil
end