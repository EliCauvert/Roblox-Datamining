local parent = script:FindFirstAncestor("Impressions").Parent
local reactModule = require(parent.React)
local impressionsTrackerModule = require(script.Parent.ImpressionsTracker)
local useViewportBounds = require(parent.ViewportUtils).useViewportBounds

return function(p0)
	-- upvalues: useViewportBounds (ref), reactModule (ref), impressionsTrackerModule (ref)
	return reactModule.createElement(impressionsTrackerModule, {
		pageContext = p0.pageContext,
		parentRef = p0.parentRef,
		impressionsTag = p0.impressionsTag,
		scrollViewPositionChangedSignal = p0.scrollViewPositionChangedSignal,
		sendImpressions = p0.sendImpressions,
		dataUpdatedTimestamp = p0.dataUpdatedTimestamp,
		viewPortBounds = useViewportBounds(nil, p0.ignoreBottomInset)
	})
end