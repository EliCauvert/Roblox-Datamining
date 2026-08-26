local avatarExperienceCatalog = script:FindFirstAncestor("AvatarExperienceCatalog")
local reactModule = require(avatarExperienceCatalog.Parent.React)
local useCheckoutActionBarPropsModule = require(avatarExperienceCatalog.Components.Checkout.useCheckoutActionBarProps)
local checkoutActionBarModule = require(avatarExperienceCatalog.Components.Checkout.CheckoutActionBar)

return reactModule.memo(reactModule.forwardRef(function(p1, p2)
	-- upvalues: useCheckoutActionBarPropsModule (ref), reactModule (ref), checkoutActionBarModule (ref)
	return reactModule.createElement(checkoutActionBarModule, useCheckoutActionBarPropsModule(p1, p2))
end))