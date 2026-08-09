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
	HeaderView = if require(script:FindFirstAncestor("FocusNavigationUtils").Parent.SharedFlags).FFlagAppIaHomeSubTab then "HeaderView" else nil
}