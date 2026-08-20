local avatarExperienceCatalog = script:FindFirstAncestor("AvatarExperienceCatalog")
local reactModule = require(avatarExperienceCatalog.Parent.React)
local useCheckoutActionBarPropsModule = require(avatarExperienceCatalog.Components.Checkout.useCheckoutActionBarProps)
local checkoutActionBarModule = require(avatarExperienceCatalog.Components.Checkout.CheckoutActionBar)

return reactModule.memo(reactModule.forwardRef(function(p0, p1) --[[ line: 10 ]]
	-- upvalues: useCheckoutActionBarPropsModule (ref), reactModule (ref), checkoutActionBarModule (ref)
	return reactModule.createElement(checkoutActionBarModule, useCheckoutActionBarPropsModule(p0, p1))
end))