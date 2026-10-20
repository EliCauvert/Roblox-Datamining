local ProductPurchaseSurface = require(script:FindFirstAncestor("InExperienceShop").Parent.PurchasePromptLite).Enums.ProductPurchaseSurface
local ConstantsModule = require(script.Parent.Constants)

return function(Home)
	-- upvalues: ConstantsModule (copy), ProductPurchaseSurface (copy)
	return if Home == ConstantsModule.ShopPageType.Home then ProductPurchaseSurface.InExperienceShopHome elseif Home == ConstantsModule.ShopPageType.Search then ProductPurchaseSurface.InExperienceShopSearch else ProductPurchaseSurface.InExperienceShopDetails
end