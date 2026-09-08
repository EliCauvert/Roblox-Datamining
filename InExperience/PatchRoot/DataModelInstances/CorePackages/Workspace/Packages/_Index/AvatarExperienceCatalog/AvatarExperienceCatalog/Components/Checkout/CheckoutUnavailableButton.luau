local parent = script:FindFirstAncestor("AvatarExperienceCatalog").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)

return reactModule.memo(function(p1)
	-- upvalues: reactModule (ref), foundationModule (ref)
	return reactModule.createElement(foundationModule.View, {
		tag = "size-full-0 auto-y fill",
		LayoutOrder = p1.LayoutOrder
	}, {
		UnavailableButton = reactModule.createElement(foundationModule.Button, {
			text = p1.label,
			onActivated = p1.onActivated,
			variant = foundationModule.Enums.ButtonVariant.Standard,
			size = foundationModule.Enums.ButtonSize.Medium,
			fillBehavior = foundationModule.Enums.FillBehavior.Fill
		})
	})
end, require(parent.tutils).deepEqual)