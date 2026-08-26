local presenceTypeModule = require(script.Parent.Enums.PresenceType)
local t = {
	[0] = presenceTypeModule.Offline,
	[1] = presenceTypeModule.Online,
	[2] = presenceTypeModule.InGame,
	[3] = presenceTypeModule.InStudio
}

local function _(p1)
	return if p1 == nil then "" else tostring(p1)
end

local function mapRawPresenceTypeToEnum(p1)
	-- upvalues: t (ref), presenceTypeModule (ref)
	return if type(p1) == "number" then t[p1] or presenceTypeModule.Offline elseif type(p1) == "string" and (p1 == "Offline" or p1 == "Online" or (p1 == "InGame" or p1 == "InStudio")) then p1 elseif p1 == presenceTypeModule.Offline or p1 == presenceTypeModule.Online or (p1 == presenceTypeModule.InGame or p1 == presenceTypeModule.InStudio) then p1 else presenceTypeModule.Offline
end

return function(p1, p2)
	-- upvalues: mapRawPresenceTypeToEnum (ref)
	local var1 = if p1 then p1.userId else p2
	
	if p1 and type(p1) == "table" and var1 then
		local t = {
			id = tostring(var1),
			userPresenceType = mapRawPresenceTypeToEnum(p1.userPresenceType)
		}
		local lastLocation = p1.lastLocation
		t.lastLocation = if lastLocation == nil then "" else tostring(lastLocation)
		t.lastOnline = p1.lastOnline
		local gameId = p1.gameId
		t.gameId = if gameId == nil then "" else tostring(gameId)
		local placeId = p1.placeId
		t.placeId = if placeId == nil then "" else tostring(placeId)
		local rootPlaceId = p1.rootPlaceId
		t.rootPlaceId = if rootPlaceId == nil then "" else tostring(rootPlaceId)
		local universeId = p1.universeId
		t.universeId = if universeId == nil then "" else tostring(universeId)
		
		return t
	end
	return nil
end