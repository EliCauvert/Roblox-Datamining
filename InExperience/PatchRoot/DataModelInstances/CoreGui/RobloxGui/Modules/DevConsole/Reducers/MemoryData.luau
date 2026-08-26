local immutableModule = require(script.Parent.Parent.Immutable)
local clientMemoryUpdateSearchFilterModule = require(script.Parent.Parent.Actions.ClientMemoryUpdateSearchFilter)
local serverMemoryUpdateSearchFilterModule = require(script.Parent.Parent.Actions.ServerMemoryUpdateSearchFilter)

return function(p1, p2)
	-- upvalues: clientMemoryUpdateSearchFilterModule (ref), immutableModule (ref), serverMemoryUpdateSearchFilterModule (ref)
	p1 = p1 or { clientSearchTerm = "", serverSearchTerm = "" }
	
	return if p2.type == clientMemoryUpdateSearchFilterModule.name then immutableModule.Set(p1, "clientSearchTerm", p2.searchTerm) elseif p2.type == serverMemoryUpdateSearchFilterModule.name then immutableModule.Set(p1, "serverSearchTerm", p2.searchTerm) else p1
end