local Parent = script:FindFirstAncestor("GameInvite").Parent
local _ = require(Parent.FriendsMenu)
local UserModel = require(Parent.UserLib).Models.UserModel

local function _(p1, p2): boolean
	-- upvalues: UserModel (copy)
	if p2 == "" or p2 == "0" then
		return false
	else
		local Text = if p1.universeId == nil then nil else tostring(p1.universeId)
		
		return p1.presence == UserModel.PresenceType.IN_GAME and Text == p2
	end
end

return function(List, p1)
	-- upvalues: UserModel (copy)
	local Buffer = table.create(#List)
	
	for _, value in List do
		local v1 = nil
		if p1 == "" or p1 == "0" then
			v1 = false
		else
			local Text = if value.universeId == nil then nil else tostring(value.universeId)
			v1 = value.presence == UserModel.PresenceType.IN_GAME and Text == p1
		end
		if v1 then
			table.insert(Buffer, value)
		else
			local Copy = table.clone(value)
			Copy.presence = UserModel.PresenceType.OFFLINE
			Copy.lastLocation = ""
			table.insert(Buffer, Copy)
		end
	end
	return Buffer
end