local Parent = script:FindFirstAncestor("Impressions").Parent
local ReactModule = require(Parent.React)
local ImpressionsTrackerModule = require(script.Parent.ImpressionsTracker)
local UseViewportBoundsFunction = require(Parent.ViewportUtils).useViewportBounds
local FFlagLuaAppUseScreenFillBoundsForFrameBoundsImpressions = require(Parent.SharedFlags).FFlagLuaAppUseScreenFillBoundsForFrameBoundsImpressions

return function(p1)
	-- upvalues: FFlagLuaAppUseScreenFillBoundsForFrameBoundsImpressions (copy), UseViewportBoundsFunction (copy), ReactModule (copy), ImpressionsTrackerModule (copy)
	local v1 = nil
	local UseViewportBoundsResult = nil
	
	if FFlagLuaAppUseScreenFillBoundsForFrameBoundsImpressions then
		UseViewportBoundsResult, v4 = UseViewportBoundsFunction(p1.parentRef)
	else
		UseViewportBoundsResult = UseViewportBoundsFunction(p1.parentRef)
	end
	return ReactModule.createElement(ImpressionsTrackerModule, {
		pageContext = p1.pageContext,
		parentRef = p1.parentRef,
		impressionsTag = p1.impressionsTag,
		scrollViewPositionChangedSignal = p1.scrollViewPositionChangedSignal,
		sendImpressions = p1.sendImpressions,
		dataUpdatedTimestamp = p1.dataUpdatedTimestamp,
		viewPortBounds = UseViewportBoundsResult,
		viewPortFillBounds = if FFlagLuaAppUseScreenFillBoundsForFrameBoundsImpressions then v1 else nil
	})
end