local immutableModule = require(script.Parent.Parent.Immutable)
local clientScriptsUpdateSearchFilterModule = require(script.Parent.Parent.Actions.ClientScriptsUpdateSearchFilter)
local serverScriptsUpdateSearchFilterModule = require(script.Parent.Parent.Actions.ServerScriptsUpdateSearchFilter)

return function(p0, p1) --[[ line: 13 ]]
	-- upvalues: clientScriptsUpdateSearchFilterModule (ref), immutableModule (ref), serverScriptsUpdateSearchFilterModule (ref)
	p0 = p0 or {
		clientSearchTerm = "",
		serverSearchTerm = "",
		clientTypeFilters = {},
		serverTypeFilters = {}
	}
	
	return if p1.type == clientScriptsUpdateSearchFilterModule.name then immutableModule.JoinDictionaries(p0, {
		clientSearchTerm = p1.searchTerm,
		clientTypeFilters = immutableModule.JoinDictionaries(p0.clientTypeFilters, p1.filterTypes)
	}) elseif p1.type == serverScriptsUpdateSearchFilterModule.name then immutableModule.JoinDictionaries(p0, {
		serverSearchTerm = p1.searchTerm,
		serverTypeFilters = immutableModule.JoinDictionaries(p0.serverTypeFilters, p1.filterTypes)
	}) else p0
end