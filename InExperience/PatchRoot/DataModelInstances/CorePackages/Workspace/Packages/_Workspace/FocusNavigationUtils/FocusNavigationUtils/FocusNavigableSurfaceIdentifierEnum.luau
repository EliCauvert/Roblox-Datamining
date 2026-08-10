local sharedFlagsModule = require(script:FindFirstAncestor("FocusNavigationUtils").Parent.SharedFlags)

return {
	ModerationOverlay = "ModerationOverlay",
	CentralOverlay = "CentralOverlay",
	NavBar = "NavBar",
	RouterView = "RouterView",
	SubRouterView = "SubRouterView",
	SearchBar = "SearchBar",
	ContextualMenu = "ContextualMenu",
	PopUp = "PopUp",
	PeekView = "PeekView",
	Auxiliary = "Auxiliary",
	HeaderView = if sharedFlagsModule.FFlagAppIaHomeSubTab then "HeaderView" else nil,
	Drawer = if sharedFlagsModule.FFlagEnableDrawerFocusNav then "Drawer" else nil
}