local _ = require(script:FindFirstAncestor("ReactUtils").Parent.React)
local UsePropertiesBaseModule = require(script.Parent.usePropertiesBase)

return function(p1, p2, ...) --[[ Line: 33 | Named "useProperties" ]]
	-- upvalues: UsePropertiesBaseModule (copy)
	return UsePropertiesBaseModule(p1, p2, false, ...)
end