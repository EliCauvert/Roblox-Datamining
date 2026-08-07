local navigationSymbolModule = require(script.Parent.NavigationSymbol)

return {
	WillFocus = navigationSymbolModule("WILL_FOCUS"),
	DidFocus = navigationSymbolModule("DID_FOCUS"),
	WillBlur = navigationSymbolModule("WILL_BLUR"),
	DidBlur = navigationSymbolModule("DID_BLUR"),
	Action = navigationSymbolModule("ACTION"),
	Refocus = navigationSymbolModule("REFOCUS")
}