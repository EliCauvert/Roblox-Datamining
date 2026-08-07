local gameProductInfoRodux = script:FindFirstAncestor("GameProductInfoRodux")
local immutable = require(gameProductInfoRodux.Parent.AppCommonLib).Immutable
local setGamesProductInfoModule = require(gameProductInfoRodux.SetGamesProductInfo)
local _ = require(gameProductInfoRodux.GameProductInfo)

return {
	key = "GamesProductInfoKey",
	reducer = function(p0, p1) --[[ line: 13 ]]
		-- upvalues: setGamesProductInfoModule (ref), immutable (ref)
		p0 = p0 or {}
		assert(p0, "")
		
		if p1.type == setGamesProductInfoModule.name then
			p0 = immutable.JoinDictionaries(p0, p1.gamesProductInfo)
		end
		return p0
	end
}