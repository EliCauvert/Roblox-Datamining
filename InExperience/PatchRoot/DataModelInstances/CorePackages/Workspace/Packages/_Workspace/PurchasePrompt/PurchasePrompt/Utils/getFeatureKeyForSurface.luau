local purchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local productPurchaseSurface = require(purchasePrompt.Parent.PurchasePromptLite).Enums.ProductPurchaseSurface
local fFlagEnforceRobloxShopForAllSurfacesModule = require(purchasePrompt.Flags.FFlagEnforceRobloxShopForAllSurfaces)
local list = {
	productPurchaseSurface.InExperienceShopHome,
	productPurchaseSurface.InExperienceShopSearch,
	productPurchaseSurface.InExperienceShopDetails
}

return function(p1)
	-- upvalues: fFlagEnforceRobloxShopForAllSurfacesModule (ref), list (ref)
	return if fFlagEnforceRobloxShopForAllSurfacesModule then "ROBLOX_SHOP" elseif p1 == nil or table.find(list, p1) == nil then "DEVELOPER_SHOP" else "ROBLOX_SHOP"
end