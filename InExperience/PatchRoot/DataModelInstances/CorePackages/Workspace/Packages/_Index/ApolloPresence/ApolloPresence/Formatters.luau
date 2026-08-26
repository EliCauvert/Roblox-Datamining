local parent = script:FindFirstAncestor("ApolloPresence").Parent
local cryoModule = require(parent.Cryo)
local presenceType = require(parent.GraphQLServer).types.PresenceType
local t = {
	[presenceType.Offline] = 0,
	[presenceType.Online] = 1,
	[presenceType.InGame] = 2,
	[presenceType.InStudio] = 3
}
local var1 = cryoModule.List.foldLeft(cryoModule.Dictionary.keys(t), function(p1, p2)
	-- upvalues: t (ref)
	p1[tostring(t[p2])] = p2
	
	return p1
end, {})

local function _(p1)
	return if p1 then tostring(p1) else ""
end

return {
	formatNumberToPresenceType = function(p1)
		-- upvalues: var1 (ref), presenceType (ref)
		return if p1 then var1[tostring(p1)] else presenceType.Offline
	end,
	formatPresenceTypeToNumber = function(p1)
		-- upvalues: t (ref), presenceType (ref)
		return if p1 then t[p1] else t[presenceType.Offline]
	end,
	formatUserPresence = function(p1)
		-- upvalues: var1 (ref), presenceType (ref)
		local userPresenceType
		local t = { id = p1.id }
		
		if p1.userPresenceType then
			userPresenceType = p1.userPresenceType
		else
			local userPresenceNumber = p1.userPresenceNumber
			userPresenceType = if userPresenceNumber then var1[tostring(userPresenceNumber)] else presenceType.Offline
		end
		t.userPresenceType = userPresenceType
		t.lastLocation = p1.lastLocation or ""
		t.lastOnline = p1.lastOnline or ""
		local gameId = p1.gameId
		t.gameId = if gameId then tostring(gameId) else ""
		local placeId = p1.placeId
		t.placeId = if placeId then tostring(placeId) else ""
		local rootPlaceId = p1.rootPlaceId
		t.rootPlaceId = if rootPlaceId then tostring(rootPlaceId) else ""
		local universeId = p1.universeId
		t.universeId = if universeId then tostring(universeId) else ""
		
		return t
	end
}