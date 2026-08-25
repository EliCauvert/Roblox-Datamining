local immutableModule = require(script.Parent.Parent.Immutable)
local clientNetworkUpdateSearchFilterModule = require(script.Parent.Parent.Actions.ClientNetworkUpdateSearchFilter)
local serverNetworkUpdateSearchFilterModule = require(script.Parent.Parent.Actions.ServerNetworkUpdateSearchFilter)

return function(p0, p1)
	-- upvalues: clientNetworkUpdateSearchFilterModule (ref), immutableModule (ref), serverNetworkUpdateSearchFilterModule (ref)
	p0 = p0 or { clientSearchTerm = "", serverSearchTerm = "" }
	
	return if p1.type == clientNetworkUpdateSearchFilterModule.name then immutableModule.Set(p0, "clientSearchTerm", p1.searchTerm) elseif p1.type == serverNetworkUpdateSearchFilterModule.name then immutableModule.Set(p0, "serverSearchTerm", p1.searchTerm) else p0
end