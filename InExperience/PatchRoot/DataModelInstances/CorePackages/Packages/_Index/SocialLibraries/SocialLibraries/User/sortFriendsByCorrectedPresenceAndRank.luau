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
	-- upvalues: presenceType (ref)
	local userPresenceType = p1.userPresenceType
	
	return if (userPresenceType == presenceType.InGame or userPresenceType == presenceType.InStudio) and #(p1.lastLocation or "") == 0 then presenceType.Online.rawValue() else userPresenceType.rawValue()
end

local _ = function(p1)
	-- upvalues: userModel (ref)
	local presence = p1.presence
	
	return if (presence == userModel.PresenceType.IN_GAME or presence == userModel.PresenceType.IN_STUDIO) and #(p1.lastLocation or "") == 0 then userModel.PresenceType.ONLINE else presence
end

local _ = function(p1)
	-- upvalues: presenceType (ref), t (ref), t_1 (ref)
	local userPresenceType = p1.userPresenceType
	local var1 = if (userPresenceType == presenceType.InGame or userPresenceType == presenceType.InStudio) and #(p1.lastLocation or "") == 0 then presenceType.Online.rawValue() else userPresenceType.rawValue()
	
	return if t.number(var1) then t_1[var1] else t_1[presenceType.Offline]
end

local _ = function(p1)
	-- upvalues: userModel (ref), t (ref), t_2 (ref)
	local presence = p1.presence
	local var1 = if (presence == userModel.PresenceType.IN_GAME or presence == userModel.PresenceType.IN_STUDIO) and #(p1.lastLocation or "") == 0 then userModel.PresenceType.ONLINE else presence
	
	return if t.string(var1) then t_2[var1] else t_2[userModel.PresenceType.OFFLINE]
end

local _ = function(p1, p2)
	-- upvalues: presenceType (ref), t (ref), t_1 (ref), userModel (ref), t_2 (ref)
	local userPresenceType
	local var1 = 0
	local var2 = 0
	
	if p1.userPresenceType and p2.userPresenceType then
		userPresenceType = p1.userPresenceType
		local var3 = if (userPresenceType == presenceType.InGame or userPresenceType == presenceType.InStudio) and #(p1.lastLocation or "") == 0 then presenceType.Online.rawValue() else userPresenceType.rawValue()
		var1 = if t.number(var3) then t_1[var3] else t_1[presenceType.Offline]
		userPresenceType = p2.userPresenceType
		local var4 = if (userPresenceType == presenceType.InGame or userPresenceType == presenceType.InStudio) and #(p2.lastLocation or "") == 0 then presenceType.Online.rawValue() else userPresenceType.rawValue()
		
		if t.number(var4) then
			var2 = t_1[var4]
			
			if var2 then
				return var1, var2
			else
				var2 = t_1[presenceType.Offline]
				
				return var1, var2
			end
		end
	elseif p1.presence and p2.presence then
		userPresenceType = p1.presence
		local var5 = if (userPresenceType == userModel.PresenceType.IN_GAME or userPresenceType == userModel.PresenceType.IN_STUDIO) and #(p1.lastLocation or "") == 0 then userModel.PresenceType.ONLINE else userPresenceType
		var1 = if t.string(var5) then t_2[var5] else t_2[userModel.PresenceType.OFFLINE]
		userPresenceType = p2.presence
		local var6 = if (userPresenceType == userModel.PresenceType.IN_GAME or userPresenceType == userModel.PresenceType.IN_STUDIO) and #(p2.lastLocation or "") == 0 then userModel.PresenceType.ONLINE else userPresenceType
		var2 = if t.string(var6) then t_2[var6] else t_2[userModel.PresenceType.OFFLINE]
	end
end

local _ = function(p1, p2)
	return p1.username or (p1.name or ""), p2.username or (p2.name or "")
end

return function(p1, p2)
	-- upvalues: presenceType (ref), t (ref), t_1 (ref), userModel (ref), t_2 (ref)
	local presence
	local var1 = 0
	local var2 = 0
	
	if p1.userPresenceType and p2.userPresenceType then
		presence = p1.userPresenceType
		local var3 = if (presence == presenceType.InGame or presence == presenceType.InStudio) and #(p1.lastLocation or "") == 0 then presenceType.Online.rawValue() else presence.rawValue()
		var1 = if t.number(var3) then t_1[var3] else t_1[presenceType.Offline]
		presence = p2.userPresenceType
		local var4 = if (presence == presenceType.InGame or presence == presenceType.InStudio) and #(p2.lastLocation or "") == 0 then presenceType.Online.rawValue() else presence.rawValue()
		var2 = if t.number(var4) then t_1[var4] else t_1[presenceType.Offline]
	elseif p1.presence and p2.presence then
		presence = p1.presence
		local var5 = if (presence == userModel.PresenceType.IN_GAME or presence == userModel.PresenceType.IN_STUDIO) and #(p1.lastLocation or "") == 0 then userModel.PresenceType.ONLINE else presence
		var1 = if t.string(var5) then t_2[var5] else t_2[userModel.PresenceType.OFFLINE]
		presence = p2.presence
		local var6 = if (presence == userModel.PresenceType.IN_GAME or presence == userModel.PresenceType.IN_STUDIO) and #(p2.lastLocation or "") == 0 then userModel.PresenceType.ONLINE else presence
		var2 = if t.string(var6) then t_2[var6] else t_2[userModel.PresenceType.OFFLINE]
	end
	if var1 ~= var2 then
		return var2 < var1
	end
	local var7 = if t.number(p1.friendRank) then p1.friendRank else 0
	local var8 = if t.number(p2.friendRank) then p2.friendRank else 0
	
	if var7 ~= var8 then
		return var7 < var8
	end
	local var9 = if t.string(p1.displayName) then p1.displayName else ""
	presence = if t.string(p2.displayName) then p2.displayName else ""
	
	return if string.lower(var9) == string.lower(presence) then string.lower(p1.username or (p1.name or "")) < string.lower(p2.username or (p2.name or "")) else string.lower(var9) < string.lower(presence)
end