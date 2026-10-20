local UsePropertyFunction = require(script:FindFirstAncestor("RobloxAppHooks").Parent.GuiObjectUtils).useProperty

return function()
	-- upvalues: UsePropertyFunction (copy)
	return UsePropertyFunction(workspace, "CurrentCamera")
end