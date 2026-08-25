local immutableModule = require(script.Parent.Parent.Immutable)
local serverStatsUpdateSearchFilterModule = require(script.Parent.Parent.Actions.ServerStatsUpdateSearchFilter)

return function(p0, p1)
	-- upvalues: serverStatsUpdateSearchFilterModule (ref), immutableModule (ref)
	p0 = p0 or { statsSearchTerm = "" }
	
	return if p1.type == serverStatsUpdateSearchFilterModule.name then immutableModule.Set(p0, "statsSearchTerm", p1.searchTerm) else p0
end