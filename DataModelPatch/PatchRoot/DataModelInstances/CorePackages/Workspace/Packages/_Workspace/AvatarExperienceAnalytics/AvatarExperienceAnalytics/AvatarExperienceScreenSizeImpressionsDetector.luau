local Parent = script:FindFirstAncestor("AvatarExperienceAnalytics").Parent
local RoactModule = require(Parent.Roact)
local RoactRoduxModule = require(Parent.RoactRodux)
local TModule = require(Parent.t)
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
	topBarHeight = TModule.number
})

function AvatarExperienceScreenSizeImpressionsDetector.render(p1)
	-- upvalues: RoactModule (copy), AvatarExperienceImpressionsDetectorModule (copy)
	local ScreenSize = p1.props.screenSize
	
	return RoactModule.createElement(AvatarExperienceImpressionsDetectorModule, {
		parentRef = p1.props.parentRef,
		onRequestImpressionsSignal = p1.props.onRequestImpressionsSignal,
		viewPortBounds = {
			min = Vector2.new(0, p1.props.topBarHeight),
			max = Vector2.new(ScreenSize.X, ScreenSize.Y - p1.props.globalGuiInset.bottom)
		},
		appPage = p1.props.appPage,
		pageFilter = p1.props.pageFilter,
		collectObjectsFunc = p1.props.collectObjectsFunc,
		filterImpressionFunc = p1.props.filterImpressionFunc,
		onImpressionsDetected = p1.props.onImpressionsDetected
	})
end

return (RoactRoduxModule.connect(function(p1, _)
	return {
		topBarHeight = p1.TopBar.topBarHeight,
		globalGuiInset = p1.GlobalGuiInset,
		screenSize = p1.ScreenSize
	}
end)(AvatarExperienceScreenSizeImpressionsDetector))