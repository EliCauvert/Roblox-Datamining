local list = { "-inf", "-inf", "inf", "inf" }
local list1 = { 0, 0 }
local list2 = { 0, 0, 0, 0 }

local function _(p1: number): number --[[ Line: 20 | Named "roundToDecimalPrecision" ]]
	return if p1 >= 0 then math.floor(p1 * 100000 + 0.5) / 100000 else math.ceil(p1 * 100000 - 0.5) / 100000
end

local function applyNumericPrecision(List: number) --[[ Line: 28 ]]
	-- upvalues: applyNumericPrecision (copy)
	if typeof(List) == "number" then
		return if List >= 0 then math.floor(List * 100000 + 0.5) / 100000 else math.ceil(List * 100000 - 0.5) / 100000
	end
	if typeof(List) ~= "table" then
		return List
	end
	local t = {}
	
	for i, value in List do
		t[i] = applyNumericPrecision(value)
	end
	return t
end

local function toVectorCode(Entry): number? --[[ Line: 42 ]]
	local CountEntry = #Entry
	
	if CountEntry ~= 2 and CountEntry ~= 4 then
		return nil
	end
	if CountEntry == 4 and Entry[1] == "-inf" and Entry[2] == "-inf" and Entry[3] == "inf" and Entry[4] == "inf" then
		return 0
	end
	for _, value in Entry do
		if typeof(value) ~= "number" or value ~= 0 then
			return nil
		end
	end
	return if CountEntry == 2 then 1 else 2
end

local _ = function(Text, p1: number): string --[[ Line: 62 | Named "getSchemaName" ]]
	local I = "s_"
	local ValueType = typeof(p1)
	
	if ValueType == "boolean" then
		I = "b_"
	end
	if ValueType == "number" then
		I = if p1 % 1 == 0 then "i_" else "n_"
	end
	if ValueType == "table" then
		I = "v_"
	end
	return I .. Text
end

local function compressPackedProperties(List): string --[[ Line: 83 ]]
	local v1 = 0
	
	for i, value in List do
		if value ~= "" then
			v1 = i
		end
	end
	if v1 == 0 then
		return ""
	end
	local List1 = {}
	local Count = 1
	while Count <= v1 do
		if List[Count] ~= "" then
			table.insert(List1, List[Count])
			Count += 1
			continue
		end
		local Count1: number = Count
		while Count1 <= v1 and List[Count1] == "" do
			Count1 += 1
		end
		local CountDelta = Count1 - Count
		
		if CountDelta > 2 then
			table.insert(List1, "-" .. tostring(CountDelta))
		else
			for _ = 1, CountDelta do
				table.insert(List1, "")
			end
		end
		Count = Count1
	end
	return table.concat(List1, ",")
end

local function collectSchema(p1) --[[ Line: 120 ]]
	local t = {}
	
	local function collectProperties(p2) --[[ Line: 123 ]]
		-- upvalues: t (copy), collectProperties (copy)
		for i, property in p2.Properties do
			if property ~= nil then
				local I = "s_"
				local ValueType = typeof(property)
				
				if ValueType == "boolean" then
					I = "b_"
				end
				if ValueType == "number" then
					I = if property % 1 == 0 then "i_" else "n_"
				end
				if ValueType == "table" then
					I = "v_"
				end
				t[I .. i] = true
			end
		end
		for _, child in p2.Children do
			collectProperties(child)
		end
	end
	
	collectProperties(p1)
	local List = {}
	
	for i, _ in t do
		table.insert(List, i)
	end
	table.sort(List)
	local t1 = {}
	
	for i1, value in List do
		t1[value] = i1
	end
	return List, t1
end

