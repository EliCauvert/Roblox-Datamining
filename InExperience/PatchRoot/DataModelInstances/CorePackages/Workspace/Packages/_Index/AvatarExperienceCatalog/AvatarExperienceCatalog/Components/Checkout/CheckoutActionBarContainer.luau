local AvatarExperienceCatalog = script:FindFirstAncestor("AvatarExperienceCatalog")
local ReactModule = require(AvatarExperienceCatalog.Parent.React)
local UseCheckoutActionBarPropsModule = require(AvatarExperienceCatalog.Components.Checkout.useCheckoutActionBarProps)
local CheckoutActionBarModule = require(AvatarExperienceCatalog.Components.Checkout.CheckoutActionBar)

return ReactModule.memo((ReactModule.forwardRef(function(p1, p2) --[[ Line: 10 ]]
	-- upvalues: UseCheckoutActionBarPropsModule (copy), ReactModule (copy), CheckoutActionBarModule (copy)
	return ReactModule.createElement(CheckoutActionBarModule, (UseCheckoutActionBarPropsModule(p1, p2)))
end)))