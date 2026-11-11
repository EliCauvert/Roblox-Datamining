local ResultModule = require(script:FindFirstAncestor("DiscoveryMonolith").Parent.Result)
local CatalogAssetModule = {
	new = function()
		return {}
	end
}

function CatalogAssetModule.mock()
	-- upvalues: CatalogAssetModule (copy)
	local NewCatalogAsset = CatalogAssetModule.new()
	NewCatalogAsset.creatorId = 1
	NewCatalogAsset.creatorName = "Roblox"
	NewCatalogAsset.creatorType = "User"
	NewCatalogAsset.itemRestrictions = {}
	NewCatalogAsset.itemStatus = {}
	NewCatalogAsset.lowestPrice = 1
	NewCatalogAsset.name = "Wings of Fire - Zara Larsson"
	NewCatalogAsset.noPriceStatus = "nopriceStatus"
	NewCatalogAsset.numberRemaining = 10
	NewCatalogAsset.premiumPricing = { premiumPriceInRobux = 5 }
	NewCatalogAsset.priceInRobux = 115
	
	return NewCatalogAsset
end

function CatalogAssetModule.fromJsonData(p1)
	-- upvalues: CatalogAssetModule (copy), ResultModule (copy)
	local NewCatalogAsset = CatalogAssetModule.new()
	NewCatalogAsset.creatorId = p1.creatorId
	NewCatalogAsset.creatorName = p1.creatorName
	NewCatalogAsset.creatorType = p1.creatorType
	NewCatalogAsset.itemRestrictions = p1.itemRestrictions
	NewCatalogAsset.itemStatus = p1.itemStatus
	NewCatalogAsset.lowestPrice = p1.lowestPrice
	NewCatalogAsset.name = p1.name
	NewCatalogAsset.noPriceStatus = p1.noPriceStatus
	NewCatalogAsset.numberRemaining = p1.numberRemaining
	NewCatalogAsset.premiumPricing = p1.premiumPrice and { premiumPriceInRobux = p1.premiumPrice } or nil
	NewCatalogAsset.priceInRobux = p1.price
	
	return ResultModule.success(NewCatalogAsset)
end

return CatalogAssetModule