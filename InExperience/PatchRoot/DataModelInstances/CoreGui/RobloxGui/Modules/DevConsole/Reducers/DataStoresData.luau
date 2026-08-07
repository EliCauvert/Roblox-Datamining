local immutableModule = require(script.Parent.Parent.Immutable)
local dataStoresUpdateSearchFilterModule = require(script.Parent.Parent.Actions.DataStoresUpdateSearchFilter)

return function(p0, p1) --[[ line: 9 ]]
	-- upvalues: dataStoresUpdateSearchFilterModule (ref), immutableModule (ref)
	p0 = p0 or { storesSearchTerm = "" }
	
	return if p1.type == dataStoresUpdateSearchFilterModule.name then immutableModule.Set(p0, "storesSearchTerm", p1.searchTerm) else p0
end