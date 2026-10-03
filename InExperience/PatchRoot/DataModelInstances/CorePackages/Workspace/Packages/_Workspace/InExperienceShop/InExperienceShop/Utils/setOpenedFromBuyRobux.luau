local getInExperienceShopStoreModule = require(script:FindFirstAncestor("InExperienceShop").Stores.getInExperienceShopStore)

return function(value)
	-- upvalues: getInExperienceShopStoreModule (ref)
	getInExperienceShopStoreModule(false).setOpenedFromBuyRobux(value)
end