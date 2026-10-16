local Parent = script:FindFirstAncestor("Impressions").Parent
local ReactModule = require(Parent.React)
local ImpressionsTrackerModule = require(script.Parent.ImpressionsTracker)
local UseViewportBoundsFunction = require(Parent.ViewportUtils).useViewportBounds
local SignalsReactModule = require(Parent.SignalsReact)
local GetShortcutBarStatusStoreFunction = require(Parent.AppShortcutBarStore).GetShortcutBarStatusStore
local FFlagUnifyShortcutBarFixImpressions = require(Parent.SharedFlags).FFlagUnifyShortcutBarFixImpressions

return function(p1) --[[ Line: 35 ]]
	-- upvalues: FFlagUnifyShortcutBarFixImpressions (copy), SignalsReactModule (copy), GetShortcutBarStatusStoreFunction (copy), UseViewportBoundsFunction (copy), ReactModule (copy), ImpressionsTrackerModule (copy)
	local UseSignalStateResult = if FFlagUnifyShortcutBarFixImpressions then SignalsReactModule.useSignalState(GetShortcutBarStatusStoreFunction(false).getShortcutBarReservedHeight) else nil
	
	return ReactModule.createElement(ImpressionsTrackerModule, {
		pageContext = p1.pageContext,
		parentRef = p1.parentRef,
		impressionsTag = p1.impressionsTag,
		scrollViewPositionChangedSignal = p1.scrollViewPositionChangedSignal,
		sendImpressions = p1.sendImpressions,
		dataUpdatedTimestamp = p1.dataUpdatedTimestamp,
		viewPortBounds = UseViewportBoundsFunction(nil, p1.ignoreBottomInset, nil, if FFlagUnifyShortcutBarFixImpressions then UseSignalStateResult else nil)
	})
end