return function(p3) --[[ Line: 151 | Named "compactDataModelPayload" ]]
	-- upvalues: collectSchema (copy), list (copy), list1 (copy), list2 (copy), toVectorCode (copy), applyNumericPrecision (copy), compressPackedProperties (copy)
	local CollectSchemaResult, CollectSchemaResult2 = collectSchema(p3)
	local t = {}
	local Mappings = { [0] = list, [1] = list1, [2] = list2 }
	local Count = 3
	
	local function serializeMappingValue(List): string --[[ Line: 162 ]]
		-- upvalues: serializeMappingValue (copy)
		local ValueType = typeof(List)
		
		if ValueType == "nil" then
			return "nil"
		end
		if ValueType == "boolean" then
			return if List then "b:1" else "b:0"
		end
		if ValueType == "number" then
			return "n:" .. tostring(List)
		end
		if ValueType == "string" then
			return "s:" .. List
		end
		if ValueType ~= "table" then
			return ValueType .. ":" .. tostring(List)
		end
		local CountList = #List
		local Buffer = table.create(CountList)
		
		for i = 1, CountList do
			Buffer[i] = serializeMappingValue(List[i])
		end
		local List1 = {}
		
		for i1, value in List do
			if typeof(i1) ~= "number" or i1 < 1 or CountList < i1 or i1 % 1 ~= 0 then
				table.insert(List1, serializeMappingValue(i1) .. "=" .. serializeMappingValue(value))
			end
		end
		table.sort(List1)
		
		return "t:[" .. table.concat(Buffer, ",") .. "]{" .. table.concat(List1, ",") .. "}"
	end
	
	local function mapValue(p4) --[[ Line: 191 ]]
		-- upvalues: toVectorCode (upval), serializeMappingValue (copy), t (copy), Mappings (copy), Count (ref)
		if typeof(p4) == "table" then
			local VectorCode = toVectorCode(p4)
			
			if VectorCode ~= nil then
				return VectorCode
			end
		end
		local SerializeMappingValueResult = serializeMappingValue(p4)
		local Entry = t[SerializeMappingValueResult]
		
		if Entry ~= nil then
			return Entry
		end
		while Mappings[Count] ~= nil do
			Count += 1
		end
		local Count1: number = Count
		Count += 1
		t[SerializeMappingValueResult] = Count1
		Mappings[Count1] = p4
		
		return Count1
	end
	
	local function encodeProperties(Properties) --[[ Line: 216 ]]
		-- upvalues: CollectSchemaResult (copy), CollectSchemaResult2 (copy), mapValue (copy), applyNumericPrecision (upval), compressPackedProperties (upval)
		local t = {}
		
		for i = 1, #CollectSchemaResult do
			t[i] = ""
		end
		for i1, property in Properties do
			if property ~= nil then
				local I = "s_"
				local ValueType = typeof(property)
				
				if ValueType == "boolean" then
					I = "b_"
				end
				if ValueType == "number" then
					I = if property % 1 == 0 then "i_" else "n_"
				end
				if ValueType == "table" then
					I = "v_"
				end
				local CollectSchemaResultEntry = CollectSchemaResult2[I .. i1]
				
				if CollectSchemaResultEntry ~= nil then
					t[CollectSchemaResultEntry] = tostring((mapValue((applyNumericPrecision(property)))))
				end
			end
		end
		return compressPackedProperties(t)
	end
	
	local List = {}
	local Count1 = 1
	
	local function appendNode(p5, ParentId) --[[ Line: 236 ]]
		-- upvalues: Count1 (ref), encodeProperties (copy), List (copy), appendNode (copy)
		local Id: number = Count1
		Count1 += 1
		local config = {
			id = Id,
			parentId = ParentId,
			p = encodeProperties(p5.Properties)
		}
		local Text: string = `{config.id},{config.parentId}`
		
		if config.p ~= "" then
			Text ..= `,{config.p}`
		end
		table.insert(List, Text)
		
		for _, child in p5.Children do
			appendNode(child, Id)
		end
	end
	
	local EncodePropertiesResult = encodeProperties(p3.Properties)
	local Text = "0,-1"
	
	if EncodePropertiesResult ~= "" then
		Text ..= `,{EncodePropertiesResult}`
	end
	table.insert(List, Text)
	
	for _, child in p3.Children do
		appendNode(child, 0)
	end
	return {
		mappings = Mappings,
		root = table.concat(List, "\n"),
		schema = CollectSchemaResult
	}
end