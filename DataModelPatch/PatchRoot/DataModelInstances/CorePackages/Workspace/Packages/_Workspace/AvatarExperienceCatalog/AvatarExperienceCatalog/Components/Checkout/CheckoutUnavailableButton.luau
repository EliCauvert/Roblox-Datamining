local Parent = script:FindFirstAncestor("AvatarExperienceCatalog").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)

return ReactModule.memo(function(Frame)
	-- upvalues: ReactModule (copy), FoundationModule (copy)
	return ReactModule.createElement(FoundationModule.View, {
		tag = "size-full-0 auto-y fill",
		LayoutOrder = Frame.LayoutOrder
	}, {
		UnavailableButton = ReactModule.createElement(FoundationModule.Button, {
			text = Frame.label,
			onActivated = Frame.onActivated,
			variant = FoundationModule.Enums.ButtonVariant.Standard,
			size = FoundationModule.Enums.ButtonSize.Medium,
			fillBehavior = FoundationModule.Enums.FillBehavior.Fill
		})
	})
end, require(Parent.tutils).deepEqual)