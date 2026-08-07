local list = { "-inf", "-inf", "inf", "inf" }
local list_1 = { 0, 0 }
local list_2 = { 0, 0, 0, 0 }

local function _(value) --[[ line: 20 | named "roundToDecimalPrecision" ]]
	return if value >= 0 then math.floor(value * 100000 + 0.5) / 100000 else math.ceil(value * 100000 - 0.5) / 100000
end

local function applyNumericPrecision(p0) --[[ line: 28 ]]
	-- upvalues: applyNumericPrecision (ref)
	if typeof(p0) == "number" then
		return if p0 >= 0 then math.floor(p0 * 100000 + 0.5) / 100000 else math.ceil(p0 * 100000 - 0.5) / 100000
	elseif typeof(p0) ~= "table" then
		return p0
	end
	local t = {}
	
	for i, v in p0 do
		t[i] = applyNumericPrecision(v)
	end
	return t
end

local function toVectorCode(p1) --[[ line: 42 ]]
	local p1Count = #p1
	
	if p1Count ~= 2 and p1Count ~= 4 then
		return nil
	elseif p1Count == 4 and p1[1] == "-inf" and (p1[2] == "-inf" and p1[3] == "inf") and p1[4] == "inf" then
		return 0
	end
	for i, v in p1 do
		if typeof(v) ~= "number" or v ~= 0 then
			return nil
		end
	end
	return if p1Count == 2 then 1 else 2
end

local _ = function(p2, p3) --[[ line: 62 | named "getSchemaName" ]]
	local var9 = "s_"
	local var10 = typeof(p3)
	
	if var10 == "boolean" then
		var9 = "b_"
	end
	if var10 == "number" then
		var9 = if p3 % 1 == 0 then "i_" else "n_"
	end
	if var10 == "table" then
		var9 = "v_"
	end
	return var9 .. p2
end

local function compressPackedProperties(p4) --[[ line: 83 ]]
	local var11 = 0
	
	for i, v in p4 do
		if v ~= "" then
			var11 = i
		end
	end
	if var11 == 0 then
		return ""
	end
	local t = {}
	local var13 = 1
	while var13 <= var11 do
		if p4[var13] ~= "" then
			table.insert(t, p4[var13])
			var13 += 1
			continue
		end
		local var14 = var13
		while var14 <= var11 and p4[var14] == "" do
			var14 += 1
		end
		local var15 = var14 - var13
		
		if var15 > 2 then
			table.insert(t, "-" .. tostring(var15))
		else
			for _ = 1, var15 do
				table.insert(t, "")
			end
		end
		var13 = var14
	end
	return table.concat(t, ",")
end

local function collectSchema(p5) --[[ line: 120 ]]
	local t = {}
	
	local function collectProperties(p6) --[[ line: 123 ]]
		-- upvalues: t (ref), collectProperties (ref)
		for i, v in p6.Properties do
			if v ~= nil then
				local var20 = t
				local var21 = "s_"
				local var22 = typeof(v)
				
				if var22 == "boolean" then
					var21 = "b_"
				end
				if var22 == "number" then
					var21 = if v % 1 == 0 then "i_" else "n_"
				end
				if var22 == "table" then
					var21 = "v_"
				end
				var20[var21 .. i] = true
			end
		end
		for i_1, v in p6.Children do
			collectProperties(v)
		end
	end
	
	collectProperties(p5)
	local t_1 = {}
	
	for i, v in t do
		table.insert(t_1, i)
	end
	table.sort(t_1)
	local t_2 = {}
	
	for i_1, v_1 in t_1 do
		t_2[v_1] = i_1
	end
	return t_1, t_2
end

return function(p7) --[[ line: 151 | named "compactDataModelPayload" ]]
	-- upvalues: collectSchema (ref), list (ref), list_1 (ref), list_2 (ref), toVectorCode (ref), applyNumericPrecision (ref), compressPackedProperties (ref)
	local var23, var24 = collectSchema(p7)
	local t = {}
	local t_1 = { [0] = list, [1] = list_1, [2] = list_2 }
	local var27 = 3
	
	local function serializeMappingValue(p8) --[[ line: 162 ]]
		-- upvalues: serializeMappingValue (ref)
		local var36 = typeof(p8)
		
		if var36 == "nil" then
			return "nil"
		elseif var36 == "boolean" then
			return if p8 then "b:1" else "b:0"
		elseif var36 == "number" then
			return "n:" .. tostring(p8)
		elseif var36 == "string" then
			return "s:" .. p8
		elseif var36 ~= "table" then
			return var36 .. ":" .. tostring(p8)
		end
		local p8Count = #p8
		local list = table.create(p8Count)
		
		for i = 1, p8Count do
			list[i] = serializeMappingValue(p8[i])
		end
		local t = {}
		
		for i_1, v in p8 do
			if typeof(i_1) ~= "number" or i_1 < 1 or (p8Count < i_1 or i_1 % 1 ~= 0) then
				table.insert(t, serializeMappingValue(i_1) .. "=" .. serializeMappingValue(v))
			end
		end
		table.sort(t)
		
		return "t:[" .. table.concat(list, ",") .. "]{" .. table.concat(t, ",") .. "}"
	end
	
	local function mapValue(p9) --[[ line: 191 ]]
		-- upvalues: toVectorCode (copy), serializeMappingValue (ref), t (ref), t_1 (ref), var27 (write)
		if typeof(p9) == "table" then
			local var40 = toVectorCode(p9)
			
			if var40 ~= nil then
				return var40
			end
		end
		local var41 = serializeMappingValue(p9)
		local var42 = t[var41]
		
		if var42 ~= nil then
			return var42
		end
		while t_1[var27] ~= nil do
			var27 += 1
		end
		local var43 = var27
		var27 += 1
		t[var41] = var43
		t_1[var43] = p9
		
		return var43
	end
	
	local function encodeProperties(p10) --[[ line: 216 ]]
		-- upvalues: var23 (ref), var24 (ref), mapValue (ref), applyNumericPrecision (copy), compressPackedProperties (copy)
		local t = {}
		
		for i = 1, #var23 do
			t[i] = ""
		end
		for i_1, v in p10 do
			if v ~= nil then
				local var45 = "s_"
				local var46 = typeof(v)
				
				if var46 == "boolean" then
					var45 = "b_"
				end
				if var46 == "number" then
					var45 = if v % 1 == 0 then "i_" else "n_"
				end
				if var46 == "table" then
					var45 = "v_"
				end
				var45 = var24[var45 .. i_1]
				
				if var45 ~= nil then
					t[var45] = tostring(mapValue(applyNumericPrecision(v)))
				end
			end
		end
		return compressPackedProperties(t)
	end
	
	local t_2 = {}
	local var32 = 1
	
	local function appendNode(p11, p12) --[[ line: 236 ]]
		-- upvalues: var32 (write), encodeProperties (ref), t_2 (ref), appendNode (ref)
		var32 += 1
		local t = {
			id = var32,
			parentId = p12,
			p = encodeProperties(p11.Properties)
		}
		local id = `{t.id},{t.parentId}`
		
		if t.p ~= "" then
			id ..= `,{t.p}`
		end
		table.insert(t_2, id)
		
		for i, v in p11.Children do
			appendNode(v, var32)
		end
	end
	
	local var34 = encodeProperties(p7.Properties)
	local var35 = "0,-1"
	
	if var34 ~= "" then
		var35 ..= `,{var34}`
	end
	table.insert(t_2, var35)
	
	for i, v in p7.Children do
		appendNode(v, 0)
	end
	return {
		mappings = t_1,
		root = table.concat(t_2, "\n"),
		schema = var23
	}
end