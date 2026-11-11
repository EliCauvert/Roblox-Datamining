local ResultModule = require(script:FindFirstAncestor("DiscoveryMonolith").Parent.Result)
local CatalogBundleModule = {
	new = function()
		return {}
	end
}

function CatalogBundleModule.mock()
	-- upvalues: CatalogBundleModule (copy)
	local NewCatalogBundle = CatalogBundleModule.new()
	NewCatalogBundle.creatorId = 1
	NewCatalogBundle.creatorName = "Roblox"
	NewCatalogBundle.creatorType = "User"
	NewCatalogBundle.itemRestrictions = {}
	NewCatalogBundle.itemStatus = {}
	NewCatalogBundle.lowestPrice = 1
	NewCatalogBundle.name = "Serena"
	NewCatalogBundle.noPriceStatus = "Free"
	NewCatalogBundle.numberRemaining = 10
	NewCatalogBundle.premiumPricing = { premiumPriceInRobux = 0 }
	NewCatalogBundle.priceInRobux = 0
	
	return NewCatalogBundle
end

function CatalogBundleModule.fromJsonData(p1)
	-- upvalues: CatalogBundleModule (copy), ResultModule (copy)
	local NewCatalogBundle = CatalogBundleModule.new()
	NewCatalogBundle.creatorId = p1.creatorId
	NewCatalogBundle.creatorName = p1.creatorName
	NewCatalogBundle.creatorType = p1.creatorType
	NewCatalogBundle.itemRestrictions = p1.itemRestrictions
	NewCatalogBundle.itemStatus = p1.itemStatus
	NewCatalogBundle.lowestPrice = p1.lowestPrice
	NewCatalogBundle.name = p1.name
	NewCatalogBundle.noPriceStatus = p1.noPriceStatus
	NewCatalogBundle.numberRemaining = p1.numberRemaining
	NewCatalogBundle.premiumPricing = p1.premiumPrice and { premiumPriceInRobux = p1.premiumPrice } or nil
	NewCatalogBundle.priceInRobux = p1.price
	
	return ResultModule.success(NewCatalogBundle)
end

return CatalogBundleModule