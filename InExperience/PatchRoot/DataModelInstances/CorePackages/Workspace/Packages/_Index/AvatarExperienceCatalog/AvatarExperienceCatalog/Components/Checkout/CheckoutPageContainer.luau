local AvatarExperienceCatalog = script:FindFirstAncestor("AvatarExperienceCatalog")
local ReactModule = require(AvatarExperienceCatalog.Parent.React)
local CheckoutPageModule = require(AvatarExperienceCatalog.Components.Checkout.CheckoutPage)
local UseCheckoutPageViewModelModule = require(AvatarExperienceCatalog.Components.Checkout.useCheckoutPageViewModel)

return function(p1) --[[ Line: 10 | Named "CheckoutPageContainer" ]]
	-- upvalues: UseCheckoutPageViewModelModule (copy), ReactModule (copy), CheckoutPageModule (copy)
	return ReactModule.createElement(CheckoutPageModule, (UseCheckoutPageViewModelModule(p1)))
end