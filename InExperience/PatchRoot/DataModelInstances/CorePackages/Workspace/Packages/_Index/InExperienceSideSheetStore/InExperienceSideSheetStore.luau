local _ = require(script.Types)
local WindowShownBesideSideSheetModule = require(script.windowShownBesideSideSheet)

return {
	Analytics = require(script.Analytics.AnalyticsConstants),
	Constants = require(script.Constants),
	GetSideSheetStore = require(script.Stores.GetSideSheetStore),
	getClaimedWindowAreaBesideSideSheet = require(script.getClaimedWindowAreaBesideSideSheet),
	getSideSheetVisibility = require(script.getSideSheetVisibility),
	getWindowShownBesideSideSheet = WindowShownBesideSideSheetModule.getWindowShownBesideSideSheet,
	logSidesheetClosed = require(script.Analytics.SidesheetAnalytics).logSidesheetClosed,
	releaseWindowBesideSideSheet = require(script.releaseWindowBesideSideSheet),
	setWindowShownBesideSideSheet = WindowShownBesideSideSheetModule.setWindowShownBesideSideSheet,
	["jest.config"] = script["jest.config"]
}