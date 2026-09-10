local isHomeSortDetailSortIncludedModule = require(script:FindFirstAncestor("Home").HomeSortDetailPage.isHomeSortDetailSortIncluded)

local function _(p1)
	return typeof(p1) == "string" and p1 ~= ""
end

return function(p1)
	-- upvalues: isHomeSortDetailSortIncludedModule (ref)
	local t = {}
	
	if typeof(p1) ~= "table" then
		return t
	end
	local entryOrder = p1.entry_order
	local entryMap = p1.entry_map
	
	if typeof(entryOrder) ~= "table" or typeof(entryMap) ~= "table" then
		return t
	end
	for i, v in entryOrder do
		local var1 = entryMap[v]
		local var2 = if typeof(var1) == "table" then var1.input_data else nil
		local var3 = if typeof(var2) == "table" then var2.kind else nil
		local var4 = if typeof(var3) == "table" then var3.value else nil
		local var5 = if typeof(var4) == "table" then var4.sort_id else nil
		local var6 = if typeof(var4) == "table" then var4.title else nil
		local var7 = if typeof(var1) == "table" then var1.roblox_component else nil
		
		if (typeof(v) == "string" and v ~= "") and (typeof(var5) == "string" and var5 ~= "") and ((typeof(var6) == "string" and var6 ~= "") and (typeof(var7) == "string" and var7 ~= "")) and isHomeSortDetailSortIncludedModule(var5, if typeof(var3) == "table" then var3.type else nil) then
			table.insert(t, {
				topicId = tostring(var5),
				displayName = var6,
				entryIdentifier = v,
				storeIndex = i
			})
		end
	end
	return t
end