local reactModule = require(script:FindFirstAncestor("InExperienceShop").Parent.React)
local shopHomePageViewModule = require(script.Parent.ShopHomePageView)
local useShopHomePageViewModelModule = require(script.Parent.useShopHomePageViewModel)

return reactModule.memo(function(p1)
	-- upvalues: useShopHomePageViewModelModule (ref), reactModule (ref), shopHomePageViewModule (ref)
	return reactModule.createElement(shopHomePageViewModule, useShopHomePageViewModelModule(p1))
end)