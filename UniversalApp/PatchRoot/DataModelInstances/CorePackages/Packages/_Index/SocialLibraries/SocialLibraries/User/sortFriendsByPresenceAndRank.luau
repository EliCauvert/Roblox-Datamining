local dependenciesModule = require(script:FindFirstAncestor("SocialLibraries").dependencies)
local roduxPresence = dependenciesModule.RoduxPresence
local userModel = dependenciesModule.UserModel
local t = dependenciesModule.t
local presenceType = roduxPresence.Enums.PresenceType
local _ = { InGame = 3, Online = 2, InStudio = 1, Offline = 0 }
local t_1 = {
	[presenceType.InGame.rawValue()] = 3,
	[presenceType.Online.rawValue()] = 2,
	[presenceType.InStudio.rawValue()] = 1,
	[presenceType.Offline.rawValue()] = 0
}
local t_2 = {
	[userModel.PresenceType.IN_GAME] = 3,
	[userModel.PresenceType.ONLINE] = 2,
	[userModel.PresenceType.IN_STUDIO] = 1,
	[userModel.PresenceType.OFFLINE] = 0
}

local _ = function(p0) --[[ line: 43 ]]
	-- upvalues: t (ref), t_1 (ref), presenceType (ref)
	return if t.number(p0) then t_1[p0] else t_1[presenceType.Offline]
end

local _ = function(p1) --[[ line: 48 ]]
	-- upvalues: t (ref), t_2 (ref), userModel (ref)
	return if t.string(p1) then t_2[p1] else t_2[userModel.PresenceType.OFFLINE]
end

local var3 = function(p2, p3) --[[ line: 53 ]]
	-- upvalues: t (ref), t_1 (ref), presenceType (ref), t_2 (ref), userModel (ref)
	local var4 = 0
	local var5 = 0
	
	if p2.userPresenceType and p3.userPresenceType then
		local var6 = p2.userPresenceType.rawValue()
		var4 = if t.number(var6) then t_1[var6] else t_1[presenceType.Offline]
		local var7 = p3.userPresenceType.rawValue()
		
		if t.number(var7) then
			var5 = t_1[var7]
			
			if var5 then
				return var4, var5
			else
				var5 = t_1[presenceType.Offline]
				
				return var4, var5
			end
		end
	elseif p2.presence and p3.presence then
		local presence = p2.presence
		var4 = if t.string(presence) then t_2[presence] else t_2[userModel.PresenceType.OFFLINE]
		local presence_1 = p3.presence
		var5 = if t.string(presence_1) then t_2[presence_1] else t_2[userModel.PresenceType.OFFLINE]
	end
end

local _ = function(p4, p5) --[[ line: 68 ]]
	return p4.username or (p4.name or ""), p5.username or (p5.name or "")
end

return function(p6, p7) --[[ line: 72 ]]
	-- upvalues: var3 (ref), t (ref)
	local var8, var9 = var3(p6, p7)
	
	if var8 ~= var9 then
		return var9 < var8
	end
	local var10 = if t.number(p6.friendRank) then p6.friendRank else 0
	local var11 = if t.number(p7.friendRank) then p7.friendRank else 0
	
	if var10 ~= var11 then
		return var10 < var11
	end
	local var12 = if t.string(p6.displayName) then p6.displayName else ""
	local var13 = if t.string(p7.displayName) then p7.displayName else ""
	
	return if string.lower(var12) == string.lower(var13) then string.lower(p6.username or (p6.name or "")) < string.lower(p7.username or (p7.name or "")) else string.lower(var12) < string.lower(var13)
end