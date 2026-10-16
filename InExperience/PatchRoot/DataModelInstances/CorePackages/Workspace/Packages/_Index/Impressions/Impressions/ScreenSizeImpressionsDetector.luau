local parent = script:FindFirstAncestor("Impressions").Parent
local roactModule = require(parent.Roact)
local roactRoduxModule = require(parent.RoactRodux)
local tModule = require(parent.t)
local memoize = require(parent.AppCommonLib).memoize
local impressionsDetectorModule = require(script.Parent.ImpressionsDetector)
local screenSizeImpressionsDetector = roactModule.PureComponent:extend("ScreenSizeImpressionsDetector")
screenSizeImpressionsDetector.validateProps = tModule.strictInterface({
	impressionsTag = tModule.string,
	parentRef = tModule.optional(tModule.table),
	onRequestImpressionsSignal = tModule.table,
	filterImpressionFunc = tModule.optional(tModule.callback),
	onImpressionsDetected = tModule.callback,
	skipZeroSizes = tModule.optional(tModule.boolean),
	screenSize = tModule.Vector2,
	globalGuiInset = tModule.table,
	topBarHeight = tModule.number
})
local var1 = memoize(function(p1, p2, p3)
	return {
		min = Vector2.new(0, p1),
		max = Vector2.new(p2.X, p2.Y - p3.bottom)
	}
end)

function screenSizeImpressionsDetector.render(p1)
	-- upvalues: roactModule (ref), impressionsDetectorModule (ref), var1 (ref)
	return roactModule.createElement(impressionsDetectorModule, {
		parentRef = p1.props.parentRef,
		impressionsTag = p1.props.impressionsTag,
		onRequestImpressionsSignal = p1.props.onRequestImpressionsSignal,
		viewPortBounds = var1(p1.props.topBarHeight, p1.props.screenSize, p1.props.globalGuiInset),
		filterImpressionFunc = p1.props.filterImpressionFunc,
		onImpressionsDetected = p1.props.onImpressionsDetected,
		skipZeroSizes = p1.props.skipZeroSizes
	})
end

return roactRoduxModule.connect(function(p1, _)
	return {
		topBarHeight = p1.TopBar.topBarHeight,
		globalGuiInset = p1.GlobalGuiInset,
		screenSize = p1.ScreenSize
	}
end)(screenSizeImpressionsDetector)