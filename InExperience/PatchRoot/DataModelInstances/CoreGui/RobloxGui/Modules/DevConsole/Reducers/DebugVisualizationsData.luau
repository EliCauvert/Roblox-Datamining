local immutableModule = require(script.Parent.Parent.Immutable)
local debugVisualizationsUpdateSearchFilterModule = require(script.Parent.Parent.Actions.DebugVisualizationsUpdateSearchFilter)

return function(p0, p1) --[[ line: 5 ]]
	-- upvalues: immutableModule (ref), debugVisualizationsUpdateSearchFilterModule (ref)
	p0 = p0 or {
		debugVisualizationsSearchTerm = "",
		debugVisualizationsTypeFilters = {}
	}
	
	return if p1.type == debugVisualizationsUpdateSearchFilterModule.name then immutableModule.JoinDictionaries(p0, {
		debugVisualizationsSearchTerm = p1.searchTerm,
		debugVisualizationsTypeFilters = if p1.filterTypes == nil then p0.debugVisualizationsTypeFilters else immutableModule.JoinDictionaries(p0.debugVisualizationsTypeFilters, p1.filterTypes)
	}) else p0
end