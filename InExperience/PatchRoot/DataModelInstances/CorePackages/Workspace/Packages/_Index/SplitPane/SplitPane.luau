return {
	SplitPaneStore = require(script.Stores.SplitPaneStore),
	useSplitLayoutStatus = require(script.Hooks.useSplitLayoutStatus),
	useSplitPaneRender = require(script.Hooks.useSplitPaneRender),
	SplitPaneContext = require(script.Context.SplitPaneContext),
	SplitPaneNavigationLayout = require(script.Components.SplitPaneNavigationLayout),
	isSupportPaneScreen = require(script.Utils.isSupportPaneScreen),
	["jest.config"] = script["jest.config"]
}