local RoduxModule = require(script:FindFirstAncestor("RoduxGames").Parent.Rodux)
local PlayabilityByGameIdModule = require(script.Games.playabilityByGameId)
local ProductInfoByGameIdModule = require(script.Games.productInfoByGameId)
local ByGameIdModule = require(script.Games.byGameId)
local MediaByGameIdModule = require(script.Games.mediaByGameId)

return function(p1)
	-- upvalues: RoduxModule (copy), PlayabilityByGameIdModule (copy), ProductInfoByGameIdModule (copy), ByGameIdModule (copy), MediaByGameIdModule (copy)
	return RoduxModule.combineReducers({
		playabilityByGameId = PlayabilityByGameIdModule(p1),
		productInfoByGameId = ProductInfoByGameIdModule(p1),
		byGameId = ByGameIdModule(p1),
		mediaByGameId = MediaByGameIdModule(p1)
	})
end