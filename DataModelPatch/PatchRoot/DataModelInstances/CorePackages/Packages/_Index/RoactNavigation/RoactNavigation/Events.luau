local NavigationSymbolModule = require(script.Parent.NavigationSymbol)

return {
	WillFocus = NavigationSymbolModule("WILL_FOCUS"),
	DidFocus = NavigationSymbolModule("DID_FOCUS"),
	WillBlur = NavigationSymbolModule("WILL_BLUR"),
	DidBlur = NavigationSymbolModule("DID_BLUR"),
	Action = NavigationSymbolModule("ACTION"),
	Refocus = NavigationSymbolModule("REFOCUS")
}