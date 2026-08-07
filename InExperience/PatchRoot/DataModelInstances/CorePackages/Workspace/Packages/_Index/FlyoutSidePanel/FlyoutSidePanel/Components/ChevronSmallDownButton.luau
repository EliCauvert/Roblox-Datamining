local parent = script:FindFirstAncestor("FlyoutSidePanel").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local iconSize = foundationModule.Enums.IconSize
local builderIconsModule = require(parent.BuilderIcons)
local fFlagEnableFlyoutUncheckedBadge = require(parent.SharedFlags).FFlagEnableFlyoutUncheckedBadge

return function(p0) --[[ line: 16 | named "ChevronSmallDownButton" ]]
	-- upvalues: reactModule (ref), foundationModule (ref), fFlagEnableFlyoutUncheckedBadge (ref), builderIconsModule (ref), iconSize (ref)
	return reactModule.createElement(foundationModule.View, {
		tag = "position-center-right anchor-center-right auto-xy radius-circle bg-action-standard padding-xsmall",
		onActivated = p0.onActivated,
		LayoutOrder = if fFlagEnableFlyoutUncheckedBadge then p0.layoutOrder else nil
	}, {
		Icon = reactModule.createElement(foundationModule.Icon, {
			tag = "position-center-center anchor-center-center auto-xy content-emphasis",
			name = builderIconsModule.Icon.ChevronSmallDown,
			size = iconSize.Medium
		})
	})
end