-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:32:24 2026 Pacific Standard Time.

local userModel = require(script:FindFirstAncestor("SocialLibraries").dependencies).UserModel

return function(p0, p1, p2) --[[ line: 7 ]]
	-- upvalues: userModel (ref)
	if p0.pinnedGame and p0.pinnedGame.universeId then
		return tostring(p0.pinnedGame.universeId)
	end
	local t = {}
	
	for i, v in pairs(p0.participants or {}) do
		local var3 = p2[v]
		
		if var3 ~= nil and v ~= p1 and (var3.presence == userModel.PresenceType.IN_GAME and var3.rootPlaceId) then
			t[var3.rootPlaceId] = t[var3.rootPlaceId] or 0
			t[var3.rootPlaceId] += 1
		end
	end
	local var1 = nil
	local var2 = 0
	
	for i_1, v_1 in pairs(t) do
		if var2 < v_1 then
			var1 = i_1
			var2 = v_1
		end
	end
	return var1 and tostring(var1) or nil
end