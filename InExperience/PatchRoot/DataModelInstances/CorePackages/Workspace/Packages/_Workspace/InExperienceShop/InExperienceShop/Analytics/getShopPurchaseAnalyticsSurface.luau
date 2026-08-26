local productPurchaseSurface = require(script:FindFirstAncestor("InExperienceShop").Parent.PurchasePromptLite).Enums.ProductPurchaseSurface
local constantsModule = require(script.Parent.Constants)

return function(p1)
	-- upvalues: constantsModule (ref), productPurchaseSurface (ref)
	return if p1 == constantsModule.ShopPageType.Home then productPurchaseSurface.InExperienceShopHome elseif p1 == constantsModule.ShopPageType.Search then productPurchaseSurface.InExperienceShopSearch else productPurchaseSurface.InExperienceShopDetails
end