local byUserIdModule = require(script.Presence.byUserId)
local byGameIdModule = require(script.Presence.byGameId)
local byGameInstanceIdModule = require(script.Presence.byGameInstanceId)
local byPlaceIdModule = require(script.Presence.byPlaceId)

return function(p1)
	-- upvalues: byUserIdModule (ref), byGameInstanceIdModule (ref), byGameIdModule (ref), byPlaceIdModule (ref)
	return function(p2, p3)
		-- upvalues: byUserIdModule (copy), p1 (ref), byGameInstanceIdModule (copy), byGameIdModule (copy), byPlaceIdModule (copy)
		p2 = p2 or {
			byUserId = {},
			byGameInstanceId = {},
			byGameId = {},
			byPlaceId = {}
		}
		
		return {
			byUserId = byUserIdModule(p1)(p2.byUserId, p3),
			byGameInstanceId = byGameInstanceIdModule(p1)(p2, p3),
			byGameId = byGameIdModule(p1)(p2, p3),
			byPlaceId = byPlaceIdModule(p1)(p2, p3)
		}
	end
end