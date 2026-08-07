local useProperty = require(script:FindFirstAncestor("RobloxAppHooks").Parent.GuiObjectUtils).useProperty

return function() --[[ line: 5 | named "useCurrentCamera" ]]
	-- upvalues: useProperty (ref)
	return useProperty(workspace, "CurrentCamera")
end