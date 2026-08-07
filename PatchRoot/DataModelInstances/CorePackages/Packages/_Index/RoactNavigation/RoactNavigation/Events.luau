-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:31:00 2026 Pacific Standard Time.

local navigationSymbolModule = require(script.Parent.NavigationSymbol)

return {
	WillFocus = navigationSymbolModule("WILL_FOCUS"),
	DidFocus = navigationSymbolModule("DID_FOCUS"),
	WillBlur = navigationSymbolModule("WILL_BLUR"),
	DidBlur = navigationSymbolModule("DID_BLUR"),
	Action = navigationSymbolModule("ACTION"),
	Refocus = navigationSymbolModule("REFOCUS")
}