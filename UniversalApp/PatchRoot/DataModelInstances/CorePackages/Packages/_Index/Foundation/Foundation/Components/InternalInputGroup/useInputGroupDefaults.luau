local WithDefaultsModule = require(script:FindFirstAncestor("Foundation").Utility.withDefaults)
local UseInputGroupModule = require(script.Parent.useInputGroup)

return function(p1, p2)
	-- upvalues: UseInputGroupModule (copy), WithDefaultsModule (copy)
	return WithDefaultsModule(p1, WithDefaultsModule(UseInputGroupModule(), p2))
end