local immutableModule = require(script.Parent.Parent.Immutable)
local actionBindingsUpdateSearchFilterModule = require(script.Parent.Parent.Actions.ActionBindingsUpdateSearchFilter)

return function(p1, p2)
	-- upvalues: actionBindingsUpdateSearchFilterModule (ref), immutableModule (ref)
	p1 = p1 or { bindingsSearchTerm = "" }
	
	return if p2.type == actionBindingsUpdateSearchFilterModule.name then immutableModule.Set(p1, "bindingsSearchTerm", p2.searchTerm) else p1
end