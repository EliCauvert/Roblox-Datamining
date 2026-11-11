local Parent = script:FindFirstAncestor("FlyoutSidePanel").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local IconSize = FoundationModule.Enums.IconSize
local BuilderIconsModule = require(Parent.BuilderIcons)
local FFlagEnableFlyoutUncheckedBadge = require(Parent.SharedFlags).FFlagEnableFlyoutUncheckedBadge

return function(p1)
	-- upvalues: ReactModule (copy), FoundationModule (copy), FFlagEnableFlyoutUncheckedBadge (copy), BuilderIconsModule (copy), IconSize (copy)
	return ReactModule.createElement(FoundationModule.View, {
		tag = "position-center-right anchor-center-right auto-xy radius-circle bg-action-standard padding-xsmall",
		onActivated = p1.onActivated,
		LayoutOrder = if FFlagEnableFlyoutUncheckedBadge then p1.layoutOrder else nil
	}, {
		Icon = ReactModule.createElement(FoundationModule.Icon, {
			tag = "position-center-center anchor-center-center auto-xy content-emphasis",
			name = BuilderIconsModule.Icon.ChevronSmallDown,
			size = IconSize.Medium
		})
	})
end