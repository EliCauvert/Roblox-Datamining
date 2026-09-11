return {
	SplitPaneStore = require(script.Stores.SplitPaneStore),
	useSplitLayoutStatus = require(script.Hooks.useSplitLayoutStatus),
	useSplitPaneRender = require(script.Hooks.useSplitPaneRender),
	SplitPaneContext = require(script.Context.SplitPaneContext),
	SplitPaneNavigationLayout = require(script.Components.SplitPaneNavigationLayout),
	isSupportPaneScreen = require(script.Utils.isSupportPaneScreen),
	getOnScreenContextValue = require(script.Utils.getOnScreenContextValue),
	OnScreenCardProvider = require(script.Components.OnScreenCardProvider),
	SplitPaneSlot = require(script.Parent.AppSplitView).Enums.SplitPaneSlot,
	SplitL3SessionHelper = require(script.Utils.SplitL3SessionHelper),
	SplitL3SessionManager = require(script.Components.SplitL3SessionManager),
	["jest.config"] = script["jest.config"]
}