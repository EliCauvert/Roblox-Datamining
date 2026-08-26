local fFlagAXRemoveExpiredItemsFromInventory = require(script:FindFirstAncestor("AvatarExperienceCommon").Parent.AvatarExperienceFlags).FFlagAXRemoveExpiredItemsFromInventory

return function(p1)
	-- upvalues: fFlagAXRemoveExpiredItemsFromInventory (ref)
	if not fFlagAXRemoveExpiredItemsFromInventory then
		return false
	end
	local dateTime = DateTime.fromIsoDate(p1)
	
	return if dateTime then dateTime.UnixTimestamp <= DateTime.now().UnixTimestamp else false
end