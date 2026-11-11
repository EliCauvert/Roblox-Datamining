local FFlagAXRemoveExpiredItemsFromInventory = require(script:FindFirstAncestor("AvatarExperienceCommon").Parent.AvatarExperienceFlags).FFlagAXRemoveExpiredItemsFromInventory

return function(p1): boolean
	-- upvalues: FFlagAXRemoveExpiredItemsFromInventory (copy)
	if FFlagAXRemoveExpiredItemsFromInventory then
		local _DateTime = DateTime.fromIsoDate(p1)
		
		return if _DateTime then _DateTime.UnixTimestamp <= DateTime.now().UnixTimestamp else false
	else
		return false
	end
end