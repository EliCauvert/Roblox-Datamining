local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local FoundationModule = require(CorePackages.Packages.Foundation)
local StatusIndicator = FoundationModule.StatusIndicator
local StatusIndicatorVariant = FoundationModule.Enums.StatusIndicatorVariant
local View = FoundationModule.View

return function(p1) --[[ Line: 16 | Named "NineDotActivityIndicator" ]]
	-- upvalues: ReactModule (copy), View (copy), StatusIndicator (copy), StatusIndicatorVariant (copy)
	return if p1.visible and not p1.hasNotificationBadge then ReactModule.createElement(View, {
		tag = "anchor-top-left auto-xy padding-xxsmall radius-circle bg-surface-0",
		testId = "nine-dot-activity-indicator",
		Position = p1.position
	}, {
		Indicator = ReactModule.createElement(StatusIndicator, { variant = StatusIndicatorVariant.Emphasis })
	}) else nil
end