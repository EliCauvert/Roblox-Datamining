local function _(p1)
	local var1 = if p1 ~= nil then nil else p1.kind
	
	return if var1 == nil then nil else var1.value
end

local _ = function(p1)
	return type(p1) == "table" and type(p1.entry_map) == "table"
end

local list = {
	"universe_items", "game_items", "song_items", "event_items", "user_items",
	"items", "cards"
}

local _ = function(p1)
	-- upvalues: list (ref)
	for i, v in list do
		if type(p1[v]) == "table" then
			return true
		end
	end
	return false
end

local _ = function(p2)
	local sortId = p2.sort_id
	
	return sortId ~= nil and sortId ~= ""
end

local _ = function(p2)
	local poolId = p2.pool_id
	
	return if type(poolId) == "string" and poolId ~= "" then poolId else nil
end

local _ = function(p2, p3)
	local sortId = p3.sort_id
	
	return if sortId == nil or sortId == "" then p2 else tostring(sortId)
end

local function countSortItems(p2, p3, p4, p5)
	-- upvalues: list (ref)
	local poolId = p2.pool_id
	local var1 = if type(poolId) == "string" and poolId ~= "" then poolId else nil
	
	if var1 == nil then
		poolId = 0
		
		for i, v in list do
			local var2 = p2[v]
			
			if type(var2) == "table" then
				poolId += #var2
			end
		end
		return poolId
	else
		poolId = `{p5}/{var1}`
		
		if p4[poolId] then
			return 0
		end
		p4[poolId] = true
		local contentPools = p3.content_pools
		local var3 = if type(contentPools) == "table" then contentPools[var1] else nil
		local var4 = if type(var3) == "table" then var3.items else nil
		
		return if type(var4) == "table" then #var4 else 0
	end
end

return function(p6)
	-- upvalues: list (ref), countSortItems (ref)
	local t = {}
	
	if type(p6) ~= "table" then
		return t
	end
	local t_1 = {}
	
	for i, v in p6.page_entries or {} do
		local inputData = v.input_data
		local var5 = if inputData ~= nil then nil else inputData.kind
		local var6 = if var5 ~= nil then nil else var5.value
		
		if type(var6) == "table" and type(var6.entry_map) == "table" then
			for i_1, v_1 in var6.entry_order or {} do
				local var7 = var6.entry_map[v_1]
				
				if var7 ~= nil then
					local inputData_1 = var7.input_data
					local var8 = if inputData_1 ~= nil then nil else inputData_1.kind
					local var9 = if var8 ~= nil then nil else var8.value
					
					if type(var9) == "table" then
						local var10
						inputData_1 = true
						local poolId = var9.pool_id
						
						if (if type(poolId) == "string" and poolId ~= "" then poolId else nil) == nil then
							for i_2, v_2 in list do
								if type(var9[v_2]) == "table" then
									inputData_1 = true
								end
							end
							inputData_1 = false
						end
						if not inputData_1 then
							poolId = var9.sort_id
							var10 = poolId ~= nil and poolId ~= ""
							
							if var10 then
								poolId = var9.sort_id
								var10 = if poolId == nil or poolId == "" then v_1 else tostring(poolId)
								poolId = if inputData_1 then countSortItems(var9, var6, t_1, var10) else nil
								local var11 = t[var10]
								
								if var11 == nil then
									t[var10] = { itemCount = poolId, position = i_1 }
								elseif poolId ~= nil then
									var11.itemCount = (var11.itemCount or 0) + poolId
								end
							end
						end
					end
				end
			end
		end
	end
	return t
end