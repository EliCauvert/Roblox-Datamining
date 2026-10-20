local ImmutableModule = require(script.Parent.Parent.Immutable)
local ServerStatsUpdateSearchFilterModule = require(script.Parent.Parent.Actions.ServerStatsUpdateSearchFilter)

return function(p1, p2)
	-- upvalues: ServerStatsUpdateSearchFilterModule (copy), ImmutableModule (copy)
	local P0 = p1 or { statsSearchTerm = "" }
	
	return if p2.type == ServerStatsUpdateSearchFilterModule.name then ImmutableModule.Set(P0, "statsSearchTerm", p2.searchTerm) else P0
end