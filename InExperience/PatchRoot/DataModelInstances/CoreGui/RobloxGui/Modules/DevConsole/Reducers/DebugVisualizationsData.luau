local immutableModule = require(script.Parent.Parent.Immutable)
local debugVisualizationsUpdateSearchFilterModule = require(script.Parent.Parent.Actions.DebugVisualizationsUpdateSearchFilter)

return function(p1, p2)
	-- upvalues: immutableModule (ref), debugVisualizationsUpdateSearchFilterModule (ref)
	p1 = p1 or {
		debugVisualizationsSearchTerm = "",
		debugVisualizationsTypeFilters = {}
	}
	
	return if p2.type == debugVisualizationsUpdateSearchFilterModule.name then immutableModule.JoinDictionaries(p1, {
		debugVisualizationsSearchTerm = p2.searchTerm,
		debugVisualizationsTypeFilters = if p2.filterTypes == nil then p1.debugVisualizationsTypeFilters else immutableModule.JoinDictionaries(p1.debugVisualizationsTypeFilters, p2.filterTypes)
	}) else p1
end