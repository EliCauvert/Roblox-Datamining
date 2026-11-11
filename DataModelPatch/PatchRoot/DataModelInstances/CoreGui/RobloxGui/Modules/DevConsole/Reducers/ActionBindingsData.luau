local ImmutableModule = require(script.Parent.Parent.Immutable)
local ActionBindingsUpdateSearchFilterModule = require(script.Parent.Parent.Actions.ActionBindingsUpdateSearchFilter)

return function(p1, p2)
	-- upvalues: ActionBindingsUpdateSearchFilterModule (copy), ImmutableModule (copy)
	local P0 = p1 or { bindingsSearchTerm = "" }
	
	return if p2.type == ActionBindingsUpdateSearchFilterModule.name then ImmutableModule.Set(P0, "bindingsSearchTerm", p2.searchTerm) else P0
end