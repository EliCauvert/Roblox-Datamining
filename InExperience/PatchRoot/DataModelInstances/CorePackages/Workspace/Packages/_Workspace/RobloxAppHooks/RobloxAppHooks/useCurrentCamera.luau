local UsePropertyFunction = require(script:FindFirstAncestor("RobloxAppHooks").Parent.GuiObjectUtils).useProperty

return function() --[[ Line: 5 | Named "useCurrentCamera" ]]
	-- upvalues: UsePropertyFunction (copy)
	return UsePropertyFunction(workspace, "CurrentCamera")
end