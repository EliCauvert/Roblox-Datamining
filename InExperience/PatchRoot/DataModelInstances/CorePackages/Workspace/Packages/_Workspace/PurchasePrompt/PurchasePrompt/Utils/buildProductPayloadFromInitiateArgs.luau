local productTypeEnum = require(script:FindFirstAncestor("PurchasePrompt").types).ProductTypeEnum

return function(a, b, p0, p1, p2, p3, p4, p5, p6, p7, p8)
	-- upvalues: productTypeEnum (ref)
	p8 = p8 or {}
	
	return if b == Enum.InfoType.Asset then {
		kind = productTypeEnum.Asset,
		id = tostring(a),
		equipIfPurchased = p0 or false,
		isRobloxPurchase = p1 or false,
		idempotencyKey = p2 or "",
		purchaseAuthToken = p3 or "",
		collectibleItemId = p4 or "",
		collectibleItemInstanceId = p5 or "",
		collectibleProductId = p6 or "",
		expectedPrice = p7 or 0
	} elseif b == Enum.InfoType.GamePass then { kind = productTypeEnum.Gamepass, id = tostring(a) } elseif b == Enum.InfoType.Product then {
		universeId = nil,
		kind = productTypeEnum.Product,
		id = tostring(a),
		equipIfPurchased = p0 or false
	} elseif b == Enum.InfoType.Bundle then {
		kind = productTypeEnum.Bundle,
		id = tostring(a),
		idempotencyKey = p2 or "",
		collectibleItemId = p4 or "",
		collectibleItemInstanceId = p5 or "",
		collectibleProductId = p6 or "",
		expectedPrice = p7 or 0
	} elseif b == productTypeEnum.Experience then {
		kind = productTypeEnum.Experience,
		universeId = tostring(a),
		experienceName = p8.name or "",
		experienceIconUrl = p8.imageUrl or ""
	} elseif b == productTypeEnum.Look then {
		salesLocationId = 0,
		kind = productTypeEnum.Look,
		id = tostring(a),
		expectedPrice = p8.expectedPrice or (p7 or 0),
		excludedAssetIds = {},
		excludedBundleIds = {}
	} else nil
end