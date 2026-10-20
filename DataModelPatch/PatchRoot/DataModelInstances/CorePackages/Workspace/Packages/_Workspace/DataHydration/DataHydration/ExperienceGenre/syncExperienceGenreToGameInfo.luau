local DataHydration = script:FindFirstAncestor("DataHydration")
local GetGameInfoStoreModule = require(DataHydration.Game.GameInfo.getGameInfoStore)
local FFlagLuaAppDataHydrationUpdateItem = require(DataHydration.Parent.SharedFlags).FFlagLuaAppDataHydrationUpdateItem

return {
	syncExperienceGenreToGameInfo = function(p1, GenreL1, GenreL2)
		-- upvalues: FFlagLuaAppDataHydrationUpdateItem (copy), GetGameInfoStoreModule (copy)
		if not FFlagLuaAppDataHydrationUpdateItem then return end
		if GenreL1 or GenreL2 then
			GetGameInfoStoreModule(false).updateGameInfo(tostring(p1), { genreL1 = GenreL1, genreL2 = GenreL2 })
			
			return
		end
	end
}