local ByUserIdModule = require(script.Presence.byUserId)
local ByGameIdModule = require(script.Presence.byGameId)
local ByGameInstanceIdModule = require(script.Presence.byGameInstanceId)
local ByPlaceIdModule = require(script.Presence.byPlaceId)

return function(p1) --[[ Line: 6 ]]
	-- upvalues: ByUserIdModule (copy), ByGameInstanceIdModule (copy), ByGameIdModule (copy), ByPlaceIdModule (copy)
	return function(p2, p3) --[[ Line: 7 ]]
		-- upvalues: ByUserIdModule (upval), p1 (copy), ByGameInstanceIdModule (upval), ByGameIdModule (upval), ByPlaceIdModule (upval)
		local P1 = p2 or {
			byUserId = {},
			byGameInstanceId = {},
			byGameId = {},
			byPlaceId = {}
		}
		
		return {
			byUserId = ByUserIdModule(p1)(P1.byUserId, p3),
			byGameInstanceId = ByGameInstanceIdModule(p1)(P1, p3),
			byGameId = ByGameIdModule(p1)(P1, p3),
			byPlaceId = ByPlaceIdModule(p1)(P1, p3)
		}
	end
end