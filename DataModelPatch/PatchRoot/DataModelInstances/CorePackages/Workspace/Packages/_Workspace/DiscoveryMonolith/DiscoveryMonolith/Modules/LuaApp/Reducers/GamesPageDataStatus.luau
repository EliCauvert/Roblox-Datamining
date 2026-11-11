local DiscoveryMonolith = script:FindFirstAncestor("DiscoveryMonolith")
local Parent = DiscoveryMonolith.Parent
local RetrievalStatus = require(Parent.Http).Enum.RetrievalStatus
local SetGamesPageDataStatusModule = require(DiscoveryMonolith.Modules.LuaApp.Actions.SetGamesPageDataStatus)
local FFlagLuaAppChartsResetFetchingStatusOnFilterChange = require(Parent.SharedFlags).FFlagLuaAppChartsResetFetchingStatusOnFilterChange

return function(p1, p2)
	-- upvalues: FFlagLuaAppChartsResetFetchingStatusOnFilterChange (copy), RetrievalStatus (copy), SetGamesPageDataStatusModule (copy)
	local P0 = p1 or (if FFlagLuaAppChartsResetFetchingStatusOnFilterChange then {
		isRefreshFetch = false,
		status = RetrievalStatus.NotStarted
	} else RetrievalStatus.NotStarted)
	
	if p2.type == SetGamesPageDataStatusModule.name then
		if FFlagLuaAppChartsResetFetchingStatusOnFilterChange then
			return {
				status = p2.status,
				isRefreshFetch = p2.isRefreshFetch or false
			}
		end
		P0 = p2.status
	end
	return P0
end