local ImmutableModule = require(script.Parent.Parent.Immutable)
local ClientMemoryUpdateSearchFilterModule = require(script.Parent.Parent.Actions.ClientMemoryUpdateSearchFilter)
local ServerMemoryUpdateSearchFilterModule = require(script.Parent.Parent.Actions.ServerMemoryUpdateSearchFilter)

return function(p1, p2)
	-- upvalues: ClientMemoryUpdateSearchFilterModule (copy), ImmutableModule (copy), ServerMemoryUpdateSearchFilterModule (copy)
	local P0 = p1 or { clientSearchTerm = "", serverSearchTerm = "" }
	
	return if p2.type == ClientMemoryUpdateSearchFilterModule.name then ImmutableModule.Set(P0, "clientSearchTerm", p2.searchTerm) elseif p2.type == ServerMemoryUpdateSearchFilterModule.name then ImmutableModule.Set(P0, "serverSearchTerm", p2.searchTerm) else P0
end