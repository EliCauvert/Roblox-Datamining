local GenerateStringIdFunction = require(game:GetService("CorePackages").Workspace.Packages.AppCommonLib).GenerateStringId

return {
	mock = function()
		-- upvalues: GenerateStringIdFunction (copy)
		return {
			userAssetId = tostring(GenerateStringIdFunction()),
			userId = tostring(GenerateStringIdFunction()),
			userName = "",
			sellerHasVerifiedBadge = false,
			serialNumber = tostring(GenerateStringIdFunction()),
			priceInRobux = 0
		}
	end,
	fromSellPageAndResellers = function(p1)
		local config = { userAssetId = tostring(p1.userAssetId) }
		
		if p1.seller then
			config.userId = tostring(p1.seller.id)
			config.userName = p1.seller.name
			config.sellerHasVerifiedBadge = p1.seller.hasVerifiedBadge
		end
		config.serialNumber = p1.serialNumber and tostring(p1.serialNumber) or nil
		config.priceInRobux = p1.price
		config.isOnHold = p1.isOnHold
		
		return config
	end,
	fromPriceInRobux = function(p1, PriceInRobux)
		return { userAssetId = tostring(p1), priceInRobux = PriceInRobux }
	end
}