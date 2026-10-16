local _ = require(script:FindFirstAncestor("ReactUtils").Parent.React)
local UsePropertiesBaseModule = require(script.Parent.usePropertiesBase)

return function(p1, p2, ...) --[[ Line: 19 | Named "usePropertiesDeferred" ]]
	-- upvalues: UsePropertiesBaseModule (copy)
	return UsePropertiesBaseModule(p1, p2, true, ...)
end