local function normalizeType(p1, p2)
	if type(p1) == p2 then
		return p1
	end
	return nil, `Type {p2} required, got {type(p1)}.`
end

local function prepareValuesForError(p1)
	local t = {}
	
	for i, v in p1 do
		table.insert(t, tostring(v))
	end
	return table.concat(t, ", ")
end

local function normalizeValue(p2, p3)
	-- upvalues: prepareValuesForError (ref)
	if table.find(p3, p2) then
		return p2
	end
	return nil, `Expected value to be one of {prepareValuesForError(p3)}, got {p2}.`
end

local function normalizeBoolean(p2)
	-- upvalues: normalizeType (ref)
	return normalizeType(p2, "boolean")
end

local function normalizeString(p2)
	-- upvalues: normalizeType (ref)
	return normalizeType(p2, "string")
end

local function normalizeNumber(p2)
	-- upvalues: normalizeType (ref)
	return normalizeType(p2, "number")
end

local function normalizeTable(p2, p3)
	local t = {}
	
	if type(p2) ~= "table" then
		return nil, `Type table required, got {type(p2)}.`
	end
	local var1, var2, var3
	local t_1 = {}
	
	for i, v in p3 do
		var1 = type(v) == "table" and v.required
		var2 = if type(v) == "table" then v.fn else v
		var3 = p2[i]
		
		if type(var3) ~= "nil" or var1 then
			local var4, var5 = var2(var3)
			
			if var5 then
				table.insert(t, `{i} normalization failed with: {var5}`)
			end
			if not var5 or not var1 then
				t_1[i] = var4
				continue
			end
			return nil, table.concat(t, " ")
		end
	end
	return t_1, if next(t) then table.concat(t, " ") else nil
end

local function normalizeList(p4, p5)
	if type(p4) ~= "table" then
		return nil, `Type table required, got {type(p4)}.`
	end
	local t = {}
	local t_1 = {}
	
	for i, v in p4 do
		local var6, var7 = p5(v)
		
		if var7 then
			table.insert(t, `{i} normalization failed with: {var7}`)
		end
		if var6 then
			table.insert(t_1, var6)
		end
	end
	return t_1, if next(t) then table.concat(t, " ") else nil
end

local function normalizeUnion(p6, p7)
	for i, v in p7 do
		local var8, _ = v(p6)
		
		if var8 then
			return var8
		end
	end
	return nil, "Value did not match any union."
end

return {
	normalizeType = normalizeType,
	normalizeValue = normalizeValue,
	normalizeBoolean = normalizeBoolean,
	normalizeString = normalizeString,
	normalizeNumber = normalizeNumber,
	normalizeTable = normalizeTable,
	normalizeList = normalizeList,
	normalizeUnion = normalizeUnion,
	normalizeStringToBoolean = function(p8)
		if p8 then
			return p8 == "true"
		end
		return nil, "value is nil"
	end,
	makeNormalizeTableFn = function(p8)
		-- upvalues: normalizeTable (ref)
		return function(p9)
			-- upvalues: normalizeTable (copy), p8 (ref)
			return normalizeTable(p9, p8)
		end
	end,
	makeNormalizeListFn = function(p8)
		-- upvalues: normalizeList (ref)
		return function(p9)
			-- upvalues: normalizeList (copy), p8 (ref)
			return normalizeList(p9, p8)
		end
	end,
	makeNormalizeUnionFn = function(p8)
		-- upvalues: normalizeUnion (ref)
		return function(p9)
			-- upvalues: normalizeUnion (copy), p8 (ref)
			return normalizeUnion(p9, p8)
		end
	end,
	makeNormalizeValueFn = function(p8)
		-- upvalues: normalizeValue (ref)
		return function(p9)
			-- upvalues: normalizeValue (copy), p8 (ref)
			return normalizeValue(p9, p8)
		end
	end,
	makeRequired = function(p8)
		return { required = true, fn = p8 }
	end,
	normalizeNotEmptyString = function(p8)
		-- upvalues: normalizeString (ref)
		if p8 == nil or p8 == "" then
			return nil, nil
		end
		return normalizeString(p8)
	end
}