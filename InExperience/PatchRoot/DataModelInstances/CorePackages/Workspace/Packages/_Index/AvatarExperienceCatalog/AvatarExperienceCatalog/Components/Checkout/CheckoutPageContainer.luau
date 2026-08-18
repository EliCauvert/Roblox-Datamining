local avatarExperienceCatalog = script:FindFirstAncestor("AvatarExperienceCatalog")
local reactModule = require(avatarExperienceCatalog.Parent.React)
local checkoutPageModule = require(avatarExperienceCatalog.Components.Checkout.CheckoutPage)
local useCheckoutPageViewModelModule = require(avatarExperienceCatalog.Components.Checkout.useCheckoutPageViewModel)

return function(p0) --[[ line: 10 | named "CheckoutPageContainer" ]]
	-- upvalues: useCheckoutPageViewModelModule (ref), reactModule (ref), checkoutPageModule (ref)
	return reactModule.createElement(checkoutPageModule, useCheckoutPageViewModelModule(p0))
end