local useProperty = require(script:FindFirstAncestor("RobloxAppHooks").Parent.GuiObjectUtils).useProperty

return function()
	-- upvalues: useProperty (ref)
	return useProperty(workspace, "CurrentCamera")
end