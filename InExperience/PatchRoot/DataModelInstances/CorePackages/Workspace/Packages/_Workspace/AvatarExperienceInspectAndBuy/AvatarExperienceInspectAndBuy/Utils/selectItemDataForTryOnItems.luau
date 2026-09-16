local avatarExperienceInspectAndBuy = script:FindFirstAncestor("AvatarExperienceInspectAndBuy")
local _ = require(avatarExperienceInspectAndBuy.Types)
local _ = require(avatarExperienceInspectAndBuy.Parent.AvatarExperienceRodux)
local buildItemDataFromAXRoduxModule = require(avatarExperienceInspectAndBuy.Utils.buildItemDataFromAXRodux)

return function(p1, p2)
	-- upvalues: buildItemDataFromAXRoduxModule (ref)
	local t = {}
	
	if not p1 or not p2 then
		return t
	end
	for i, v in p2 do
		local var1 = buildItemDataFromAXRoduxModule(p1, v.itemId, v.itemType)
		
		if var1 then
			table.insert(t, {
				itemData = var1,
				isEquipped = v.selectedInTryOnManager == true,
				ordering = v.itemRecency or 0
			})
		end
	end
	table.sort(t, function(p3, p4)
		return if p3.ordering == p4.ordering then if p3.itemData.id == p4.itemData.id then tostring(p3.itemData.itemType) < tostring(p4.itemData.itemType) else tostring(p3.itemData.id) < tostring(p4.itemData.id) else p3.ordering < p4.ordering
	end)
	
	return t
end