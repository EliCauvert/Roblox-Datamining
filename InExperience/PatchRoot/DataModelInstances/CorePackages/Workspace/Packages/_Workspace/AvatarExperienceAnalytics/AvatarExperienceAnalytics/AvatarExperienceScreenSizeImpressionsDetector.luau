local parent = script:FindFirstAncestor("AvatarExperienceAnalytics").Parent
local roactModule = require(parent.Roact)
local roactRoduxModule = require(parent.RoactRodux)
local tModule = require(parent.t)
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
	topBarHeight = tModule.number
})

function avatarExperienceScreenSizeImpressionsDetector.render(p0) --[[ line: 28 ]]
	-- upvalues: roactModule (ref), avatarExperienceImpressionsDetectorModule (ref)
	local screenSize = p0.props.screenSize
	
	return roactModule.createElement(avatarExperienceImpressionsDetectorModule, {
		parentRef = p0.props.parentRef,
		onRequestImpressionsSignal = p0.props.onRequestImpressionsSignal,
		viewPortBounds = {
			min = Vector2.new(0, p0.props.topBarHeight),
			max = Vector2.new(screenSize.X, screenSize.Y - p0.props.globalGuiInset.bottom)
		},
		appPage = p0.props.appPage,
		pageFilter = p0.props.pageFilter,
		collectObjectsFunc = p0.props.collectObjectsFunc,
		filterImpressionFunc = p0.props.filterImpressionFunc,
		onImpressionsDetected = p0.props.onImpressionsDetected
	})
end

return roactRoduxModule.connect(function(p1, _) --[[ line: 48 ]]
	return {
		topBarHeight = p1.TopBar.topBarHeight,
		globalGuiInset = p1.GlobalGuiInset,
		screenSize = p1.ScreenSize
	}
end)(avatarExperienceScreenSizeImpressionsDetector)