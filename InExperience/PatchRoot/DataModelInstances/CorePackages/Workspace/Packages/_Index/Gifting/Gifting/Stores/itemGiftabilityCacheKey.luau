local Gifting = script:FindFirstAncestor("Gifting")
local ItemTypeModule = require(Gifting.Enums.ItemType)
local _ = require(Gifting.Types)

return {
	buildItemGiftabilityKey = function(p1): string --[[ Line: 13 ]]
		return `{p1.itemType}:{p1.itemId}`
	end,
	parseItemGiftabilityKey = function(Text: string) --[[ Line: 21 ]]
		-- upvalues: ItemTypeModule (copy)
		local FoundAt: number? = string.find(Text, ":", 1, true)
		
		if FoundAt == nil then
			return nil
		end
		local FromValueResult = ItemTypeModule.fromValue((string.sub(Text, 1, FoundAt - 1)))
		
		if FromValueResult == nil or FromValueResult == ItemTypeModule.Invalid then
			return nil
		else
			local Segment = string.sub(Text, FoundAt + 1)
			
			return if Segment == "" then nil else { itemType = FromValueResult, itemId = Segment }
		end
	end
}