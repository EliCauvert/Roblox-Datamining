local presenceTypeModule = require(script.Parent.Enums.PresenceType)
local t = {
	[0] = presenceTypeModule.Offline,
	[1] = presenceTypeModule.Online,
	[2] = presenceTypeModule.InGame,
	[3] = presenceTypeModule.InStudio
}

local function _(p0)
	return if p0 == nil then "" else tostring(p0)
end

local function mapRawPresenceTypeToEnum(p1)
	-- upvalues: t (ref), presenceTypeModule (ref)
	return if type(p1) == "number" then t[p1] or presenceTypeModule.Offline elseif type(p1) == "string" and (p1 == "Offline" or p1 == "Online" or (p1 == "InGame" or p1 == "InStudio")) then p1 elseif p1 == presenceTypeModule.Offline or p1 == presenceTypeModule.Online or (p1 == presenceTypeModule.InGame or p1 == presenceTypeModule.InStudio) then p1 else presenceTypeModule.Offline
end

return function(p2, p3)
	-- upvalues: mapRawPresenceTypeToEnum (ref)
	local var3 = if p2 then p2.userId else p3
	
	if p2 and type(p2) == "table" and var3 then
		local t = {
			id = tostring(var3),
			userPresenceType = mapRawPresenceTypeToEnum(p2.userPresenceType)
		}
		local lastLocation = p2.lastLocation
		t.lastLocation = if lastLocation == nil then "" else tostring(lastLocation)
		t.lastOnline = p2.lastOnline
		local gameId = p2.gameId
		t.gameId = if gameId == nil then "" else tostring(gameId)
		local placeId = p2.placeId
		t.placeId = if placeId == nil then "" else tostring(placeId)
		local rootPlaceId = p2.rootPlaceId
		t.rootPlaceId = if rootPlaceId == nil then "" else tostring(rootPlaceId)
		local universeId = p2.universeId
		t.universeId = if universeId == nil then "" else tostring(universeId)
		
		return t
	end
	return nil
end