local productPurchaseSurface = require(script:FindFirstAncestor("InExperienceShop").Parent.PurchasePromptLite).Enums.ProductPurchaseSurface
local constantsModule = require(script.Parent.Constants)

return function(p0) --[[ line: 16 | named "getShopPurchaseAnalyticsSurface" ]]
	-- upvalues: constantsModule (ref), productPurchaseSurface (ref)
	return if p0 == constantsModule.ShopPageType.Home then productPurchaseSurface.InExperienceShopHome elseif p0 == constantsModule.ShopPageType.Search then productPurchaseSurface.InExperienceShopSearch else productPurchaseSurface.InExperienceShopDetails
end