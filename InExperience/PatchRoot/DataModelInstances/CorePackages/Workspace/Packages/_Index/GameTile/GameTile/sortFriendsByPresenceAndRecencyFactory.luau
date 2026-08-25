local userModel = require(script:FindFirstAncestor("GameTile").Parent.UserLib).Models.UserModel
local t = {
	[userModel.PresenceType.IN_GAME] = 3,
	[userModel.PresenceType.ONLINE] = 2,
	[userModel.PresenceType.IN_STUDIO] = 1,
	[userModel.PresenceType.OFFLINE] = 0
}

local function _(p0, p1)
	return typeof(p0) == "number" and (typeof(p1) == "number" and p0 ~= p1)
end

local _ = function(p2)
	-- upvalues: t (ref), userModel (ref)
	local var1 = if p2 and p2.presence then t[p2.presence] else nil
	
	if var1 == nil then
		var1 = t[userModel.PresenceType.OFFLINE]
	end
	return var1
end

return function(p3)
	-- upvalues: t (ref), userModel (ref)
	return function(p4, p5)
		-- upvalues: t (copy), userModel (copy), p3 (ref)
		local var2 = if p4 and p4.presence then t[p4.presence] else nil
		
		if var2 == nil then
			var2 = t[userModel.PresenceType.OFFLINE]
		end
		local var3 = if p5 and p5.presence then t[p5.presence] else nil
		
		if var3 == nil then
			var3 = t[userModel.PresenceType.OFFLINE]
		end
		if var2 ~= var3 then
			return var3 < var2
		elseif p4.presence ~= userModel.PresenceType.OFFLINE then
			local lastOnline = p4.lastOnline
			local lastOnline_1 = p5.lastOnline
			
			return if typeof(lastOnline) == "number" and (typeof(lastOnline_1) == "number" and lastOnline ~= lastOnline_1) then p5.lastOnline < p4.lastOnline else (p4[p3] or ""):lower() < (p5[p3] or ""):lower()
		end
	end
end