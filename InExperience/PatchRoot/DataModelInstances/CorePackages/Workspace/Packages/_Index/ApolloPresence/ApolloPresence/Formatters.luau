local parent = script:FindFirstAncestor("ApolloPresence").Parent
local cryoModule = require(parent.Cryo)
local presenceType = require(parent.GraphQLServer).types.PresenceType
local t = {
	[presenceType.Offline] = 0,
	[presenceType.Online] = 1,
	[presenceType.InGame] = 2,
	[presenceType.InStudio] = 3
}
local var2 = cryoModule.List.foldLeft(cryoModule.Dictionary.keys(t), function(p0, p1) --[[ line: 18 ]]
	-- upvalues: t (ref)
	p0[tostring(t[p1])] = p1
	
	return p0
end, {})

local function _(p2) --[[ line: 23 | named "convertToStringWithDefault" ]]
	return if p2 then tostring(p2) else ""
end

return {
	formatNumberToPresenceType = function(p3) --[[ line: 27 ]]
		-- upvalues: var2 (ref), presenceType (ref)
		return if p3 then var2[tostring(p3)] else presenceType.Offline
	end,
	formatPresenceTypeToNumber = function(p4) --[[ line: 31 ]]
		-- upvalues: t (ref), presenceType (ref)
		return if p4 then t[p4] else t[presenceType.Offline]
	end,
	formatUserPresence = function(p5) --[[ line: 58 ]]
		-- upvalues: var2 (ref), presenceType (ref)
		local userPresenceType
		local t = { id = p5.id }
		
		if p5.userPresenceType then
			userPresenceType = p5.userPresenceType
		else
			local userPresenceNumber = p5.userPresenceNumber
			userPresenceType = if userPresenceNumber then var2[tostring(userPresenceNumber)] else presenceType.Offline
		end
		t.userPresenceType = userPresenceType
		t.lastLocation = p5.lastLocation or ""
		t.lastOnline = p5.lastOnline or ""
		local gameId = p5.gameId
		t.gameId = if gameId then tostring(gameId) else ""
		local placeId = p5.placeId
		t.placeId = if placeId then tostring(placeId) else ""
		local rootPlaceId = p5.rootPlaceId
		t.rootPlaceId = if rootPlaceId then tostring(rootPlaceId) else ""
		local universeId = p5.universeId
		t.universeId = if universeId then tostring(universeId) else ""
		
		return t
	end
}