local AvatarExperienceInspectAndBuy = script:FindFirstAncestor("AvatarExperienceInspectAndBuy")
local _ = require(AvatarExperienceInspectAndBuy.Types)
local _ = require(AvatarExperienceInspectAndBuy.Parent.AvatarExperienceRodux)
local BuildItemDataFromAXRoduxModule = require(AvatarExperienceInspectAndBuy.Utils.buildItemDataFromAXRodux)

return function(p1, List)
	-- upvalues: BuildItemDataFromAXRoduxModule (copy)
	local List1 = {}
	
	if not p1 or not List then
		return List1
	end
	for _, value in List do
		local ItemDataFromAXRoduxModule = BuildItemDataFromAXRoduxModule(p1, value.itemId, value.itemType)
		
		if ItemDataFromAXRoduxModule then
			table.insert(List1, {
				itemData = ItemDataFromAXRoduxModule,
				isEquipped = value.selectedInTryOnManager == true,
				ordering = value.itemRecency or 0
			})
		end
	end
	table.sort(List1, function(A, B): boolean
		return if A.ordering == B.ordering then if A.itemData.id == B.itemData.id then tostring(A.itemData.itemType) < tostring(B.itemData.itemType) else tostring(A.itemData.id) < tostring(B.itemData.id) else A.ordering < B.ordering
	end)
	
	return List1
end