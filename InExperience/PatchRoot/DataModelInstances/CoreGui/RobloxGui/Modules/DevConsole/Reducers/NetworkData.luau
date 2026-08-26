local immutableModule = require(script.Parent.Parent.Immutable)
local clientNetworkUpdateSearchFilterModule = require(script.Parent.Parent.Actions.ClientNetworkUpdateSearchFilter)
local serverNetworkUpdateSearchFilterModule = require(script.Parent.Parent.Actions.ServerNetworkUpdateSearchFilter)

return function(p1, p2)
	-- upvalues: clientNetworkUpdateSearchFilterModule (ref), immutableModule (ref), serverNetworkUpdateSearchFilterModule (ref)
	p1 = p1 or { clientSearchTerm = "", serverSearchTerm = "" }
	
	return if p2.type == clientNetworkUpdateSearchFilterModule.name then immutableModule.Set(p1, "clientSearchTerm", p2.searchTerm) elseif p2.type == serverNetworkUpdateSearchFilterModule.name then immutableModule.Set(p1, "serverSearchTerm", p2.searchTerm) else p1
end