local Parent = script:FindFirstAncestor("Impressions").Parent
local ReactModule = require(Parent.React)
local ImpressionsTrackerModule = require(script.Parent.ImpressionsTracker)
local UseViewportBoundsFunction = require(Parent.ViewportUtils).useViewportBounds

return function(p1)
	-- upvalues: UseViewportBoundsFunction (copy), ReactModule (copy), ImpressionsTrackerModule (copy)
	return ReactModule.createElement(ImpressionsTrackerModule, {
		pageContext = p1.pageContext,
		parentRef = p1.parentRef,
		impressionsTag = p1.impressionsTag,
		scrollViewPositionChangedSignal = p1.scrollViewPositionChangedSignal,
		sendImpressions = p1.sendImpressions,
		dataUpdatedTimestamp = p1.dataUpdatedTimestamp,
		viewPortBounds = UseViewportBoundsFunction(nil, p1.ignoreBottomInset)
	})
end