local fFlagAXRemoveExpiredItemsFromInventory = require(script:FindFirstAncestor("AvatarExperienceCommon").Parent.AvatarExperienceFlags).FFlagAXRemoveExpiredItemsFromInventory

return function(p0)
	-- upvalues: fFlagAXRemoveExpiredItemsFromInventory (ref)
	if not fFlagAXRemoveExpiredItemsFromInventory then
		return false
	end
	local dateTime = DateTime.fromIsoDate(p0)
	
	return if dateTime then dateTime.UnixTimestamp <= DateTime.now().UnixTimestamp else false
end