local immutableModule = require(script.Parent.Parent.Immutable)
local clientScriptsUpdateSearchFilterModule = require(script.Parent.Parent.Actions.ClientScriptsUpdateSearchFilter)
local serverScriptsUpdateSearchFilterModule = require(script.Parent.Parent.Actions.ServerScriptsUpdateSearchFilter)

return function(p1, p2)
	-- upvalues: clientScriptsUpdateSearchFilterModule (ref), immutableModule (ref), serverScriptsUpdateSearchFilterModule (ref)
	p1 = p1 or {
		clientSearchTerm = "",
		serverSearchTerm = "",
		clientTypeFilters = {},
		serverTypeFilters = {}
	}
	
	return if p2.type == clientScriptsUpdateSearchFilterModule.name then immutableModule.JoinDictionaries(p1, {
		clientSearchTerm = p2.searchTerm,
		clientTypeFilters = immutableModule.JoinDictionaries(p1.clientTypeFilters, p2.filterTypes)
	}) elseif p2.type == serverScriptsUpdateSearchFilterModule.name then immutableModule.JoinDictionaries(p1, {
		serverSearchTerm = p2.searchTerm,
		serverTypeFilters = immutableModule.JoinDictionaries(p1.serverTypeFilters, p2.filterTypes)
	}) else p1
end