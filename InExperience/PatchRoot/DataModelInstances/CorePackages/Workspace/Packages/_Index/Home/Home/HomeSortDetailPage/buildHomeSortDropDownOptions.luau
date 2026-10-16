local IsHomeSortDetailSortIncludedModule = require(script:FindFirstAncestor("Home").HomeSortDetailPage.isHomeSortDetailSortIncluded)

local function _(p1): boolean --[[ Line: 12 | Named "isValidString" ]]
	return typeof(p1) == "string" and p1 ~= ""
end

return function(p1) --[[ Line: 16 | Named "buildHomeSortDropDownOptions" ]]
	-- upvalues: IsHomeSortDetailSortIncludedModule (copy)
	local List = {}
	
	if typeof(p1) ~= "table" then
		return List
	end
	local EntryOrder = p1.entry_order
	local EntryMap = p1.entry_map
	
	if typeof(EntryOrder) ~= "table" or typeof(EntryMap) ~= "table" then
		return List
	end
	for StoreIndex, EntryIdentifier in EntryOrder do
		local Entry = EntryMap[EntryIdentifier]
		local InputData = if typeof(Entry) == "table" then Entry.input_data else nil
		local Kind = if typeof(InputData) == "table" then InputData.kind else nil
		local Value = if typeof(Kind) == "table" then Kind.value else nil
		local SortId = if typeof(Value) == "table" then Value.sort_id else nil
		local Title = if typeof(Value) == "table" then Value.title else nil
		local RobloxComponent = if typeof(Entry) == "table" then Entry.roblox_component else nil
		
		if typeof(EntryIdentifier) == "string" and EntryIdentifier ~= "" and (typeof(SortId) == "string" and SortId ~= "") and (typeof(Title) == "string" and Title ~= "") and (typeof(RobloxComponent) == "string" and RobloxComponent ~= "") and IsHomeSortDetailSortIncludedModule(SortId, if typeof(Kind) == "table" then Kind.type else nil) then
			table.insert(List, {
				topicId = tostring(SortId),
				displayName = Title,
				entryIdentifier = EntryIdentifier,
				storeIndex = StoreIndex
			})
		end
	end
	return List
end