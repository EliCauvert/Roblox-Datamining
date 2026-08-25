local _ = require(script:FindFirstAncestor("ReactUtils").Parent.React)
local usePropertiesBaseModule = require(script.Parent.usePropertiesBase)

return function(p0, p1, ...)
	-- upvalues: usePropertiesBaseModule (ref)
	return usePropertiesBaseModule(p0, p1, false, ...)
end