local Parent = script:FindFirstAncestor("Impressions").Parent
local RoactModule = require(Parent.Roact)
local RoactRoduxModule = require(Parent.RoactRodux)
local TModule = require(Parent.t)
local MemoizeFunction = require(Parent.AppCommonLib).memoize
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
	topBarHeight = TModule.number
})
local MemoizeResult = MemoizeFunction(function(Y, Vector, p1)
	return {
		min = Vector2.new(0, Y),
		max = Vector2.new(Vector.X, Vector.Y - p1.bottom)
	}
end)

function ScreenSizeImpressionsDetector.render(p1)
	-- upvalues: RoactModule (copy), ImpressionsDetectorModule (copy), MemoizeResult (copy)
	return RoactModule.createElement(ImpressionsDetectorModule, {
		parentRef = p1.props.parentRef,
		impressionsTag = p1.props.impressionsTag,
		onRequestImpressionsSignal = p1.props.onRequestImpressionsSignal,
		viewPortBounds = MemoizeResult(p1.props.topBarHeight, p1.props.screenSize, p1.props.globalGuiInset),
		filterImpressionFunc = p1.props.filterImpressionFunc,
		onImpressionsDetected = p1.props.onImpressionsDetected,
		skipZeroSizes = p1.props.skipZeroSizes
	})
end

return (RoactRoduxModule.connect(function(p1, _)
	return {
		topBarHeight = p1.TopBar.topBarHeight,
		globalGuiInset = p1.GlobalGuiInset,
		screenSize = p1.ScreenSize
	}
end)(ScreenSizeImpressionsDetector))