local list = { "-inf", "-inf", "inf", "inf" }
local list_1 = { 0, 0 }
local list_2 = { 0, 0, 0, 0 }

local function _(value)
	return if value >= 0 then math.floor(value * 100000 + 0.5) / 100000 else math.ceil(value * 100000 - 0.5) / 100000
end

local function applyNumericPrecision(p1)
	-- upvalues: applyNumericPrecision (ref)
	if typeof(p1) == "number" then
		return if p1 >= 0 then math.floor(p1 * 100000 + 0.5) / 100000 else math.ceil(p1 * 100000 - 0.5) / 100000
	elseif typeof(p1) ~= "table" then
		return p1
	end
	local t = {}
	
	for i, v in p1 do
		t[i] = applyNumericPrecision(v)
	end
	return t
end

local function toVectorCode(p2)
	local p1Count = #p2
	
	if p1Count ~= 2 and p1Count ~= 4 then
		return nil
	elseif p1Count == 4 and p2[1] == "-inf" and (p2[2] == "-inf" and p2[3] == "inf") and p2[4] == "inf" then
		return 0
	end
	for i, v in p2 do
		if typeof(v) ~= "number" or v ~= 0 then
			return nil
		end
	end
	return if p1Count == 2 then 1 else 2
end

local _ = function(p3, p4)
	local var1 = "s_"
	local var2 = typeof(p4)
	
	if var2 == "boolean" then
		var1 = "b_"
	end
	if var2 == "number" then
		var1 = if p4 % 1 == 0 then "i_" else "n_"
	end
	if var2 == "table" then
		var1 = "v_"
	end
	return var1 .. p2
end

local function compressPackedProperties(p3)
	local var1 = 0
	
	for i, v in p3 do
		if v ~= "" then
			var1 = i
		end
	end
	if var1 == 0 then
		return ""
	end
	local t = {}
	local var2 = 1
	while var2 <= var1 do
		if p3[var2] ~= "" then
			table.insert(t, p3[var2])
			var2 += 1
			continue
		end
		local var3 = var2
		while var3 <= var1 and p3[var3] == "" do
			var3 += 1
		end
		local var4 = var3 - var2
		
		if var4 > 2 then
			table.insert(t, "-" .. tostring(var4))
		else
			for _ = 1, var4 do
				table.insert(t, "")
			end
		end
		var2 = var3
	end
	return table.concat(t, ",")
end

local function collectSchema(p4)
	local t = {}
	
	local function collectProperties(p5)
		-- upvalues: t (ref), collectProperties (ref)
		for i, v in p5.Properties do
			if v ~= nil then
				local var5 = t
				local var6 = "s_"
				local var7 = typeof(v)
				
				if var7 == "boolean" then
					var6 = "b_"
				end
				if var7 == "number" then
					var6 = if v % 1 == 0 then "i_" else "n_"
				end
				if var7 == "table" then
					var6 = "v_"
				end
				var5[var6 .. i] = true
			end
		end
		for i_1, v in p5.Children do
			collectProperties(v)
		end
	end
	
	collectProperties(p4)
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

return function(p6)
	-- upvalues: collectSchema (ref), list (ref), list_1 (ref), list_2 (ref), toVectorCode (ref), applyNumericPrecision (ref), compressPackedProperties (ref)
	local var8, var9 = collectSchema(p6)
	local t = {}
	local t_1 = { [0] = list, [1] = list_1, [2] = list_2 }
	local var10 = 3
	
	local function serializeMappingValue(p7)
		-- upvalues: serializeMappingValue (ref)
		local var11 = typeof(p7)
		
		if var11 == "nil" then
			return "nil"
		elseif var11 == "boolean" then
			return if p7 then "b:1" else "b:0"
		elseif var11 == "number" then
			return "n:" .. tostring(p7)
		elseif var11 == "string" then
			return "s:" .. p8
		elseif var11 ~= "table" then
			return var11 .. ":" .. tostring(p7)
		end
		local p8Count = #p7
		local list = table.create(p8Count)
		
		for i = 1, p8Count do
			list[i] = serializeMappingValue(p7[i])
		end
		local t = {}
		
		for i_1, v in p7 do
			if typeof(i_1) ~= "number" or i_1 < 1 or (p8Count < i_1 or i_1 % 1 ~= 0) then
				table.insert(t, serializeMappingValue(i_1) .. "=" .. serializeMappingValue(v))
			end
		end
		table.sort(t)
		
		return "t:[" .. table.concat(list, ",") .. "]{" .. table.concat(t, ",") .. "}"
	end
	
	local function mapValue(p8)
		-- upvalues: toVectorCode (copy), serializeMappingValue (ref), t (ref), t_1 (ref), var10 (write)
		if typeof(p8) == "table" then
			local var12 = toVectorCode(p8)
			
			if var12 ~= nil then
				return var12
			end
		end
		local var13 = serializeMappingValue(p8)
		local var14 = t[var13]
		
		if var14 ~= nil then
			return var14
		end
		while t_1[var10] ~= nil do
			var10 += 1
		end
		local var15 = var10
		var10 += 1
		t[var13] = var15
		t_1[var15] = p8
		
		return var15
	end
	
	local function encodeProperties(p9)
		-- upvalues: var8 (ref), var9 (ref), mapValue (ref), applyNumericPrecision (copy), compressPackedProperties (copy)
		local t = {}
		
		for i = 1, #var8 do
			t[i] = ""
		end
		for i_1, v in p9 do
			if v ~= nil then
				local var16 = "s_"
				local var17 = typeof(v)
				
				if var17 == "boolean" then
					var16 = "b_"
				end
				if var17 == "number" then
					var16 = if v % 1 == 0 then "i_" else "n_"
				end
				if var17 == "table" then
					var16 = "v_"
				end
				var16 = var9[var16 .. i_1]
				
				if var16 ~= nil then
					t[var16] = tostring(mapValue(applyNumericPrecision(v)))
				end
			end
		end
		return compressPackedProperties(t)
	end
	
	local t_2 = {}
	local var18 = 1
	
	local function appendNode(p10, p11)
		-- upvalues: var18 (write), encodeProperties (ref), t_2 (ref), appendNode (ref)
		var18 += 1
		local t = {
			id = var18,
			parentId = p11,
			p = encodeProperties(p10.Properties)
		}
		local id = `{t.id},{t.parentId}`
		
		if t.p ~= "" then
			id ..= `,{t.p}`
		end
		table.insert(t_2, id)
		
		for i, v in p10.Children do
			appendNode(v, var18)
		end
	end
	
	local var19 = encodeProperties(p6.Properties)
	local var20 = "0,-1"
	
	if var19 ~= "" then
		var20 ..= `,{var19}`
	end
	table.insert(t_2, var20)
	
	for i, v in p6.Children do
		appendNode(v, 0)
	end
	return {
		mappings = t_1,
		root = table.concat(t_2, "\n"),
		schema = var8
	}
end