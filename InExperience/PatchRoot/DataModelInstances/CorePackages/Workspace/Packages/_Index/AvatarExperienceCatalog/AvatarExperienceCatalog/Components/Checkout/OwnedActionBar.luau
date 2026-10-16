local Parent = script:FindFirstAncestor("AvatarExperienceCatalog").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization

return ReactModule.memo((ReactModule.forwardRef(function(p1, Ref) --[[ Line: 15 ]]
	-- upvalues: FoundationModule (copy), UseLocalizationFunction (copy), ReactModule (copy)
	local UseTokensResult = FoundationModule.Hooks.useTokens()
	
	return ReactModule.createElement(FoundationModule.View, {
		tag = "row items-center auto-y size-full-0 padding-y-large padding-x-xlarge bg-surface-0 anchor-bottom-left",
		ZIndex = 3,
		ref = Ref,
		backgroundStyle = {
			Color3 = UseTokensResult.Color.Surface.Surface_0.Color3,
			Transparency = UseTokensResult.Color.Surface.Surface_0.Transparency
		},
		Size = UDim2.fromScale(1, 0),
		Position = UDim2.fromScale(0, 1)
	}, {
		ActionButton = ReactModule.createElement(FoundationModule.Button, {
			text = UseLocalizationFunction({
				manageInCustomize = "Feature.Catalog.Action.Checkout.ManageInCustomize"
			}).manageInCustomize,
			onActivated = p1.onActivated,
			variant = FoundationModule.Enums.ButtonVariant.Standard,
			size = FoundationModule.Enums.ButtonSize.Medium,
			fillBehavior = FoundationModule.Enums.FillBehavior.Fill
		})
	})
end)))