local function valuesEqual(Key, Key1, Keys): boolean --[[ Line: 12 ]]
	-- upvalues: valuesEqual (copy)
	if Key == Key1 then
		return true
	end
	if type(Key) ~= "table" or type(Key1) ~= "table" then
		return false
	end
	local Keys1 = Keys or {}
	
	if Keys1[Key] == Key1 then
		return true
	end
	Keys1[Key] = Key1
	
	for i, value in Key do
		if not valuesEqual(value, Key1[i], Keys1) then
			return false
		end
	end
	for i1 in Key1 do
		if Key[i1] == nil then
			return false
		end
	end
	return true
end

local function itemContentsEqual(List, List1): boolean --[[ Line: 39 ]]
	-- upvalues: valuesEqual (copy)
	for i, value in List do
		if i ~= "position" and not valuesEqual(value, List1[i]) then
			return false
		end
	end
	for i1 in List1 do
		if i1 ~= "position" and List[i1] == nil then
			return false
		end
	end
	return true
end

return {
	build = function(p1, p2) --[[ Line: 61 ]]
		-- upvalues: itemContentsEqual (copy)
		local T = if p2 == nil then {} else p2.items
		local T1 = if p2 == nil then {} else p2.byKey
		local Buffer = table.create(#p1)
		local ByKey = {}
		local v1 = false
		
		for i = #p1, 1, -1 do
			local v2 = p1[i]
			local StableKey = v2.stable_key
			
			if ByKey[StableKey] == nil then
				local Entry = T1[StableKey]
				
				if Entry ~= nil and itemContentsEqual(Entry, v2) then
					v2 = Entry
				end
				table.insert(Buffer, v2)
				ByKey[StableKey] = v2
				v1 = v1 or T[#Buffer] ~= v2
			end
		end
		return if p2 == nil or v1 or #Buffer ~= #T then { items = Buffer, byKey = ByKey } else p2
	end,
	getKey = function(p3) --[[ Line: 8 ]]
		return p3.stable_key
	end
}