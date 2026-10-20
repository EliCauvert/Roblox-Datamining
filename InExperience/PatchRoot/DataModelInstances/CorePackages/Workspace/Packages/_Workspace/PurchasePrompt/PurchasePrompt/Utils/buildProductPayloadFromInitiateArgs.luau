local ProductTypeEnum = require(script:FindFirstAncestor("PurchasePrompt").types).ProductTypeEnum

return function(p1, InfoType, p2, p3, p4, p5, p6, p7, p8, p9, p10)
	-- upvalues: ProductTypeEnum (copy)
	local P10 = p10 or {}
	
	return if InfoType == Enum.InfoType.Asset then {
		kind = ProductTypeEnum.Asset,
		id = tostring(p1),
		equipIfPurchased = p2 or false,
		isRobloxPurchase = p3 or false,
		idempotencyKey = p4 or "",
		purchaseAuthToken = p5 or "",
		collectibleItemId = p6 or "",
		collectibleItemInstanceId = p7 or "",
		collectibleProductId = p8 or "",
		expectedPrice = p9 or 0
	} elseif InfoType == Enum.InfoType.GamePass then { kind = ProductTypeEnum.Gamepass, id = tostring(p1) } elseif InfoType == Enum.InfoType.Product then {
		universeId = nil,
		kind = ProductTypeEnum.Product,
		id = tostring(p1),
		equipIfPurchased = p2 or false
	} elseif InfoType == Enum.InfoType.Bundle then {
		kind = ProductTypeEnum.Bundle,
		id = tostring(p1),
		idempotencyKey = p4 or "",
		collectibleItemId = p6 or "",
		collectibleItemInstanceId = p7 or "",
		collectibleProductId = p8 or "",
		expectedPrice = p9 or 0
	} elseif InfoType == ProductTypeEnum.Experience then {
		kind = ProductTypeEnum.Experience,
		universeId = tostring(p1),
		experienceName = P10.name or "",
		experienceIconUrl = P10.imageUrl or ""
	} elseif InfoType == ProductTypeEnum.Look then {
		salesLocationId = 0,
		kind = ProductTypeEnum.Look,
		id = tostring(p1),
		expectedPrice = P10.expectedPrice or (p9 or 0),
		excludedAssetIds = {},
		excludedBundleIds = {}
	} else nil
end