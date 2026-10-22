local Parent = script:FindFirstAncestor("Impressions").Parent
local ReactModule = require(Parent.React)
local ImpressionsTrackerModule = require(script.Parent.ImpressionsTracker)
local ImpressionsTrackerWithoutNavigationModule = require(script.Parent.ImpressionsTrackerWithoutNavigation)
local UseNavigationFunction = require(Parent.Navigation).useNavigation
local UseViewportBoundsFunction = require(Parent.ViewportUtils).useViewportBounds
local SharedFlagsModule = require(Parent.SharedFlags)
local SignalsReactModule = require(Parent.SignalsReact)
local GetShortcutBarStatusStoreFunction = require(Parent.AppShortcutBarStore).GetShortcutBarStatusStore
local FFlagLuaAppUseScreenFillBoundsForFrameBoundsImpressions = SharedFlagsModule.FFlagLuaAppUseScreenFillBoundsForFrameBoundsImpressions
local FFlagLuaAppRespectClipAncestorImpressions = SharedFlagsModule.FFlagLuaAppRespectClipAncestorImpressions
local FFlagUnifyShortcutBarFixImpressions = SharedFlagsModule.FFlagUnifyShortcutBarFixImpressions
local FFlagOptionalNavigation = SharedFlagsModule.FFlagOptionalNavigation

return function(p1)
	-- upvalues: FFlagOptionalNavigation (copy), UseNavigationFunction (copy), FFlagUnifyShortcutBarFixImpressions (copy), SignalsReactModule (copy), GetShortcutBarStatusStoreFunction (copy), FFlagLuaAppUseScreenFillBoundsForFrameBoundsImpressions (copy), UseViewportBoundsFunction (copy), FFlagLuaAppRespectClipAncestorImpressions (copy), ReactModule (copy), ImpressionsTrackerWithoutNavigationModule (copy), ImpressionsTrackerModule (copy)
	local UseNavigationResult = if FFlagOptionalNavigation then UseNavigationFunction() else nil
	local UseSignalStateResult = if FFlagUnifyShortcutBarFixImpressions then SignalsReactModule.useSignalState(GetShortcutBarStatusStoreFunction(false).getShortcutBarReservedHeight) else nil
	local v1 = nil
	local UseViewportBoundsResult = nil
	
	if FFlagLuaAppUseScreenFillBoundsForFrameBoundsImpressions then
		UseViewportBoundsResult, v12 = UseViewportBoundsFunction(p1.parentRef, nil, if FFlagLuaAppRespectClipAncestorImpressions then p1.respectClipAncestors else nil, if FFlagUnifyShortcutBarFixImpressions then UseSignalStateResult else nil)
	else
		UseViewportBoundsResult = UseViewportBoundsFunction(p1.parentRef, nil, if FFlagLuaAppRespectClipAncestorImpressions then p1.respectClipAncestors else nil, if FFlagUnifyShortcutBarFixImpressions then UseSignalStateResult else nil)
	end
	local config = {
		pageContext = p1.pageContext,
		parentRef = p1.parentRef,
		impressionsTag = p1.impressionsTag,
		scrollViewPositionChangedSignal = p1.scrollViewPositionChangedSignal,
		sendImpressions = p1.sendImpressions,
		dataUpdatedTimestamp = p1.dataUpdatedTimestamp,
		viewPortBounds = UseViewportBoundsResult,
		viewPortFillBounds = if FFlagLuaAppUseScreenFillBoundsForFrameBoundsImpressions then v1 else nil
	}
	
	if FFlagOptionalNavigation and UseNavigationResult == nil then
		config.pageContext = nil
		
		return ReactModule.createElement(ImpressionsTrackerWithoutNavigationModule, config)
	else
		return ReactModule.createElement(ImpressionsTrackerModule, config)
	end
end