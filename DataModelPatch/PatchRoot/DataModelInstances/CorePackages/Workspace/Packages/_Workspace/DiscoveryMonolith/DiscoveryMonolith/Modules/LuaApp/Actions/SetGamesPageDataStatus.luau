local Parent = script:FindFirstAncestor("DiscoveryMonolith").Parent
local FFlagLuaAppChartsResetFetchingStatusOnFilterChange = require(Parent.SharedFlags).FFlagLuaAppChartsResetFetchingStatusOnFilterChange

return require(Parent.Rodux).makeActionCreator(script.Name, function(Status, p1)
	-- upvalues: FFlagLuaAppChartsResetFetchingStatusOnFilterChange (copy)
	assert(type(Status) == "string", string.format("SetGamesPageDataStatus action expects status to be a string, was %s", (type(Status))))
	
	return {
		status = Status,
		isRefreshFetch = if FFlagLuaAppChartsResetFetchingStatusOnFilterChange then p1 else nil
	}
end)