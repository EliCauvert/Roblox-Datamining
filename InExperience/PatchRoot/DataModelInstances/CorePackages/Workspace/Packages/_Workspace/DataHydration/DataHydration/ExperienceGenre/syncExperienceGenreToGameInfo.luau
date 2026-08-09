local dataHydration = script:FindFirstAncestor("DataHydration")
local getGameInfoStoreModule = require(dataHydration.Game.GameInfo.getGameInfoStore)
local fFlagLuaAppDataHydrationUpdateItem = require(dataHydration.Parent.SharedFlags).FFlagLuaAppDataHydrationUpdateItem

return {
	syncExperienceGenreToGameInfo = function(p0, p1, p2) --[[ line: 9 ]]
		-- upvalues: fFlagLuaAppDataHydrationUpdateItem (ref), getGameInfoStoreModule (ref)
		if not fFlagLuaAppDataHydrationUpdateItem then return end
		if p1 or p2 then
			getGameInfoStoreModule(false).updateGameInfo(tostring(p0), { genreL1 = p1, genreL2 = p2 })
			
			return
		end
	end
}