local userModel = require(script:FindFirstAncestor("GameTile").Parent.UserLib).Models.UserModel
local t = {
	[userModel.PresenceType.IN_GAME] = 3,
	[userModel.PresenceType.ONLINE] = 2,
	[userModel.PresenceType.IN_STUDIO] = 1,
	[userModel.PresenceType.OFFLINE] = 0
}

local function _(p1, p2)
	return typeof(p1) == "number" and (typeof(p2) == "number" and p1 ~= p2)
end

local _ = function(p1)
	-- upvalues: t (ref), userModel (ref)
	local var1 = if p1 and p1.presence then t[p1.presence] else nil
	
	if var1 == nil then
		var1 = t[userModel.PresenceType.OFFLINE]
	end
	return var1
end

return function(p1)
	-- upvalues: t (ref), userModel (ref)
	return function(p2, p3)
		-- upvalues: t (copy), userModel (copy), p1 (ref)
		local var1 = if p2 and p2.presence then t[p2.presence] else nil
		
		if var1 == nil then
			var1 = t[userModel.PresenceType.OFFLINE]
		end
		local var2 = if p3 and p3.presence then t[p3.presence] else nil
		
		if var2 == nil then
			var2 = t[userModel.PresenceType.OFFLINE]
		end
		if var1 ~= var2 then
			return var2 < var1
		elseif p2.presence ~= userModel.PresenceType.OFFLINE then
			local lastOnline = p2.lastOnline
			local lastOnline_1 = p3.lastOnline
			
			return if typeof(lastOnline) == "number" and (typeof(lastOnline_1) == "number" and lastOnline ~= lastOnline_1) then p3.lastOnline < p2.lastOnline else (p2[p1] or ""):lower() < (p3[p1] or ""):lower()
		end
	end
end