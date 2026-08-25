local roduxModule = require(script:FindFirstAncestor("RoduxGames").Parent.Rodux)
local playabilityByGameIdModule = require(script.Games.playabilityByGameId)
local productInfoByGameIdModule = require(script.Games.productInfoByGameId)
local byGameIdModule = require(script.Games.byGameId)
local mediaByGameIdModule = require(script.Games.mediaByGameId)

return function(p0)
	-- upvalues: roduxModule (ref), playabilityByGameIdModule (ref), productInfoByGameIdModule (ref), byGameIdModule (ref), mediaByGameIdModule (ref)
	return roduxModule.combineReducers({
		playabilityByGameId = playabilityByGameIdModule(p0),
		productInfoByGameId = productInfoByGameIdModule(p0),
		byGameId = byGameIdModule(p0),
		mediaByGameId = mediaByGameIdModule(p0)
	})
end