local corePackagesService = game:GetService("CorePackages")
local reactModule = require(corePackagesService.Packages.React)
local foundationModule = require(corePackagesService.Packages.Foundation)
local statusIndicator = foundationModule.StatusIndicator
local statusIndicatorVariant = foundationModule.Enums.StatusIndicatorVariant
local view = foundationModule.View

return function(vectorA)
	-- upvalues: reactModule (ref), view (ref), statusIndicator (ref), statusIndicatorVariant (ref)
	return if vectorA.visible and not vectorA.hasNotificationBadge then reactModule.createElement(view, {
		tag = "anchor-top-left auto-xy padding-xxsmall radius-circle bg-surface-0",
		testId = "nine-dot-activity-indicator",
		Position = vectorA.position
	}, {
		Indicator = reactModule.createElement(statusIndicator, { variant = statusIndicatorVariant.Emphasis })
	}) else nil
end