local Parent = script:FindFirstAncestor("AvatarExperienceAnalytics").Parent
local RoactModule = require(Parent.Roact)
local RoactRoduxModule = require(Parent.RoactRodux)
local TModule = require(Parent.t)
local CryoModule = require(Parent.Cryo)
local SignalsReactModule = require(Parent.SignalsReact)
local GetShortcutBarStatusStoreFunction = require(Parent.AppShortcutBarStore).GetShortcutBarStatusStore
local FFlagUnifyShortcutBarFixImpressions = require(Parent.SharedFlags).FFlagUnifyShortcutBarFixImpressions
local AvatarExperienceImpressionsDetectorModule = require(script.Parent.AvatarExperienceImpressionsDetector)
local AvatarExperienceScreenSizeImpressionsDetector = RoactModule.PureComponent:extend("AvatarExperienceScreenSizeImpressionsDetector")
AvatarExperienceScreenSizeImpressionsDetector.validateProps = TModule.strictInterface({
	parentRef = TModule.table,
	onRequestImpressionsSignal = TModule.table,
	appPage = TModule.optional(TModule.string),
	pageFilter = TModule.optional(TModule.callback),
	collectObjectsFunc = TModule.optional(TModule.callback),
	filterImpressionFunc = TModule.optional(TModule.callback),
	onImpressionsDetected = TModule.callback,
	screenSize = TModule.Vector2,
	globalGuiInset = TModule.table,
	topBarHeight = TModule.number,
	shortcutBarHeight = if FFlagUnifyShortcutBarFixImpressions then TModule.optional(TModule.number) else nil
})

function AvatarExperienceScreenSizeImpressionsDetector.render(p1) --[[ Line: 35 ]]
	-- upvalues: FFlagUnifyShortcutBarFixImpressions (copy), RoactModule (copy), AvatarExperienceImpressionsDetectorModule (copy)
	local ScreenSize = p1.props.screenSize
	
	return RoactModule.createElement(AvatarExperienceImpressionsDetectorModule, {
		parentRef = p1.props.parentRef,
		onRequestImpressionsSignal = p1.props.onRequestImpressionsSignal,
		viewPortBounds = {
			min = Vector2.new(0, p1.props.topBarHeight),
			max = Vector2.new(ScreenSize.X, ScreenSize.Y - p1.props.globalGuiInset.bottom - (FFlagUnifyShortcutBarFixImpressions and p1.props.shortcutBarHeight or 0))
		},
		appPage = p1.props.appPage,
		pageFilter = p1.props.pageFilter,
		collectObjectsFunc = p1.props.collectObjectsFunc,
		filterImpressionFunc = p1.props.filterImpressionFunc,
		onImpressionsDetected = p1.props.onImpressionsDetected
	})
end

local v1 = RoactRoduxModule.connect(function(p1, _) --[[ Line: 56 ]]
	return {
		topBarHeight = p1.TopBar.topBarHeight,
		globalGuiInset = p1.GlobalGuiInset,
		screenSize = p1.ScreenSize
	}
end)(AvatarExperienceScreenSizeImpressionsDetector)

return if FFlagUnifyShortcutBarFixImpressions then function(p1) --[[ Line: 66 ]]
	-- upvalues: SignalsReactModule (copy), GetShortcutBarStatusStoreFunction (copy), RoactModule (copy), v1 (copy), CryoModule (copy)
	return RoactModule.createElement(v1, CryoModule.Dictionary.join(p1, {
		shortcutBarHeight = SignalsReactModule.useSignalState(GetShortcutBarStatusStoreFunction(false).getShortcutBarReservedHeight)
	}))
end else v1