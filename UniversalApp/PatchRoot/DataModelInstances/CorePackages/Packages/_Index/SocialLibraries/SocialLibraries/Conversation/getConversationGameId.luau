local UserModel = require(script:FindFirstAncestor("SocialLibraries").dependencies).UserModel

return function(p1, p2, p3) --[[ Line: 7 ]]
	-- upvalues: UserModel (copy)
	if p1.pinnedGame and p1.pinnedGame.universeId then
		return (tostring(p1.pinnedGame.universeId))
	end
	local t = {}
	local Iterator = pairs
	local Participants = p1.participants or {}
	for _, value in Iterator(Participants) do
		local v1 = p3[value]
		
		if v1 ~= nil and value ~= p2 and v1.presence == UserModel.PresenceType.IN_GAME and v1.rootPlaceId then
			t[v1.rootPlaceId] = t[v1.rootPlaceId] or 0
			t[v1.rootPlaceId] += 1
		end
	end
	local v2 = nil
	local v3 = 0
	
	for i, value1 in pairs(t) do
		if v3 < value1 then
			v2 = i
			v3 = value1
		end
	end
	return v2 and tostring(v2) or nil
end