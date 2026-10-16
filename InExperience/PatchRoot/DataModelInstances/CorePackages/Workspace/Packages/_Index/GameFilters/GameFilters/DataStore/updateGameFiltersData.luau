local GameFilters = script:FindFirstAncestor("GameFilters")
local _ = require(GameFilters.Parent.DiscoveryTypes)
local GameFilterModelModule = require(GameFilters.DataStore.GameFilterModel)
local SetGameFiltersModule = require(GameFilters.DataStore.SetGameFilters)

return function(p1, p2, List) --[[ Line: 9 ]]
	-- upvalues: GameFilterModelModule (copy), SetGameFiltersModule (copy)
	if not List or #List == 0 then
		warn("Found no filters in this sort")
	end
	local FromExploreJsonDataResults = {}
	
	for _, value in List do
		table.insert(FromExploreJsonDataResults, (GameFilterModelModule.fromExploreJsonData(value)))
	end
	p1:dispatch(SetGameFiltersModule(p2, FromExploreJsonDataResults, (tick())))
end