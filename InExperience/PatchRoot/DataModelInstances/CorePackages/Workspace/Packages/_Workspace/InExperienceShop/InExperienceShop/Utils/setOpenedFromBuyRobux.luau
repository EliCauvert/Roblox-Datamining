local GetInExperienceShopStoreModule = require(script:FindFirstAncestor("InExperienceShop").Stores.getInExperienceShopStore)

return function(p1) --[[ Line: 5 | Named "setOpenedFromBuyRobux" ]]
	-- upvalues: GetInExperienceShopStoreModule (copy)
	GetInExperienceShopStoreModule(false).setOpenedFromBuyRobux(p1)
end