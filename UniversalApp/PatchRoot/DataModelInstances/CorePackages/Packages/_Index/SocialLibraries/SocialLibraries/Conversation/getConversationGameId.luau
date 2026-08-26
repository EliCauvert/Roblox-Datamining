local userModel = require(script:FindFirstAncestor("SocialLibraries").dependencies).UserModel

return function(p1, p2, p3)
	-- upvalues: userModel (ref)
	if p1.pinnedGame and p1.pinnedGame.universeId then
		return tostring(p1.pinnedGame.universeId)
	end
	local t = {}
	
	for i, v in pairs(p1.participants or {}) do
		local var1 = p3[v]
		
		if var1 ~= nil and v ~= p2 and (var1.presence == userModel.PresenceType.IN_GAME and var1.rootPlaceId) then
			t[var1.rootPlaceId] = t[var1.rootPlaceId] or 0
			t[var1.rootPlaceId] += 1
		end
	end
	local var2 = nil
	local var3 = 0
	
	for i_1, v_1 in pairs(t) do
		if var3 < v_1 then
			var2 = i_1
			var3 = v_1
		end
	end
	return var2 and tostring(var2) or nil
end