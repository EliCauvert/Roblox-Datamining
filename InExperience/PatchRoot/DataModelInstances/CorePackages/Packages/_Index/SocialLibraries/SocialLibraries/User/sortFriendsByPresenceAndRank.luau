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

local _ = function(p1)
	-- upvalues: t (ref), t_1 (ref), presenceType (ref)
	return if t.number(p1) then t_1[p1] else t_1[presenceType.Offline]
end

local _ = function(p1)
	-- upvalues: t (ref), t_2 (ref), userModel (ref)
	return if t.string(p1) then t_2[p1] else t_2[userModel.PresenceType.OFFLINE]
end

local var1 = function(p1, p2)
	-- upvalues: t (ref), t_1 (ref), presenceType (ref), t_2 (ref), userModel (ref)
	local var2 = 0
	local var3 = 0
	
	if p1.userPresenceType and p2.userPresenceType then
		local var4 = p1.userPresenceType.rawValue()
		var2 = if t.number(var4) then t_1[var4] else t_1[presenceType.Offline]
		local var5 = p2.userPresenceType.rawValue()
		
		if t.number(var5) then
			var3 = t_1[var5]
			
			if var3 then
				return var2, var3
			else
				var3 = t_1[presenceType.Offline]
				
				return var2, var3
			end
		end
	elseif p1.presence and p2.presence then
		local presence = p1.presence
		var2 = if t.string(presence) then t_2[presence] else t_2[userModel.PresenceType.OFFLINE]
		local presence_1 = p2.presence
		var3 = if t.string(presence_1) then t_2[presence_1] else t_2[userModel.PresenceType.OFFLINE]
	end
end

local _ = function(p1, p2)
	return p1.username or (p1.name or ""), p2.username or (p2.name or "")
end

return function(p1, p2)
	-- upvalues: var1 (ref), t (ref)
	local var2, var3 = var1(p1, p2)
	
	if var2 ~= var3 then
		return var3 < var2
	end
	local var4 = if t.number(p1.friendRank) then p1.friendRank else 0
	local var5 = if t.number(p2.friendRank) then p2.friendRank else 0
	
	if var4 ~= var5 then
		return var4 < var5
	end
	local var6 = if t.string(p1.displayName) then p1.displayName else ""
	local var7 = if t.string(p2.displayName) then p2.displayName else ""
	
	return if string.lower(var6) == string.lower(var7) then string.lower(p1.username or (p1.name or "")) < string.lower(p2.username or (p2.name or "")) else string.lower(var6) < string.lower(var7)
end