local navigationSymbolModule = require(script.Parent.NavigationSymbol)
local t = {
	None = navigationSymbolModule("NONE"),
	InitialRoute = navigationSymbolModule("INITIAL_ROUTE"),
	Order = navigationSymbolModule("ORDER"),
	History = navigationSymbolModule("HISTORY")
}
setmetatable(t, {
	__index = function(_, p1)
		error(("%q is not a valid member of BackBehavior"):format(tostring(p1)), 2)
	end
})

return t