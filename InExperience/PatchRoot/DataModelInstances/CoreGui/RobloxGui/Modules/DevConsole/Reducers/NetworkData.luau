local ImmutableModule = require(script.Parent.Parent.Immutable)
local ClientNetworkUpdateSearchFilterModule = require(script.Parent.Parent.Actions.ClientNetworkUpdateSearchFilter)
local ServerNetworkUpdateSearchFilterModule = require(script.Parent.Parent.Actions.ServerNetworkUpdateSearchFilter)

return function(p1, p2)
	-- upvalues: ClientNetworkUpdateSearchFilterModule (copy), ImmutableModule (copy), ServerNetworkUpdateSearchFilterModule (copy)
	local P0 = p1 or { clientSearchTerm = "", serverSearchTerm = "" }
	
	return if p2.type == ClientNetworkUpdateSearchFilterModule.name then ImmutableModule.Set(P0, "clientSearchTerm", p2.searchTerm) elseif p2.type == ServerNetworkUpdateSearchFilterModule.name then ImmutableModule.Set(P0, "serverSearchTerm", p2.searchTerm) else P0
end