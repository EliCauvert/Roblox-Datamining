-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:31:00 2026 Pacific Standard Time.

local navigationSymbolModule = require(script.Parent.NavigationSymbol)
local t = {
	None = navigationSymbolModule("NONE"),
	InitialRoute = navigationSymbolModule("INITIAL_ROUTE"),
	Order = navigationSymbolModule("ORDER"),
	History = navigationSymbolModule("HISTORY")
}
setmetatable(t, {
	__index = function(_, p0) --[[ line: 24 ]]
		error(("%q is not a valid member of BackBehavior"):format(tostring(p0)), 2)
	end
})

return t