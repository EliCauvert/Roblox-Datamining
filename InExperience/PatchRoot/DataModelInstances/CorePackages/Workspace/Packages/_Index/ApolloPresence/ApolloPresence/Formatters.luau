local Parent = script:FindFirstAncestor("ApolloPresence").Parent
local CryoModule = require(Parent.Cryo)
local PresenceType = require(Parent.GraphQLServer).types.PresenceType
local config = {
	[PresenceType.Offline] = 0,
	[PresenceType.Online] = 1,
	[PresenceType.InGame] = 2,
	[PresenceType.InStudio] = 3
}
local FoldLeftResult = CryoModule.List.foldLeft(CryoModule.Dictionary.keys(config), function(p1, p2) --[[ Line: 18 ]]
	-- upvalues: config (copy)
	p1[tostring(config[p2])] = p2
	
	return p1
end, {})

local function _(p1): string --[[ Line: 23 | Named "convertToStringWithDefault" ]]
	return if p1 then tostring(p1) else ""
end

return {
	formatNumberToPresenceType = function(p1) --[[ Line: 27 ]]
		-- upvalues: FoldLeftResult (copy), PresenceType (copy)
		return p1 and FoldLeftResult[tostring(p1)] or PresenceType.Offline
	end,
	formatPresenceTypeToNumber = function(p1) --[[ Line: 31 ]]
		-- upvalues: config (copy), PresenceType (copy)
		return p1 and config[p1] or config[PresenceType.Offline]
	end,
	formatUserPresence = function(p1) --[[ Line: 58 ]]
		-- upvalues: FoldLeftResult (copy), PresenceType (copy)
		local config = { id = p1.id }
		local UserPresenceType = nil
		
		if p1.userPresenceType then
			UserPresenceType = p1.userPresenceType
		else
			local UserPresenceNumber = p1.userPresenceNumber
			UserPresenceType = UserPresenceNumber and FoldLeftResult[tostring(UserPresenceNumber)] or PresenceType.Offline
		end
		config.userPresenceType = UserPresenceType
		config.lastLocation = p1.lastLocation or ""
		config.lastOnline = p1.lastOnline or ""
		local GameId = p1.gameId
		config.gameId = if GameId then tostring(GameId) else ""
		local PlaceId = p1.placeId
		config.placeId = if PlaceId then tostring(PlaceId) else ""
		local RootPlaceId = p1.rootPlaceId
		config.rootPlaceId = if RootPlaceId then tostring(RootPlaceId) else ""
		local UniverseId = p1.universeId
		config.universeId = if UniverseId then tostring(UniverseId) else ""
		
		return config
	end
}