local immutableModule = require(script.Parent.Parent.Immutable)
local serverStatsUpdateSearchFilterModule = require(script.Parent.Parent.Actions.ServerStatsUpdateSearchFilter)

return function(p1, p2)
	-- upvalues: serverStatsUpdateSearchFilterModule (ref), immutableModule (ref)
	p1 = p1 or { statsSearchTerm = "" }
	
	return if p2.type == serverStatsUpdateSearchFilterModule.name then immutableModule.Set(p1, "statsSearchTerm", p2.searchTerm) else p1
end