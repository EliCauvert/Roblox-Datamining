local Parent = script:FindFirstAncestor("Impressions").Parent
local ReactModule = require(Parent.React)
local ImpressionsTrackerModule = require(script.Parent.ImpressionsTracker)
local UseViewportBoundsFunction = require(Parent.ViewportUtils).useViewportBounds
local SharedFlagsModule = require(Parent.SharedFlags)
local SignalsReactModule = require(Parent.SignalsReact)
local GetShortcutBarStatusStoreFunction = require(Parent.AppShortcutBarStore).GetShortcutBarStatusStore
local FFlagLuaAppUseScreenFillBoundsForFrameBoundsImpressions = SharedFlagsModule.FFlagLuaAppUseScreenFillBoundsForFrameBoundsImpressions
local FFlagLuaAppRespectClipAncestorImpressions = SharedFlagsModule.FFlagLuaAppRespectClipAncestorImpressions
local FFlagUnifyShortcutBarFixImpressions = SharedFlagsModule.FFlagUnifyShortcutBarFixImpressions

return function(p1)
	-- upvalues: FFlagUnifyShortcutBarFixImpressions (copy), SignalsReactModule (copy), GetShortcutBarStatusStoreFunction (copy), FFlagLuaAppUseScreenFillBoundsForFrameBoundsImpressions (copy), UseViewportBoundsFunction (copy), FFlagLuaAppRespectClipAncestorImpressions (copy), ReactModule (copy), ImpressionsTrackerModule (copy)
	local UseSignalStateResult = if FFlagUnifyShortcutBarFixImpressions then SignalsReactModule.useSignalState(GetShortcutBarStatusStoreFunction(false).getShortcutBarReservedHeight) else nil
	local v1 = nil
	local UseViewportBoundsResult = nil
	
	if FFlagLuaAppUseScreenFillBoundsForFrameBoundsImpressions then
		UseViewportBoundsResult, v9 = UseViewportBoundsFunction(p1.parentRef, nil, if FFlagLuaAppRespectClipAncestorImpressions then p1.respectClipAncestors else nil, if FFlagUnifyShortcutBarFixImpressions then UseSignalStateResult else nil)
	else
		UseViewportBoundsResult = UseViewportBoundsFunction(p1.parentRef, nil, if FFlagLuaAppRespectClipAncestorImpressions then p1.respectClipAncestors else nil, if FFlagUnifyShortcutBarFixImpressions then UseSignalStateResult else nil)
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