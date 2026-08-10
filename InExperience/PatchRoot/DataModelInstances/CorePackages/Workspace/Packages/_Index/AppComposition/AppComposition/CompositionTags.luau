local fFlagEnableSplitPane = require(script:FindFirstAncestor("AppComposition").Parent.SharedFlags).FFlagEnableSplitPane

return {
	NavigationRegion = if fFlagEnableSplitPane then { Root = "composition-navigation-root" } else nil,
	ContentRegion = {
		Root = "composition-content-root",
		Header = "composition-content-header",
		Body = "composition-content-body"
	},
	SupportRegion = if fFlagEnableSplitPane then {
		Root = "composition-support-root",
		Collapsed = "composition-support-collapsed"
	} else nil,
	Layout = {
		Discovery = "composition-layout-discovery",
		Detail = "composition-layout-detail"
	},
	Utility = { ClipAtMaxWidth = "composition-clip-at-max-width" }
}