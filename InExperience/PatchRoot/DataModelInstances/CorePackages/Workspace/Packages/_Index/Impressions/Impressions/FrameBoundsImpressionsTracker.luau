local parent = script:FindFirstAncestor("Impressions").Parent
local reactModule = require(parent.React)
local impressionsTrackerModule = require(script.Parent.ImpressionsTracker)
local useViewportBounds = require(parent.ViewportUtils).useViewportBounds
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagLuaAppUseScreenFillBoundsForFrameBoundsImpressions = sharedFlagsModule.FFlagLuaAppUseScreenFillBoundsForFrameBoundsImpressions
local fFlagLuaAppRespectClipAncestorImpressions = sharedFlagsModule.FFlagLuaAppRespectClipAncestorImpressions

return function(p1)
	-- upvalues: fFlagLuaAppUseScreenFillBoundsForFrameBoundsImpressions (ref), useViewportBounds (ref), fFlagLuaAppRespectClipAncestorImpressions (ref), reactModule (ref), impressionsTrackerModule (ref)
	local var1
	local _ = nil
	local var2 = nil
	
	if fFlagLuaAppUseScreenFillBoundsForFrameBoundsImpressions then
		local var3, var4 = useViewportBounds(p1.parentRef, nil, if fFlagLuaAppRespectClipAncestorImpressions then p1.respectClipAncestors else nil)
		var1 = var3
		var2 = var4
	else
		var1 = useViewportBounds(p1.parentRef, nil, if fFlagLuaAppRespectClipAncestorImpressions then p1.respectClipAncestors else nil)
	end
	return reactModule.createElement(impressionsTrackerModule, {
		pageContext = p1.pageContext,
		parentRef = p1.parentRef,
		impressionsTag = p1.impressionsTag,
		scrollViewPositionChangedSignal = p1.scrollViewPositionChangedSignal,
		sendImpressions = p1.sendImpressions,
		dataUpdatedTimestamp = p1.dataUpdatedTimestamp,
		viewPortBounds = var1,
		viewPortFillBounds = if fFlagLuaAppUseScreenFillBoundsForFrameBoundsImpressions then var2 else nil
	})
end