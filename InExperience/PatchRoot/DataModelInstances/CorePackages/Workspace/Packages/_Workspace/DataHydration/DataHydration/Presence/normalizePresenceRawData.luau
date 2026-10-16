local PresenceTypeModule = require(script.Parent.Enums.PresenceType)
local config = {
	[0] = PresenceTypeModule.Offline,
	[1] = PresenceTypeModule.Online,
	[2] = PresenceTypeModule.InGame,
	[3] = PresenceTypeModule.InStudio
}

local function _(p1): string --[[ Line: 34 | Named "coerceStringField" ]]
	return if p1 == nil then "" else tostring(p1)
end

local function mapRawPresenceTypeToEnum(UserPresenceType) --[[ Line: 41 ]]
	-- upvalues: config (copy), PresenceTypeModule (copy)
	return if type(UserPresenceType) == "number" then config[UserPresenceType] or PresenceTypeModule.Offline elseif type(UserPresenceType) == "string" and (UserPresenceType == "Offline" or UserPresenceType == "Online" or UserPresenceType == "InGame" or UserPresenceType == "InStudio") then UserPresenceType elseif UserPresenceType == PresenceTypeModule.Offline or UserPresenceType == PresenceTypeModule.Online or UserPresenceType == PresenceTypeModule.InGame or UserPresenceType == PresenceTypeModule.InStudio then UserPresenceType else PresenceTypeModule.Offline
end

return function(p1, p2) --[[ Line: 61 | Named "fromApiPresenceTable" ]]
	-- upvalues: mapRawPresenceTypeToEnum (copy)
	local UserId = p1 and p1.userId or p2
	
	if p1 and type(p1) == "table" and UserId then
		local LastLocation = p1.lastLocation
		local Text: string = if LastLocation == nil then "" else tostring(LastLocation)
		local GameId = p1.gameId
		local Text1: string = if GameId == nil then "" else tostring(GameId)
		local PlaceId = p1.placeId
		local Text2: string = if PlaceId == nil then "" else tostring(PlaceId)
		local RootPlaceId = p1.rootPlaceId
		local Text3: string = if RootPlaceId == nil then "" else tostring(RootPlaceId)
		local UniverseId = p1.universeId
		
		return {
			id = tostring(UserId),
			userPresenceType = mapRawPresenceTypeToEnum(p1.userPresenceType),
			lastLocation = Text,
			lastOnline = p1.lastOnline,
			gameId = Text1,
			placeId = Text2,
			rootPlaceId = Text3,
			universeId = if UniverseId == nil then "" else tostring(UniverseId)
		}
	else
		return nil
	end
end