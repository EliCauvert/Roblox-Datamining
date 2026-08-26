local withDefaultsModule = require(script:FindFirstAncestor("Foundation").Utility.withDefaults)
local useInputGroupModule = require(script.Parent.useInputGroup)

return function(p1, p2)
	-- upvalues: useInputGroupModule (ref), withDefaultsModule (ref)
	return withDefaultsModule(p1, withDefaultsModule(useInputGroupModule(), p2))
end