local Parent = script:FindFirstAncestor("AvatarExperienceCatalog").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local FFlagAXShowMoreButtonOnOwnedItems = require(Parent.AvatarExperienceFlags).FFlagAXShowMoreButtonOnOwnedItems

return ReactModule.memo((ReactModule.forwardRef(function(p1, Ref)
	-- upvalues: FoundationModule (copy), UseLocalizationFunction (copy), ReactModule (copy), FFlagAXShowMoreButtonOnOwnedItems (copy)
	local UseTokensResult = FoundationModule.Hooks.useTokens()
	
	return ReactModule.createElement(FoundationModule.View, {
		ZIndex = 3,
		tag = {
			["row items-center gap-medium anchor-bottom-left size-full-0 auto-y padding-x-xlarge padding-y-large bg-surface-0"] = FFlagAXShowMoreButtonOnOwnedItems,
			["row items-center auto-y size-full-0 padding-y-large padding-x-xlarge bg-surface-0 anchor-bottom-left"] = not FFlagAXShowMoreButtonOnOwnedItems
		},
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
			fillBehavior = FoundationModule.Enums.FillBehavior.Fill,
			LayoutOrder = if FFlagAXShowMoreButtonOnOwnedItems then 1 else nil
		}),
		MoreButton = if FFlagAXShowMoreButtonOnOwnedItems and p1.onMoreButtonActivated then ReactModule.createElement(FoundationModule.Button, {
			icon = "circle-three-dots-horizontal",
			LayoutOrder = 2,
			onActivated = p1.onMoreButtonActivated,
			variant = FoundationModule.Enums.ButtonVariant.Standard,
			size = FoundationModule.Enums.ButtonSize.Medium
		}) else nil
	})
end)))