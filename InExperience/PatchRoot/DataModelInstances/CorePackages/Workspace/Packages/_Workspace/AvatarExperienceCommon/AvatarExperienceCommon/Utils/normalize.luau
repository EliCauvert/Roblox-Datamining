local function normalizeType(p0, p1)
	if type(p0) == p1 then
		return p0
	end
	return nil, `Type {p1} required, got {type(p0)}.`
end

local function prepareValuesForError(p2)
	local t = {}
	
	for i, v in p2 do
		table.insert(t, tostring(v))
	end
	return table.concat(t, ", ")
end

local function normalizeValue(p3, p4)
	-- upvalues: prepareValuesForError (ref)
	if table.find(p4, p3) then
		return p3
	end
	return nil, `Expected value to be one of {prepareValuesForError(p4)}, got {p3}.`
end

local function normalizeBoolean(p5)
	-- upvalues: normalizeType (ref)
	return normalizeType(p5, "boolean")
end

local function normalizeString(p6)
	-- upvalues: normalizeType (ref)
	return normalizeType(p6, "string")
end

local function normalizeNumber(p7)
	-- upvalues: normalizeType (ref)
	return normalizeType(p7, "number")
end

local function normalizeTable(p8, p9)
	local t = {}
	
	if type(p8) ~= "table" then
		return nil, `Type table required, got {type(p8)}.`
	end
	local var12, var13, var14
	local t_1 = {}
	
	for i, v in p9 do
		var12 = type(v) == "table" and v.required
		var13 = if type(v) == "table" then v.fn else v
		var14 = p8[i]
		
		if type(var14) ~= "nil" or var12 then
			local var15, var16 = var13(var14)
			
			if var16 then
				table.insert(t, `{i} normalization failed with: {var16}`)
			end
			if not var16 or not var12 then
				t_1[i] = var15
				continue
			end
			return nil, table.concat(t, " ")
		end
	end
	return t_1, if next(t) then table.concat(t, " ") else nil
end

local function normalizeList(p10, p11)
	if type(p10) ~= "table" then
		return nil, `Type table required, got {type(p10)}.`
	end
	local t = {}
	local t_1 = {}
	
	for i, v in p10 do
		local var19, var20 = p11(v)
		
		if var20 then
			table.insert(t, `{i} normalization failed with: {var20}`)
		end
		if var19 then
			table.insert(t_1, var19)
		end
	end
	return t_1, if next(t) then table.concat(t, " ") else nil
end

local function normalizeUnion(p12, p13)
	for i, v in p13 do
		local var21, _ = v(p12)
		
		if var21 then
			return var21
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
	normalizeStringToBoolean = function(p14)
		if p14 then
			return p14 == "true"
		end
		return nil, "value is nil"
	end,
	makeNormalizeTableFn = function(p15)
		-- upvalues: normalizeTable (ref)
		return function(p16)
			-- upvalues: normalizeTable (copy), p15 (ref)
			return normalizeTable(p16, p15)
		end
	end,
	makeNormalizeListFn = function(p17)
		-- upvalues: normalizeList (ref)
		return function(p18)
			-- upvalues: normalizeList (copy), p17 (ref)
			return normalizeList(p18, p17)
		end
	end,
	makeNormalizeUnionFn = function(p19)
		-- upvalues: normalizeUnion (ref)
		return function(p20)
			-- upvalues: normalizeUnion (copy), p19 (ref)
			return normalizeUnion(p20, p19)
		end
	end,
	makeNormalizeValueFn = function(p21)
		-- upvalues: normalizeValue (ref)
		return function(p22)
			-- upvalues: normalizeValue (copy), p21 (ref)
			return normalizeValue(p22, p21)
		end
	end,
	makeRequired = function(p23)
		return { required = true, fn = p23 }
	end,
	normalizeNotEmptyString = function(p24)
		-- upvalues: normalizeString (ref)
		if p24 == nil or p24 == "" then
			return nil, nil
		end
		return normalizeString(p24)
	end
}