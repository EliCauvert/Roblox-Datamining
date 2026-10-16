local ImmutableModule = require(script.Parent.Parent.Immutable)
local ClientScriptsUpdateSearchFilterModule = require(script.Parent.Parent.Actions.ClientScriptsUpdateSearchFilter)
local ServerScriptsUpdateSearchFilterModule = require(script.Parent.Parent.Actions.ServerScriptsUpdateSearchFilter)

return function(p1, p2) --[[ Line: 13 ]]
	-- upvalues: ClientScriptsUpdateSearchFilterModule (copy), ImmutableModule (copy), ServerScriptsUpdateSearchFilterModule (copy)
	local P0 = p1 or {
		clientSearchTerm = "",
		serverSearchTerm = "",
		clientTypeFilters = {},
		serverTypeFilters = {}
	}
	
	return if p2.type == ClientScriptsUpdateSearchFilterModule.name then ImmutableModule.JoinDictionaries(P0, {
		clientSearchTerm = p2.searchTerm,
		clientTypeFilters = ImmutableModule.JoinDictionaries(P0.clientTypeFilters, p2.filterTypes)
	}) elseif p2.type == ServerScriptsUpdateSearchFilterModule.name then ImmutableModule.JoinDictionaries(P0, {
		serverSearchTerm = p2.searchTerm,
		serverTypeFilters = ImmutableModule.JoinDictionaries(P0.serverTypeFilters, p2.filterTypes)
	}) else P0
end