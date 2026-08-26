local gameProductInfoRodux = script:FindFirstAncestor("GameProductInfoRodux")
local immutable = require(gameProductInfoRodux.Parent.AppCommonLib).Immutable
local setGamesProductInfoModule = require(gameProductInfoRodux.SetGamesProductInfo)
local _ = require(gameProductInfoRodux.GameProductInfo)

return {
	key = "GamesProductInfoKey",
	reducer = function(p1, p2)
		-- upvalues: setGamesProductInfoModule (ref), immutable (ref)
		p1 = p1 or {}
		assert(p1, "")
		
		if p2.type == setGamesProductInfoModule.name then
			p1 = immutable.JoinDictionaries(p1, p2.gamesProductInfo)
		end
		return p1
	end
}