local parent = script:FindFirstAncestor("Impressions").Parent
local reactModule = require(parent.React)
local impressionsTrackerModule = require(script.Parent.ImpressionsTracker)
local useViewportBounds = require(parent.ViewportUtils).useViewportBounds
local signalsReactModule = require(parent.SignalsReact)
local getShortcutBarStatusStore = require(parent.AppShortcutBarStore).GetShortcutBarStatusStore
local fFlagUnifyShortcutBarFixImpressions = require(parent.SharedFlags).FFlagUnifyShortcutBarFixImpressions

return function(p1)
	-- upvalues: fFlagUnifyShortcutBarFixImpressions (ref), signalsReactModule (ref), getShortcutBarStatusStore (ref), useViewportBounds (ref), reactModule (ref), impressionsTrackerModule (ref)
	return reactModule.createElement(impressionsTrackerModule, {
		pageContext = p1.pageContext,
		parentRef = p1.parentRef,
		impressionsTag = p1.impressionsTag,
		scrollViewPositionChangedSignal = p1.scrollViewPositionChangedSignal,
		sendImpressions = p1.sendImpressions,
		dataUpdatedTimestamp = p1.dataUpdatedTimestamp,
		viewPortBounds = useViewportBounds(nil, p1.ignoreBottomInset, nil, if fFlagUnifyShortcutBarFixImpressions then if fFlagUnifyShortcutBarFixImpressions then signalsReactModule.useSignalState(getShortcutBarStatusStore(false).getShortcutBarReservedHeight) else nil else nil)
	})
end