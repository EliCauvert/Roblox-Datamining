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

local _ = function(p0)
	-- upvalues: presenceType (ref)
	local userPresenceType = p0.userPresenceType
	
	return if (userPresenceType == presenceType.InGame or userPresenceType == presenceType.InStudio) and #(p0.lastLocation or "") == 0 then presenceType.Online.rawValue() else userPresenceType.rawValue()
end

local _ = function(p1)
	-- upvalues: userModel (ref)
	local presence = p1.presence
	
	return if (presence == userModel.PresenceType.IN_GAME or presence == userModel.PresenceType.IN_STUDIO) and #(p1.lastLocation or "") == 0 then userModel.PresenceType.ONLINE else presence
end

local _ = function(p2)
	-- upvalues: presenceType (ref), t (ref), t_1 (ref)
	local userPresenceType = p2.userPresenceType
	local var3 = if (userPresenceType == presenceType.InGame or userPresenceType == presenceType.InStudio) and #(p2.lastLocation or "") == 0 then presenceType.Online.rawValue() else userPresenceType.rawValue()
	
	return if t.number(var3) then t_1[var3] else t_1[presenceType.Offline]
end

local _ = function(p3)
	-- upvalues: userModel (ref), t (ref), t_2 (ref)
	local presence = p3.presence
	local var4 = if (presence == userModel.PresenceType.IN_GAME or presence == userModel.PresenceType.IN_STUDIO) and #(p3.lastLocation or "") == 0 then userModel.PresenceType.ONLINE else presence
	
	return if t.string(var4) then t_2[var4] else t_2[userModel.PresenceType.OFFLINE]
end

local _ = function(p4, p5)
	-- upvalues: presenceType (ref), t (ref), t_1 (ref), userModel (ref), t_2 (ref)
	local userPresenceType
	local var5 = 0
	local var6 = 0
	
	if p4.userPresenceType and p5.userPresenceType then
		userPresenceType = p4.userPresenceType
		local var7 = if (userPresenceType == presenceType.InGame or userPresenceType == presenceType.InStudio) and #(p4.lastLocation or "") == 0 then presenceType.Online.rawValue() else userPresenceType.rawValue()
		var5 = if t.number(var7) then t_1[var7] else t_1[presenceType.Offline]
		userPresenceType = p5.userPresenceType
		local var8 = if (userPresenceType == presenceType.InGame or userPresenceType == presenceType.InStudio) and #(p5.lastLocation or "") == 0 then presenceType.Online.rawValue() else userPresenceType.rawValue()
		
		if t.number(var8) then
			var6 = t_1[var8]
			
			if var6 then
				return var5, var6
			else
				var6 = t_1[presenceType.Offline]
				
				return var5, var6
			end
		end
	elseif p4.presence and p5.presence then
		userPresenceType = p4.presence
		local var9 = if (userPresenceType == userModel.PresenceType.IN_GAME or userPresenceType == userModel.PresenceType.IN_STUDIO) and #(p4.lastLocation or "") == 0 then userModel.PresenceType.ONLINE else userPresenceType
		var5 = if t.string(var9) then t_2[var9] else t_2[userModel.PresenceType.OFFLINE]
		userPresenceType = p5.presence
		local var10 = if (userPresenceType == userModel.PresenceType.IN_GAME or userPresenceType == userModel.PresenceType.IN_STUDIO) and #(p5.lastLocation or "") == 0 then userModel.PresenceType.ONLINE else userPresenceType
		var6 = if t.string(var10) then t_2[var10] else t_2[userModel.PresenceType.OFFLINE]
	end
end

local _ = function(p6, p7)
	return p6.username or (p6.name or ""), p7.username or (p7.name or "")
end

return function(p8, p9)
	-- upvalues: presenceType (ref), t (ref), t_1 (ref), userModel (ref), t_2 (ref)
	local presence
	local var11 = 0
	local var12 = 0
	
	if p8.userPresenceType and p9.userPresenceType then
		presence = p8.userPresenceType
		local var15 = if (presence == presenceType.InGame or presence == presenceType.InStudio) and #(p8.lastLocation or "") == 0 then presenceType.Online.rawValue() else presence.rawValue()
		var11 = if t.number(var15) then t_1[var15] else t_1[presenceType.Offline]
		presence = p9.userPresenceType
		local var16 = if (presence == presenceType.InGame or presence == presenceType.InStudio) and #(p9.lastLocation or "") == 0 then presenceType.Online.rawValue() else presence.rawValue()
		var12 = if t.number(var16) then t_1[var16] else t_1[presenceType.Offline]
	elseif p8.presence and p9.presence then
		presence = p8.presence
		local var13 = if (presence == userModel.PresenceType.IN_GAME or presence == userModel.PresenceType.IN_STUDIO) and #(p8.lastLocation or "") == 0 then userModel.PresenceType.ONLINE else presence
		var11 = if t.string(var13) then t_2[var13] else t_2[userModel.PresenceType.OFFLINE]
		presence = p9.presence
		local var14 = if (presence == userModel.PresenceType.IN_GAME or presence == userModel.PresenceType.IN_STUDIO) and #(p9.lastLocation or "") == 0 then userModel.PresenceType.ONLINE else presence
		var12 = if t.string(var14) then t_2[var14] else t_2[userModel.PresenceType.OFFLINE]
	end
	if var11 ~= var12 then
		return var12 < var11
	end
	local var17 = if t.number(p8.friendRank) then p8.friendRank else 0
	local var18 = if t.number(p9.friendRank) then p9.friendRank else 0
	
	if var17 ~= var18 then
		return var17 < var18
	end
	local var19 = if t.string(p8.displayName) then p8.displayName else ""
	presence = if t.string(p9.displayName) then p9.displayName else ""
	
	return if string.lower(var19) == string.lower(presence) then string.lower(p8.username or (p8.name or "")) < string.lower(p9.username or (p9.name or "")) else string.lower(var19) < string.lower(presence)
end