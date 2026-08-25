local withDefaultsModule = require(script:FindFirstAncestor("Foundation").Utility.withDefaults)
local useInputGroupModule = require(script.Parent.useInputGroup)

return function(p0, p1)
	-- upvalues: useInputGroupModule (ref), withDefaultsModule (ref)
	return withDefaultsModule(p0, withDefaultsModule(useInputGroupModule(), p1))
end