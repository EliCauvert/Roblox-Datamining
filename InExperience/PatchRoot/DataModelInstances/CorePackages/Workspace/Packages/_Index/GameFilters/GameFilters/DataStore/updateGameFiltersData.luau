local gameFilters = script:FindFirstAncestor("GameFilters")
local _ = require(gameFilters.Parent.DiscoveryTypes)
local gameFilterModelModule = require(gameFilters.DataStore.GameFilterModel)
local setGameFiltersModule = require(gameFilters.DataStore.SetGameFilters)

return function(p1, p2, p3)
	-- upvalues: gameFilterModelModule (ref), setGameFiltersModule (ref)
	if not p3 or #p3 == 0 then
		warn("Found no filters in this sort")
	end
	local t = {}
	
	for i, v in p3 do
		table.insert(t, gameFilterModelModule.fromExploreJsonData(v))
	end
	p1:dispatch(setGameFiltersModule(p2, t, tick()))
end