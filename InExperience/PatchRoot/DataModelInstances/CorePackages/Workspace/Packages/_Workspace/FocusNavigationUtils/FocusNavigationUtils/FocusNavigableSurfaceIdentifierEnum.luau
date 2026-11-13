local SharedFlagsModule = require(script:FindFirstAncestor("FocusNavigationUtils").Parent.SharedFlags)
local FFlagAppIaHomeSubTab = SharedFlagsModule.FFlagAppIaHomeSubTab
local FFlagEnableDrawerFocusNav = SharedFlagsModule.FFlagEnableDrawerFocusNav

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
	HeaderView = if FFlagAppIaHomeSubTab then "HeaderView" else nil,
	Drawer = if FFlagEnableDrawerFocusNav then "Drawer" else nil
}