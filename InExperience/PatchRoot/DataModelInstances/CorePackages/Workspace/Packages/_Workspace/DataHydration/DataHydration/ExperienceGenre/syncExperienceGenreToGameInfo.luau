local dataHydration = script:FindFirstAncestor("DataHydration")
local getGameInfoStoreModule = require(dataHydration.Game.GameInfo.getGameInfoStore)
local fFlagLuaAppDataHydrationUpdateItem = require(dataHydration.Parent.SharedFlags).FFlagLuaAppDataHydrationUpdateItem

return {
	syncExperienceGenreToGameInfo = function(p1, p2, p3)
		-- upvalues: fFlagLuaAppDataHydrationUpdateItem (ref), getGameInfoStoreModule (ref)
		if not fFlagLuaAppDataHydrationUpdateItem then return end
		if p2 or p3 then
			getGameInfoStoreModule(false).updateGameInfo(tostring(p1), { genreL1 = p2, genreL2 = p3 })
			
			return
		end
	end
}