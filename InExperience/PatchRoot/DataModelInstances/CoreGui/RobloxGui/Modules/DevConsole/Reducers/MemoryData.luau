local immutableModule = require(script.Parent.Parent.Immutable)
local clientMemoryUpdateSearchFilterModule = require(script.Parent.Parent.Actions.ClientMemoryUpdateSearchFilter)
local serverMemoryUpdateSearchFilterModule = require(script.Parent.Parent.Actions.ServerMemoryUpdateSearchFilter)

return function(p0, p1) --[[ line: 11 ]]
	-- upvalues: clientMemoryUpdateSearchFilterModule (ref), immutableModule (ref), serverMemoryUpdateSearchFilterModule (ref)
	p0 = p0 or { clientSearchTerm = "", serverSearchTerm = "" }
	
	return if p1.type == clientMemoryUpdateSearchFilterModule.name then immutableModule.Set(p0, "clientSearchTerm", p1.searchTerm) elseif p1.type == serverMemoryUpdateSearchFilterModule.name then immutableModule.Set(p0, "serverSearchTerm", p1.searchTerm) else p0
end