local parent = script:FindFirstAncestor("AvatarSwitcher").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local useTokens = foundationModule.Hooks.useTokens
local useLocalization = require(parent.Localization).Hooks.useLocalization
local fFlagAvatarSwitcherExpiredItemsWarning = require(parent.AvatarExperienceFlags).FFlagAvatarSwitcherExpiredItemsWarning

return function(p0)
	-- upvalues: useTokens (ref), useLocalization (ref), fFlagAvatarSwitcherExpiredItemsWarning (ref), reactModule (ref), foundationModule (ref)
	local var2 = useTokens()
	local var3 = useLocalization({
		partiallyUnsupported = if fFlagAvatarSwitcherExpiredItemsWarning then nil else "Feature.AvatarSwitcher.Message.PartiallyUnsupported",
		message = if fFlagAvatarSwitcherExpiredItemsWarning then p0.message else nil
	})
	
	return reactModule.createElement(foundationModule.View, { tag = "size-full-0 auto-y", LayoutOrder = p0.LayoutOrder }, {
		InfoIcon = reactModule.createElement(foundationModule.Image, {
			Image = "icons/actions/info",
			LayoutOrder = 1,
			Size = UDim2.fromOffset(var2.Size.Size_500, var2.Size.Size_500)
		}),
		CompatibilityWarning = reactModule.createElement(foundationModule.Text, {
			tag = "auto-y position-top-right anchor-top-right text-caption-small text-wrap text-align-x-left padding-top-xsmall",
			LayoutOrder = 2,
			Size = UDim2.new(1, (-var2.Size.Size_500) - var2.Gap.Small, 0, 0),
			Text = if fFlagAvatarSwitcherExpiredItemsWarning then var3.message else var3.partiallyUnsupported
		})
	})
end