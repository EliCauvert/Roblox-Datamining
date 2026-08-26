local _ = require(script:FindFirstAncestor("ReactUtils").Parent.React)
local usePropertiesBaseModule = require(script.Parent.usePropertiesBase)

return function(p1, p2, ...)
	-- upvalues: usePropertiesBaseModule (ref)
	return usePropertiesBaseModule(p1, p2, false, ...)
end