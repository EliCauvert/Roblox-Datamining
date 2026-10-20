local ReactModule = require(script.Parent.Parent.Dev.React)
local FoldProvidersModule = require(script.Parent.foldProviders)

return function(p1, p2)
	-- upvalues: ReactModule (copy), FoldProvidersModule (copy)
	local P1 = p2 or {}
	assert(P1, "Config must not be nil")
	
	return FoldProvidersModule(ReactModule.createElement(p1, P1.props), P1.providers or {})
end