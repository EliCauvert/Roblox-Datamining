local immutableModule = require(script.Parent.Parent.Immutable)
local actionBindingsUpdateSearchFilterModule = require(script.Parent.Parent.Actions.ActionBindingsUpdateSearchFilter)

return function(p0, p1) --[[ line: 9 ]]
	-- upvalues: actionBindingsUpdateSearchFilterModule (ref), immutableModule (ref)
	p0 = p0 or { bindingsSearchTerm = "" }
	
	return if p1.type == actionBindingsUpdateSearchFilterModule.name then immutableModule.Set(p0, "bindingsSearchTerm", p1.searchTerm) else p0
end