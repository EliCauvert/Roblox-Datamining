local immutableModule = require(script.Parent.Parent.Immutable)
local dataStoresUpdateSearchFilterModule = require(script.Parent.Parent.Actions.DataStoresUpdateSearchFilter)

return function(p1, p2)
	-- upvalues: dataStoresUpdateSearchFilterModule (ref), immutableModule (ref)
	p1 = p1 or { storesSearchTerm = "" }
	
	return if p2.type == dataStoresUpdateSearchFilterModule.name then immutableModule.Set(p1, "storesSearchTerm", p2.searchTerm) else p1
end