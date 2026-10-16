local GameProductInfoRodux = script:FindFirstAncestor("GameProductInfoRodux")
local Immutable = require(GameProductInfoRodux.Parent.AppCommonLib).Immutable
local SetGamesProductInfoModule = require(GameProductInfoRodux.SetGamesProductInfo)
local _ = require(GameProductInfoRodux.GameProductInfo)

return {
	key = "GamesProductInfoKey",
	reducer = function(p1, p2) --[[ Line: 13 ]]
		-- upvalues: SetGamesProductInfoModule (copy), Immutable (copy)
		local P0 = p1 or {}
		assert(P0, "")
		
		if p2.type == SetGamesProductInfoModule.name then
			P0 = Immutable.JoinDictionaries(P0, p2.gamesProductInfo)
		end
		return P0
	end
}