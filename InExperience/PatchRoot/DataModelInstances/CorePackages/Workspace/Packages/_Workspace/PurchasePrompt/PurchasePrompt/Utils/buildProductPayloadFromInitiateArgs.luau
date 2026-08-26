local productTypeEnum = require(script:FindFirstAncestor("PurchasePrompt").types).ProductTypeEnum

return function(a, b, p1, p2, p3, p4, p5, p6, p7, p8, p9)
	-- upvalues: productTypeEnum (ref)
	p9 = p9 or {}
	
	return if b == Enum.InfoType.Asset then {
		kind = productTypeEnum.Asset,
		id = tostring(a),
		equipIfPurchased = p1 or false,
		isRobloxPurchase = p2 or false,
		idempotencyKey = p3 or "",
		purchaseAuthToken = p4 or "",
		collectibleItemId = p5 or "",
		collectibleItemInstanceId = p6 or "",
		collectibleProductId = p7 or "",
		expectedPrice = p8 or 0
	} elseif b == Enum.InfoType.GamePass then { kind = productTypeEnum.Gamepass, id = tostring(a) } elseif b == Enum.InfoType.Product then {
		universeId = nil,
		kind = productTypeEnum.Product,
		id = tostring(a),
		equipIfPurchased = p1 or false
	} elseif b == Enum.InfoType.Bundle then {
		kind = productTypeEnum.Bundle,
		id = tostring(a),
		idempotencyKey = p3 or "",
		collectibleItemId = p5 or "",
		collectibleItemInstanceId = p6 or "",
		collectibleProductId = p7 or "",
		expectedPrice = p8 or 0
	} elseif b == productTypeEnum.Experience then {
		kind = productTypeEnum.Experience,
		universeId = tostring(a),
		experienceName = p9.name or "",
		experienceIconUrl = p9.imageUrl or ""
	} elseif b == productTypeEnum.Look then {
		salesLocationId = 0,
		kind = productTypeEnum.Look,
		id = tostring(a),
		expectedPrice = p9.expectedPrice or (p8 or 0),
		excludedAssetIds = {},
		excludedBundleIds = {}
	} else nil
end