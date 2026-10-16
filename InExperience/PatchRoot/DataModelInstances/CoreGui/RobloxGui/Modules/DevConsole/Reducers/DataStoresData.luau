local ImmutableModule = require(script.Parent.Parent.Immutable)
local DataStoresUpdateSearchFilterModule = require(script.Parent.Parent.Actions.DataStoresUpdateSearchFilter)

return function(p1, p2) --[[ Line: 9 ]]
	-- upvalues: DataStoresUpdateSearchFilterModule (copy), ImmutableModule (copy)
	local P0 = p1 or { storesSearchTerm = "" }
	
	return if p2.type == DataStoresUpdateSearchFilterModule.name then ImmutableModule.Set(P0, "storesSearchTerm", p2.searchTerm) else P0
end