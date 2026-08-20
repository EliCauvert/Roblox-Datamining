local parent = script:FindFirstAncestor("AvatarExperienceCatalog").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local useLocalization = require(parent.Localization).Hooks.useLocalization

return reactModule.memo(reactModule.forwardRef(function(p0, p1) --[[ line: 15 ]]
	-- upvalues: foundationModule (ref), useLocalization (ref), reactModule (ref)
	local var2 = foundationModule.Hooks.useTokens()
	
	return reactModule.createElement(foundationModule.View, {
		tag = "row items-center auto-y size-full-0 padding-y-large padding-x-xlarge bg-surface-0 anchor-bottom-left",
		ZIndex = 3,
		ref = p1,
		backgroundStyle = {
			Color3 = var2.Color.Surface.Surface_0.Color3,
			Transparency = var2.Color.Surface.Surface_0.Transparency
		},
		Size = UDim2.fromScale(1, 0),
		Position = UDim2.fromScale(0, 1)
	}, {
		ActionButton = reactModule.createElement(foundationModule.Button, {
			text = useLocalization({
				manageInCustomize = "Feature.Catalog.Action.Checkout.ManageInCustomize"
			}).manageInCustomize,
			onActivated = p0.onActivated,
			variant = foundationModule.Enums.ButtonVariant.Standard,
			size = foundationModule.Enums.ButtonSize.Medium,
			fillBehavior = foundationModule.Enums.FillBehavior.Fill
		})
	})
end))