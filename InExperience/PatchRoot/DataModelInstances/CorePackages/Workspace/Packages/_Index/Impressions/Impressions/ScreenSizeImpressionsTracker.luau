local parent = script:FindFirstAncestor("Impressions").Parent
local reactModule = require(parent.React)
local impressionsTrackerModule = require(script.Parent.ImpressionsTracker)
local useViewportBounds = require(parent.ViewportUtils).useViewportBounds
local fFlagLuaAppPlayButtonContextualMessageImpression = require(parent.SharedFlags).FFlagLuaAppPlayButtonContextualMessageImpression

return function(p0) --[[ line: 33 ]]
	-- upvalues: useViewportBounds (ref), fFlagLuaAppPlayButtonContextualMessageImpression (ref), reactModule (ref), impressionsTrackerModule (ref)
	return reactModule.createElement(impressionsTrackerModule, {
		pageContext = p0.pageContext,
		parentRef = p0.parentRef,
		impressionsTag = p0.impressionsTag,
		scrollViewPositionChangedSignal = p0.scrollViewPositionChangedSignal,
		sendImpressions = p0.sendImpressions,
		dataUpdatedTimestamp = p0.dataUpdatedTimestamp,
		viewPortBounds = useViewportBounds(nil, if fFlagLuaAppPlayButtonContextualMessageImpression then p0.ignoreBottomInset else nil)
	})
end