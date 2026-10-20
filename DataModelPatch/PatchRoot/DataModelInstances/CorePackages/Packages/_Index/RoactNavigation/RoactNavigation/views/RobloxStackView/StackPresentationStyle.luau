local NavigationSymbolModule = require(script.Parent.Parent.Parent.NavigationSymbol)

return {
	Default = NavigationSymbolModule("DEFAULT"),
	Modal = NavigationSymbolModule("MODAL"),
	Overlay = NavigationSymbolModule("OVERLAY")
}