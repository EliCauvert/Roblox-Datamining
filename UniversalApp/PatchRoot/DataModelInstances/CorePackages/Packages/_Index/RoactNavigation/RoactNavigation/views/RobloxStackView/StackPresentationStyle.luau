local navigationSymbolModule = require(script.Parent.Parent.Parent.NavigationSymbol)

return {
	Default = navigationSymbolModule("DEFAULT"),
	Modal = navigationSymbolModule("MODAL"),
	Overlay = navigationSymbolModule("OVERLAY")
}