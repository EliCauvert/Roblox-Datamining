local Modules = game:GetService("CoreGui").RobloxGui.Modules
local _ = require(Modules.AvatarExperience.Common.Types)
local ConstantsModule = require(Modules.AvatarExperience.Common.Constants)
local SortResultsModule = {
	new = function()
		return { items = {} }
	end
}

function SortResultsModule.mock()
	-- upvalues: SortResultsModule (copy), ConstantsModule (copy)
	local NewSortResults = SortResultsModule.new()
	NewSortResults.items = { { id = "123", type = ConstantsModule.ItemType.Asset } }
	NewSortResults.keyword = ""
	NewSortResults.previousPageCursor = ""
	NewSortResults.nextPageCursor = ""
	
	return NewSortResults
end

function SortResultsModule.fromSearchItemsDetails(p1)
	-- upvalues: SortResultsModule (copy)
	local NewSortResults = SortResultsModule.new()
	NewSortResults.items = {}
	
	for _, entry in p1.data do
		table.insert(NewSortResults.items, {
			id = tostring(entry.id),
			type = entry.itemType,
			productId = tostring(entry.productId)
		})
	end
	NewSortResults.keyword = p1.keyword
	NewSortResults.previousPageCursor = p1.previousPageCursor
	NewSortResults.nextPageCursor = p1.nextPageCursor
	
	return NewSortResults
end

return SortResultsModule