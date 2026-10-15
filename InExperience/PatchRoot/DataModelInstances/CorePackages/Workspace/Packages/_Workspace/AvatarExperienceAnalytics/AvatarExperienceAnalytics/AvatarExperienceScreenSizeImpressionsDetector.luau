local parent = script:FindFirstAncestor("AvatarExperienceAnalytics").Parent
local roactModule = require(parent.Roact)
local roactRoduxModule = require(parent.RoactRodux)
local tModule = require(parent.t)
local cryoModule = require(parent.Cryo)
local signalsReactModule = require(parent.SignalsReact)
local getShortcutBarStatusStore = require(parent.AppShortcutBarStore).GetShortcutBarStatusStore
local fFlagUnifyShortcutBarFixImpressions = require(parent.SharedFlags).FFlagUnifyShortcutBarFixImpressions
local avatarExperienceImpressionsDetectorModule = require(script.Parent.AvatarExperienceImpressionsDetector)
local avatarExperienceScreenSizeImpressionsDetector = roactModule.PureComponent:extend("AvatarExperienceScreenSizeImpressionsDetector")
avatarExperienceScreenSizeImpressionsDetector.validateProps = tModule.strictInterface({
	parentRef = tModule.table,
	onRequestImpressionsSignal = tModule.table,
	appPage = tModule.optional(tModule.string),
	pageFilter = tModule.optional(tModule.callback),
	collectObjectsFunc = tModule.optional(tModule.callback),
	filterImpressionFunc = tModule.optional(tModule.callback),
	onImpressionsDetected = tModule.callback,
	screenSize = tModule.Vector2,
	globalGuiInset = tModule.table,
	topBarHeight = tModule.number,
	shortcutBarHeight = if fFlagUnifyShortcutBarFixImpressions then tModule.optional(tModule.number) else nil
})

function avatarExperienceScreenSizeImpressionsDetector.render(p1)
	-- upvalues: fFlagUnifyShortcutBarFixImpressions (ref), roactModule (ref), avatarExperienceImpressionsDetectorModule (ref)
	local screenSize = p1.props.screenSize
	
	return roactModule.createElement(avatarExperienceImpressionsDetectorModule, {
		parentRef = p1.props.parentRef,
		onRequestImpressionsSignal = p1.props.onRequestImpressionsSignal,
		viewPortBounds = {
			min = Vector2.new(0, p1.props.topBarHeight),
			max = Vector2.new(screenSize.X, screenSize.Y - p1.props.globalGuiInset.bottom - (if fFlagUnifyShortcutBarFixImpressions then p1.props.shortcutBarHeight or 0 else 0))
		},
		appPage = p1.props.appPage,
		pageFilter = p1.props.pageFilter,
		collectObjectsFunc = p1.props.collectObjectsFunc,
		filterImpressionFunc = p1.props.filterImpressionFunc,
		onImpressionsDetected = p1.props.onImpressionsDetected
	})
end

local var1 = roactRoduxModule.connect(function(p1, _)
	return {
		topBarHeight = p1.TopBar.topBarHeight,
		globalGuiInset = p1.GlobalGuiInset,
		screenSize = p1.ScreenSize
	}
end)(avatarExperienceScreenSizeImpressionsDetector)

if fFlagUnifyShortcutBarFixImpressions then
	var1 = var1
	
	return function(p1)
		-- upvalues: signalsReactModule (ref), getShortcutBarStatusStore (ref), roactModule (ref), var1 (ref), cryoModule (ref)
		return roactModule.createElement(var1, cryoModule.Dictionary.join(p1, {
			shortcutBarHeight = signalsReactModule.useSignalState(getShortcutBarStatusStore(false).getShortcutBarReservedHeight)
		}))
	end
end
return var1