local GetInExperienceShopStoreModule = require(script:FindFirstAncestor("InExperienceShop").Stores.getInExperienceShopStore)

return function(p1)
	-- upvalues: GetInExperienceShopStoreModule (copy)
	GetInExperienceShopStoreModule(false).setOpenedFromBuyRobux(p1)
end