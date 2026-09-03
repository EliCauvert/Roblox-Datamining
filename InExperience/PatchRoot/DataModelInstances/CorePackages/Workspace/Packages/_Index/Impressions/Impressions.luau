return {
	["jest.config"] = script["jest.config"],
	Constants = require(script.Constants),
	ImpressionsDetector = require(script.ImpressionsDetector),
	ImpressionsTaggerWrapper = require(script.ImpressionsTaggerWrapper),
	ImpressionsTagUtility = require(script.ImpressionsTagUtility),
	ImpressionsVisualizer = require(script.ImpressionsVisualizer),
	ScreenSizeImpressionsDetector = require(script.ScreenSizeImpressionsDetector),
	useImpressionsTagger = require(script.useImpressionsTagger),
	useBatchedImpressions = require(script.useBatchedImpressions),
	ImpressionsTracker = require(script.ImpressionsTracker),
	ImpressionsTrackerWithoutNavigation = require(script.ImpressionsTrackerWithoutNavigation),
	FrameBoundsImpressionsTracker = require(script.FrameBoundsImpressionsTracker),
	ScreenSizeImpressionsTracker = require(script.ScreenSizeImpressionsTracker),
	ContentThresholdImpressionsDetector = require(script.ContentThresholdImpressionsDetector),
	ViewportVisibilityImpressionsDetector = require(script.ViewportVisibilityImpressionsDetector)
}