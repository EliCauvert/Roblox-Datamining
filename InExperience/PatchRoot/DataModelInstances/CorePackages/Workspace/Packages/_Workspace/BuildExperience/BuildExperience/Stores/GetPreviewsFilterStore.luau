local BuildExperience = script:FindFirstAncestor("BuildExperience")
local CreateMyCreationsFilterStoreModule = require(BuildExperience.Stores.GetMyCreationsFilterStore.createMyCreationsFilterStore)
local GamesFilterModule = require(BuildExperience.Stores.GetMyCreationsFilterStore.GamesFilter)

return require(BuildExperience.Parent.Signals).createComputed(function()
	-- upvalues: CreateMyCreationsFilterStoreModule (copy), GamesFilterModule (copy)
	local MyCreationsFilterStoreModule = CreateMyCreationsFilterStoreModule()
	MyCreationsFilterStoreModule.setFilter({ games = GamesFilterModule.All })
	
	return MyCreationsFilterStoreModule
end)