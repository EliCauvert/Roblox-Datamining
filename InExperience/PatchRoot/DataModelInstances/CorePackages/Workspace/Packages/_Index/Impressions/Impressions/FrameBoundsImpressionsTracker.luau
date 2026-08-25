local parent = script:FindFirstAncestor("Impressions").Parent
local reactModule = require(parent.React)
local impressionsTrackerModule = require(script.Parent.ImpressionsTracker)
local useViewportBounds = require(parent.ViewportUtils).useViewportBounds
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagLuaAppUseScreenFillBoundsForFrameBoundsImpressions = sharedFlagsModule.FFlagLuaAppUseScreenFillBoundsForFrameBoundsImpressions
local fFlagLuaAppRespectClipAncestorImpressions = sharedFlagsModule.FFlagLuaAppRespectClipAncestorImpressions

return function(p0)
	-- upvalues: fFlagLuaAppUseScreenFillBoundsForFrameBoundsImpressions (ref), useViewportBounds (ref), fFlagLuaAppRespectClipAncestorImpressions (ref), reactModule (ref), impressionsTrackerModule (ref)
	local var6
	local _ = nil
	local var3 = nil
	
	if fFlagLuaAppUseScreenFillBoundsForFrameBoundsImpressions then
		local var4, var5 = useViewportBounds(p0.parentRef, nil, if fFlagLuaAppRespectClipAncestorImpressions then p0.respectClipAncestors else nil)
		var6 = var4
		var3 = var5
	else
		var6 = useViewportBounds(p0.parentRef, nil, if fFlagLuaAppRespectClipAncestorImpressions then p0.respectClipAncestors else nil)
	end
	return reactModule.createElement(impressionsTrackerModule, {
		pageContext = p0.pageContext,
		parentRef = p0.parentRef,
		impressionsTag = p0.impressionsTag,
		scrollViewPositionChangedSignal = p0.scrollViewPositionChangedSignal,
		sendImpressions = p0.sendImpressions,
		dataUpdatedTimestamp = p0.dataUpdatedTimestamp,
		viewPortBounds = var6,
		viewPortFillBounds = if fFlagLuaAppUseScreenFillBoundsForFrameBoundsImpressions then var3 else nil
	})
end