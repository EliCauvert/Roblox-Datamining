local PurchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local ProductPurchaseSurface = require(PurchasePrompt.Parent.PurchasePromptLite).Enums.ProductPurchaseSurface
local FFlagEnforceRobloxShopForAllSurfacesModule = require(PurchasePrompt.Flags.FFlagEnforceRobloxShopForAllSurfaces)
local List = {
	ProductPurchaseSurface.InExperienceShopHome,
	ProductPurchaseSurface.InExperienceShopSearch,
	ProductPurchaseSurface.InExperienceShopDetails
}

return function(Value): string
	-- upvalues: FFlagEnforceRobloxShopForAllSurfacesModule (copy), List (copy)
	return if FFlagEnforceRobloxShopForAllSurfacesModule then "ROBLOX_SHOP" elseif Value == nil or table.find(List, Value) == nil then "DEVELOPER_SHOP" else "ROBLOX_SHOP"
end