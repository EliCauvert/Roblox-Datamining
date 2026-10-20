local Parent = script:FindFirstAncestor("AvatarSwitcher").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local UseTokensFunction = FoundationModule.Hooks.useTokens
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local FFlagAvatarSwitcherExpiredItemsWarning = require(Parent.AvatarExperienceFlags).FFlagAvatarSwitcherExpiredItemsWarning

return function(Frame)
	-- upvalues: UseTokensFunction (copy), UseLocalizationFunction (copy), FFlagAvatarSwitcherExpiredItemsWarning (copy), ReactModule (copy), FoundationModule (copy)
	local UseTokensResult = UseTokensFunction()
	local UseLocalizationResult = UseLocalizationFunction({
		partiallyUnsupported = if FFlagAvatarSwitcherExpiredItemsWarning then nil else "Feature.AvatarSwitcher.Message.PartiallyUnsupported",
		message = if FFlagAvatarSwitcherExpiredItemsWarning then Frame.message else nil
	})
	
	return ReactModule.createElement(FoundationModule.View, {
		tag = "size-full-0 auto-y",
		LayoutOrder = Frame.LayoutOrder
	}, {
		InfoIcon = ReactModule.createElement(FoundationModule.Image, {
			Image = "icons/actions/info",
			LayoutOrder = 1,
			Size = UDim2.fromOffset(UseTokensResult.Size.Size_500, UseTokensResult.Size.Size_500)
		}),
		CompatibilityWarning = ReactModule.createElement(FoundationModule.Text, {
			tag = "auto-y position-top-right anchor-top-right text-caption-small text-wrap text-align-x-left padding-top-xsmall",
			LayoutOrder = 2,
			Size = UDim2.new(1, -UseTokensResult.Size.Size_500 - UseTokensResult.Gap.Small, 0, 0),
			Text = if FFlagAvatarSwitcherExpiredItemsWarning then UseLocalizationResult.message else UseLocalizationResult.partiallyUnsupported
		})
	})
end