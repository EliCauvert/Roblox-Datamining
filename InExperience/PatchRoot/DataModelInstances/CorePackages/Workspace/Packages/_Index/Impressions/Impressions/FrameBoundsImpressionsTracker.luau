local parent = script:FindFirstAncestor("Impressions").Parent
local reactModule = require(parent.React)
local impressionsTrackerModule = require(script.Parent.ImpressionsTracker)
local useViewportBounds = require(parent.ViewportUtils).useViewportBounds
local sharedFlagsModule = require(parent.SharedFlags)
local signalsReactModule = require(parent.SignalsReact)
local getShortcutBarStatusStore = require(parent.AppShortcutBarStore).GetShortcutBarStatusStore
local fFlagLuaAppUseScreenFillBoundsForFrameBoundsImpressions = sharedFlagsModule.FFlagLuaAppUseScreenFillBoundsForFrameBoundsImpressions
local fFlagLuaAppRespectClipAncestorImpressions = sharedFlagsModule.FFlagLuaAppRespectClipAncestorImpressions
local fFlagUnifyShortcutBarFixImpressions = sharedFlagsModule.FFlagUnifyShortcutBarFixImpressions

return function(p1)
	-- upvalues: fFlagUnifyShortcutBarFixImpressions (ref), signalsReactModule (ref), getShortcutBarStatusStore (ref), fFlagLuaAppUseScreenFillBoundsForFrameBoundsImpressions (ref), useViewportBounds (ref), fFlagLuaAppRespectClipAncestorImpressions (ref), reactModule (ref), impressionsTrackerModule (ref)
	local var1
	local var2 = if fFlagUnifyShortcutBarFixImpressions then signalsReactModule.useSignalState(getShortcutBarStatusStore(false).getShortcutBarReservedHeight) else nil
	local _ = nil
	local var3 = nil
	
	if fFlagLuaAppUseScreenFillBoundsForFrameBoundsImpressions then
		local var4, var5 = useViewportBounds(p1.parentRef, nil, if fFlagLuaAppRespectClipAncestorImpressions then p1.respectClipAncestors else nil, if fFlagUnifyShortcutBarFixImpressions then var2 else nil)
		var1 = var4
		var3 = var5
	else
		var1 = useViewportBounds(p1.parentRef, nil, if fFlagLuaAppRespectClipAncestorImpressions then p1.respectClipAncestors else nil, if fFlagUnifyShortcutBarFixImpressions then var2 else nil)
	end
	return reactModule.createElement(impressionsTrackerModule, {
		pageContext = p1.pageContext,
		parentRef = p1.parentRef,
		impressionsTag = p1.impressionsTag,
		scrollViewPositionChangedSignal = p1.scrollViewPositionChangedSignal,
		sendImpressions = p1.sendImpressions,
		dataUpdatedTimestamp = p1.dataUpdatedTimestamp,
		viewPortBounds = var1,
		viewPortFillBounds = if fFlagLuaAppUseScreenFillBoundsForFrameBoundsImpressions then var3 else nil
	})
end