-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:31:08 2026 Pacific Standard Time.

local roduxModule = require(script:FindFirstAncestor("RoduxGames").Parent.Rodux)
local playabilityByGameIdModule = require(script.Games.playabilityByGameId)
local productInfoByGameIdModule = require(script.Games.productInfoByGameId)
local byGameIdModule = require(script.Games.byGameId)
local mediaByGameIdModule = require(script.Games.mediaByGameId)

return function(p0) --[[ line: 9 ]]
	-- upvalues: roduxModule (ref), playabilityByGameIdModule (ref), productInfoByGameIdModule (ref), byGameIdModule (ref), mediaByGameIdModule (ref)
	return roduxModule.combineReducers({
		playabilityByGameId = playabilityByGameIdModule(p0),
		productInfoByGameId = productInfoByGameIdModule(p0),
		byGameId = byGameIdModule(p0),
		mediaByGameId = mediaByGameIdModule(p0)
	})
end