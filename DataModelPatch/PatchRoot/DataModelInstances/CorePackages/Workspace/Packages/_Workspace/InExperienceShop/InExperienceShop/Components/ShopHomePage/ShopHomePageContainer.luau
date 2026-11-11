local ReactModule = require(script:FindFirstAncestor("InExperienceShop").Parent.React)
local ShopHomePageViewModule = require(script.Parent.ShopHomePageView)
local UseShopHomePageViewModelModule = require(script.Parent.useShopHomePageViewModel)

return ReactModule.memo(function(p1)
	-- upvalues: UseShopHomePageViewModelModule (copy), ReactModule (copy), ShopHomePageViewModule (copy)
	return ReactModule.createElement(ShopHomePageViewModule, (UseShopHomePageViewModelModule(p1)))
end)