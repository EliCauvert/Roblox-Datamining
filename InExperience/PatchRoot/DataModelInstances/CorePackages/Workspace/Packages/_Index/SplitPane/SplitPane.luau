local appSplitViewModule = require(script.Parent.AppSplitView)

return {
	SplitPaneStore = require(script.Stores.SplitPaneStore),
	useSplitLayoutStatus = require(script.Hooks.useSplitLayoutStatus),
	useSplitPaneRender = require(script.Hooks.useSplitPaneRender),
	SplitPaneContext = require(script.Context.SplitPaneContext),
	SplitPaneNavigationLayout = require(script.Components.SplitPaneNavigationLayout),
	isSupportPaneScreen = require(script.Utils.isSupportPaneScreen),
	SplitPaneVariant = require(script.Utils.SplitPaneVariant),
	getOnScreenContextValue = require(script.Utils.getOnScreenContextValue),
	OnScreenCardProvider = require(script.Components.OnScreenCardProvider),
	SplitPaneSlot = appSplitViewModule.Enums.SplitPaneSlot,
	SplitL3SessionHelper = require(script.Utils.SplitL3SessionHelper),
	SplitL3SessionManager = require(script.Components.SplitL3SessionManager),
	SupportPaneMode = appSplitViewModule.Enums.SupportPaneMode,
	["jest.config"] = script["jest.config"],
	getSplitPaneEducationalTourStore = require(script.Stores.getSplitPaneEducationalTourStore),
	isSplitPaneTourSupported = require(script.Utils.isSplitPaneTourSupported)
}