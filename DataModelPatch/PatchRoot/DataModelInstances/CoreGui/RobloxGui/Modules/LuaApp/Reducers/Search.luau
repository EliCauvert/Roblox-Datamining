local Modules = game:GetService("CoreGui").RobloxGui.Modules
local SearchesInGamesModule = require(Modules.LuaApp.Reducers.SearchesInGames)
local SearchesInCatalogModule = require(Modules.AvatarExperience.Catalog.Reducers.SearchesInCatalog)

return function(p1, p2)
	-- upvalues: SearchesInGamesModule (copy), SearchesInCatalogModule (copy)
	local P0 = p1 or {}
	
	return {
		SearchesInGames = SearchesInGamesModule(P0.SearchesInGames, p2),
		SearchesInCatalog = SearchesInCatalogModule(P0.SearchesInCatalog, p2)
	}
end