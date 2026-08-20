local parent = script:FindFirstAncestor("AvatarExperienceCatalog").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)

return reactModule.memo(function(p0) --[[ line: 15 | named "CheckoutUnavailableButton" ]]
	-- upvalues: reactModule (ref), foundationModule (ref)
	return reactModule.createElement(foundationModule.View, {
		tag = "size-full-0 auto-y fill",
		LayoutOrder = p0.LayoutOrder
	}, {
		UnavailableButton = reactModule.createElement(foundationModule.Button, {
			text = p0.label,
			onActivated = p0.onActivated,
			variant = foundationModule.Enums.ButtonVariant.Standard,
			size = foundationModule.Enums.ButtonSize.Medium,
			fillBehavior = foundationModule.Enums.FillBehavior.Fill
		})
	})
end, require(parent.tutils).deepEqual)