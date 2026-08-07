local byUserIdModule = require(script.Presence.byUserId)
local byGameIdModule = require(script.Presence.byGameId)
local byGameInstanceIdModule = require(script.Presence.byGameInstanceId)
local byPlaceIdModule = require(script.Presence.byPlaceId)

return function(p0) --[[ line: 6 ]]
	-- upvalues: byUserIdModule (ref), byGameInstanceIdModule (ref), byGameIdModule (ref), byPlaceIdModule (ref)
	return function(p1, p2) --[[ line: 7 ]]
		-- upvalues: byUserIdModule (copy), p0 (ref), byGameInstanceIdModule (copy), byGameIdModule (copy), byPlaceIdModule (copy)
		p1 = p1 or {
			byUserId = {},
			byGameInstanceId = {},
			byGameId = {},
			byPlaceId = {}
		}
		
		return {
			byUserId = byUserIdModule(p0)(p1.byUserId, p2),
			byGameInstanceId = byGameInstanceIdModule(p0)(p1, p2),
			byGameId = byGameIdModule(p0)(p1, p2),
			byPlaceId = byPlaceIdModule(p0)(p1, p2)
		}
	end
end