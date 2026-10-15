local gifting = script:FindFirstAncestor("Gifting")
local itemTypeModule = require(gifting.Enums.ItemType)
local _ = require(gifting.Types)

return {
	buildItemGiftabilityKey = function(p1)
		return `{p1.itemType}:{p1.itemId}`
	end,
	parseItemGiftabilityKey = function(p1)
		-- upvalues: itemTypeModule (ref)
		local matchIndex = string.find(p1, ":", 1, true)
		
		if matchIndex == nil then
			return nil
		end
		local var1 = itemTypeModule.fromValue(string.sub(p1, 1, matchIndex - 1))
		
		if var1 == nil or var1 == itemTypeModule.Invalid then
			return nil
		end
		local substring = string.sub(p1, matchIndex + 1)
		
		return if substring == "" then nil else { itemType = var1, itemId = substring }
	end
}