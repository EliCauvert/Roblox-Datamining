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
local var5 = memoize(function(p0, p1, p2)
	return {
		min = Vector2.new(0, p0),
		max = Vector2.new(p1.X, p1.Y - p2.bottom)
	}
end)

function screenSizeImpressionsDetector.render(p3)
	-- upvalues: roactModule (ref), impressionsDetectorModule (ref), var5 (ref)
	return roactModule.createElement(impressionsDetectorModule, {
		parentRef = p3.props.parentRef,
		impressionsTag = p3.props.impressionsTag,
		onRequestImpressionsSignal = p3.props.onRequestImpressionsSignal,
		viewPortBounds = var5(p3.props.topBarHeight, p3.props.screenSize, p3.props.globalGuiInset),
		filterImpressionFunc = p3.props.filterImpressionFunc,
		onImpressionsDetected = p3.props.onImpressionsDetected,
		skipZeroSizes = p3.props.skipZeroSizes
	})
end

return roactRoduxModule.connect(function(p4, _)
	return {
		topBarHeight = p4.TopBar.topBarHeight,
		globalGuiInset = p4.GlobalGuiInset,
		screenSize = p4.ScreenSize
	}
end)(screenSizeImpressionsDetector)