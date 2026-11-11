local ImmutableModule = require(script.Parent.Parent.Immutable)
local DebugVisualizationsUpdateSearchFilterModule = require(script.Parent.Parent.Actions.DebugVisualizationsUpdateSearchFilter)

return function(p1, p2)
	-- upvalues: ImmutableModule (copy), DebugVisualizationsUpdateSearchFilterModule (copy)
	local P0 = p1 or {
		debugVisualizationsSearchTerm = "",
		debugVisualizationsTypeFilters = {}
	}
	local DebugVisualizationsTypeFilters = if p2.filterTypes == nil then P0.debugVisualizationsTypeFilters else ImmutableModule.JoinDictionaries(P0.debugVisualizationsTypeFilters, p2.filterTypes)
	
	return if p2.type == DebugVisualizationsUpdateSearchFilterModule.name then ImmutableModule.JoinDictionaries(P0, {
		debugVisualizationsSearchTerm = p2.searchTerm,
		debugVisualizationsTypeFilters = DebugVisualizationsTypeFilters
	}) else P0
end