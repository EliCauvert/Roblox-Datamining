local function _(p1)
	local Kind = if p1 == nil then nil else p1.kind
	
	return if Kind == nil then nil else Kind.value
end

local _ = function(p1): boolean
	return type(p1) == "table" and type(p1.entry_map) == "table"
end

local list = {
	"universe_items", "game_items", "song_items", "event_items", "user_items",
	"items", "cards"
}

local _ = function(p1): boolean
	-- upvalues: list (copy)
	for _, value in list do
		if type(p1[value]) == "table" then
			return true
		end
	end
	return false
end

local _ = function(p2): boolean
	local SortId = p2.sort_id
	
	return SortId ~= nil and SortId ~= ""
end

local _ = function(p2)
	local PoolId = p2.pool_id
	
	return if type(PoolId) == "string" and PoolId ~= "" then PoolId else nil
end

local _ = function(p2, p3)
	local SortId = p3.sort_id
	
	return if SortId == nil or SortId == "" then p2 else tostring(SortId)
end

local function countSortItems(p2, p3, p4, p5): number
	-- upvalues: list (copy)
	local PoolId = p2.pool_id
	local PoolId1 = if type(PoolId) == "string" and PoolId ~= "" then PoolId else nil
	
	if PoolId1 == nil then
		local Total = 0
		
		for _, value in list do
			local v1 = p2[value]
			
			if type(v1) == "table" then
				Total += #v1
			end
		end
		return Total
	else
		local Text: string = `{p5}/{PoolId1}`
		
		if p4[Text] then
			return 0
		else
			p4[Text] = true
			local ContentPools = p3.content_pools
			local ContentPool = if type(ContentPools) == "table" then ContentPools[PoolId1] else nil
			local Items = if type(ContentPool) == "table" then ContentPool.items else nil
			
			return if type(Items) == "table" then #Items else 0
		end
	end
end

return function(p6)
	-- upvalues: list (copy), countSortItems (copy)
	local t = {}
	
	if type(p6) ~= "table" then
		return t
	end
	local t1 = {}
	local PageEntries = p6.page_entries or {}
	local Flag = nil
	for _, pageEntry in PageEntries do
		local InputData = pageEntry.input_data
		local Kind = if InputData == nil then nil else InputData.kind
		local Value = if Kind == nil then nil else Kind.value
		
		if type(Value) == "table" and type(Value.entry_map) == "table" then
			local EntryOrder = Value.entry_order or {}
			for Position, value in EntryOrder do
				local Entry = Value.entry_map[value]
				
				if Entry ~= nil then
					local InputData1 = Entry.input_data
					local Kind1 = if InputData1 == nil then nil else InputData1.kind
					local Value1 = if Kind1 == nil then nil else Kind1.value
					
					if type(Value1) == "table" then
						Flag = true
						local PoolId = Value1.pool_id
						
						if (if type(PoolId) == "string" and PoolId ~= "" then PoolId else nil) == nil then
							Flag = false
							
							for _, value1 in list do
								if type(Value1[value1]) == "table" then
									Flag = true
									break
								end
							end
						end
						local Flag1: boolean = Flag
						
						if not Flag1 then
							local SortId = Value1.sort_id
							Flag1 = SortId ~= nil and SortId ~= ""
						end
						if Flag1 then
							local SortId = Value1.sort_id
							local Value2 = if SortId == nil or SortId == "" then value else tostring(SortId)
							local CountSortItemsResult = if Flag then countSortItems(Value1, Value, t1, Value2) else nil
							local Entry1 = t[Value2]
							
							if Entry1 == nil then
								t[Value2] = { itemCount = CountSortItemsResult, position = Position }
							elseif CountSortItemsResult ~= nil then
								Entry1.itemCount = (Entry1.itemCount or 0) + CountSortItemsResult
							end
						end
					end
				end
			end
		end
	end
	return t
end