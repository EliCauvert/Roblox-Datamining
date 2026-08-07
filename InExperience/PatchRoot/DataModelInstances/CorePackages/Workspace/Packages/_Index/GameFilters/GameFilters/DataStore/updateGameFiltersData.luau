local gameFilters = script:FindFirstAncestor("GameFilters")
local _ = require(gameFilters.Parent.DiscoveryTypes)
local gameFilterModelModule = require(gameFilters.DataStore.GameFilterModel)
local setGameFiltersModule = require(gameFilters.DataStore.SetGameFilters)

return function(p0, p1, p2) --[[ line: 9 ]]
	-- upvalues: gameFilterModelModule (ref), setGameFiltersModule (ref)
	if not p2 or #p2 == 0 then
		warn("Found no filters in this sort")
	end
	local t = {}
	
	for i, v in p2 do
		table.insert(t, gameFilterModelModule.fromExploreJsonData(v))
	end
	p0:dispatch(setGameFiltersModule(p1, t, tick()))
end