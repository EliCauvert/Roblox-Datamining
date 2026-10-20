local UserModel = require(script:FindFirstAncestor("GameTile").Parent.UserLib).Models.UserModel
local config = {
	[UserModel.PresenceType.IN_GAME] = 3,
	[UserModel.PresenceType.ONLINE] = 2,
	[UserModel.PresenceType.IN_STUDIO] = 1,
	[UserModel.PresenceType.OFFLINE] = 0
}

local function _(p1, p2): boolean
	return typeof(p1) == "number" and typeof(p2) == "number" and p1 ~= p2
end

local _ = function(p1)
	-- upvalues: config (copy), UserModel (copy)
	local Entry = if p1 and p1.presence then config[p1.presence] else nil
	
	if Entry == nil then
		Entry = config[UserModel.PresenceType.OFFLINE]
	end
	return Entry
end

return function(p1)
	-- upvalues: config (copy), UserModel (copy)
	return function(p2, p3): boolean
		-- upvalues: config (upval), UserModel (upval), p1 (copy)
		local Entry = if p2 and p2.presence then config[p2.presence] else nil
		
		if Entry == nil then
			Entry = config[UserModel.PresenceType.OFFLINE]
		end
		local Entry1 = Entry
		local Entry2 = if p3 and p3.presence then config[p3.presence] else nil
		
		if Entry2 == nil then
			Entry2 = config[UserModel.PresenceType.OFFLINE]
		end
		local Entry21 = Entry2
		
		if Entry1 ~= Entry21 then
			return Entry21 < Entry1
		end
		if p2.presence ~= UserModel.PresenceType.OFFLINE then
			local LastOnline = p2.lastOnline
			local LastOnline1 = p3.lastOnline
			
			if typeof(LastOnline) == "number" and (typeof(LastOnline1) == "number" and LastOnline ~= LastOnline1) then
				return p3.lastOnline < p2.lastOnline
			end
		end
		return (p2[p1] or ""):lower() < (p3[p1] or ""):lower()
	end
end