local Parent = script:FindFirstAncestor("Impressions").Parent
local RoactModule = require(Parent.Roact)
local RoactRoduxModule = require(Parent.RoactRodux)
local TModule = require(Parent.t)
local MemoizeFunction = require(Parent.AppCommonLib).memoize
local CryoModule = require(Parent.Cryo)
local SignalsReactModule = require(Parent.SignalsReact)
local GetShortcutBarStatusStoreFunction = require(Parent.AppShortcutBarStore).GetShortcutBarStatusStore
local FFlagUnifyShortcutBarFixImpressions = require(Parent.SharedFlags).FFlagUnifyShortcutBarFixImpressions
local ImpressionsDetectorModule = require(script.Parent.ImpressionsDetector)
local ScreenSizeImpressionsDetector = RoactModule.PureComponent:extend("ScreenSizeImpressionsDetector")
ScreenSizeImpressionsDetector.validateProps = TModule.strictInterface({
	impressionsTag = TModule.string,
	parentRef = TModule.optional(TModule.table),
	onRequestImpressionsSignal = TModule.table,
	filterImpressionFunc = TModule.optional(TModule.callback),
	onImpressionsDetected = TModule.callback,
	skipZeroSizes = TModule.optional(TModule.boolean),
	screenSize = TModule.Vector2,
	globalGuiInset = TModule.table,
	topBarHeight = TModule.number,
	shortcutBarHeight = if FFlagUnifyShortcutBarFixImpressions then TModule.optional(TModule.number) else nil
})
local MemoizeResult = MemoizeFunction(function(Y, Vector, p1, p2) --[[ Line: 34 ]]
	-- upvalues: FFlagUnifyShortcutBarFixImpressions (copy)
	return {
		min = Vector2.new(0, Y),
		max = Vector2.new(Vector.X, Vector.Y - p1.bottom - (FFlagUnifyShortcutBarFixImpressions and p2 or 0))
	}
end)

function ScreenSizeImpressionsDetector.render(p1) --[[ Line: 47 ]]
	-- upvalues: RoactModule (copy), ImpressionsDetectorModule (copy), MemoizeResult (copy), FFlagUnifyShortcutBarFixImpressions (copy)
	return RoactModule.createElement(ImpressionsDetectorModule, {
		parentRef = p1.props.parentRef,
		impressionsTag = p1.props.impressionsTag,
		onRequestImpressionsSignal = p1.props.onRequestImpressionsSignal,
		viewPortBounds = MemoizeResult(p1.props.topBarHeight, p1.props.screenSize, p1.props.globalGuiInset, if FFlagUnifyShortcutBarFixImpressions then p1.props.shortcutBarHeight else nil),
		filterImpressionFunc = p1.props.filterImpressionFunc,
		onImpressionsDetected = p1.props.onImpressionsDetected,
		skipZeroSizes = p1.props.skipZeroSizes
	})
end

local v1 = RoactRoduxModule.connect(function(p1, _) --[[ Line: 68 ]]
	return {
		topBarHeight = p1.TopBar.topBarHeight,
		globalGuiInset = p1.GlobalGuiInset,
		screenSize = p1.ScreenSize
	}
end)(ScreenSizeImpressionsDetector)

return if FFlagUnifyShortcutBarFixImpressions then function(p1) --[[ Line: 78 ]]
	-- upvalues: SignalsReactModule (copy), GetShortcutBarStatusStoreFunction (copy), RoactModule (copy), v1 (copy), CryoModule (copy)
	return RoactModule.createElement(v1, CryoModule.Dictionary.join(p1, {
		shortcutBarHeight = SignalsReactModule.useSignalState(GetShortcutBarStatusStoreFunction(false).getShortcutBarReservedHeight)
	}))
end else v1