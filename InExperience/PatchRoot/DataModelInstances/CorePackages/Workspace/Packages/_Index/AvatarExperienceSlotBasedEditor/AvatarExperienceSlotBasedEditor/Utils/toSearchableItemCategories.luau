local AvatarExperienceSlotBasedEditor = script:FindFirstAncestor("AvatarExperienceSlotBasedEditor")
local _ = require(AvatarExperienceSlotBasedEditor.Enums.InventorySearchItemType)
local _ = require(AvatarExperienceSlotBasedEditor.Types)
local SearchableSubtypesByItemType = require(AvatarExperienceSlotBasedEditor.InventorySearchConstants).SearchableSubtypesByItemType

return function(List)
	-- upvalues: SearchableSubtypesByItemType (copy)
	local List1 = {}
	
	for _, value in List do
		local Lowered = string.lower(value.itemType)
		local SearchableSubtypesByItemTypeEntry = SearchableSubtypesByItemType[Lowered]
		
		if SearchableSubtypesByItemTypeEntry and SearchableSubtypesByItemTypeEntry[value.itemSubType] then
			table.insert(List1, { itemType = Lowered, itemSubType = value.itemSubType })
		end
	end
	return List1
end