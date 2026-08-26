local roduxModule = require(script:FindFirstAncestor("RoduxGames").Parent.Rodux)
local playabilityByGameIdModule = require(script.Games.playabilityByGameId)
local productInfoByGameIdModule = require(script.Games.productInfoByGameId)
local byGameIdModule = require(script.Games.byGameId)
local mediaByGameIdModule = require(script.Games.mediaByGameId)

return function(p1)
	-- upvalues: roduxModule (ref), playabilityByGameIdModule (ref), productInfoByGameIdModule (ref), byGameIdModule (ref), mediaByGameIdModule (ref)
	return roduxModule.combineReducers({
		playabilityByGameId = playabilityByGameIdModule(p1),
		productInfoByGameId = productInfoByGameIdModule(p1),
		byGameId = byGameIdModule(p1),
		mediaByGameId = mediaByGameIdModule(p1)
	})
end