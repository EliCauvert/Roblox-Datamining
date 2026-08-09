local parent = script:FindFirstAncestor("Impressions").Parent
local reactModule = require(parent.React)
local impressionsTrackerModule = require(script.Parent.ImpressionsTracker)
local useViewportBounds = require(parent.ViewportUtils).useViewportBounds
local fFlagLuaAppUseScreenFillBoundsForFrameBoundsImpressions = require(parent.SharedFlags).FFlagLuaAppUseScreenFillBoundsForFrameBoundsImpressions

return function(p0) --[[ line: 25 ]]
	-- upvalues: fFlagLuaAppUseScreenFillBoundsForFrameBoundsImpressions (ref), useViewportBounds (ref), reactModule (ref), impressionsTrackerModule (ref)
	local var5
	local _ = nil
	local var2 = nil
	
	if fFlagLuaAppUseScreenFillBoundsForFrameBoundsImpressions then
		local var3, var4 = useViewportBounds(p0.parentRef)
		var5 = var3
		var2 = var4
	else
		var5 = useViewportBounds(p0.parentRef)
	end
	return reactModule.createElement(impressionsTrackerModule, {
		pageContext = p0.pageContext,
		parentRef = p0.parentRef,
		impressionsTag = p0.impressionsTag,
		scrollViewPositionChangedSignal = p0.scrollViewPositionChangedSignal,
		sendImpressions = p0.sendImpressions,
		dataUpdatedTimestamp = p0.dataUpdatedTimestamp,
		viewPortBounds = var5,
		viewPortFillBounds = if fFlagLuaAppUseScreenFillBoundsForFrameBoundsImpressions then var2 else nil
	})
end