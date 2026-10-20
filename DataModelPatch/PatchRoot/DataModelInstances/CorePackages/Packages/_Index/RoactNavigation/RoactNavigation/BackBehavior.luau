local NavigationSymbolModule = require(script.Parent.NavigationSymbol)
local BackBehaviorModule = {
	None = NavigationSymbolModule("NONE"),
	InitialRoute = NavigationSymbolModule("INITIAL_ROUTE"),
	Order = NavigationSymbolModule("ORDER"),
	History = NavigationSymbolModule("HISTORY")
}
setmetatable(BackBehaviorModule, {
	__index = function(_, p1)
		error(("%q is not a valid member of BackBehavior"):format((tostring(p1))), 2)
	end
})

return BackBehaviorModule