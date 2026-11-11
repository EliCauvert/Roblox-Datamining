local function normalizeType(p1, ValueType)
	if type(p1) == ValueType then
		return p1
	else
		return nil, `Type {ValueType} required, got {type(p1)}.`
	end
end

local function prepareValuesForError(List): string
	local List1 = {}
	
	for _, value in List do
		table.insert(List1, (tostring(value)))
	end
	return table.concat(List1, ", ")
end

local function normalizeValue(Value, List)
	-- upvalues: prepareValuesForError (copy)
	if table.find(List, Value) then
		return Value
	else
		return nil, `Expected value to be one of {prepareValuesForError(List)}, got {Value}.`
	end
end

local function normalizeString(p1)
	-- upvalues: normalizeType (copy)
	return normalizeType(p1, "string")
end

local function normalizeTable(p1, List)
	local List1 = {}
	
	if type(p1) ~= "table" then
		return nil, `Type table required, got {type(p1)}.`
	end
	local t = {}
	
	for i, Required1 in List do
		local Required = type(Required1) == "table" and Required1.required
		local Fn = if type(Required1) == "table" then Required1.fn else Required1
		local v1 = p1[i]
		
		if type(v1) ~= "nil" or Required then
			local FnResult, FnResult2 = Fn(v1)
			
			if FnResult2 then
				table.insert(List1, `{i} normalization failed with: {FnResult2}`)
			end
			if FnResult2 and Required then
				return nil, table.concat(List1, " ")
			end
			t[i] = FnResult
		end
	end
	return t, if next(List1) then table.concat(List1, " ") else nil
end

local function normalizeList(List, Callback)
	if type(List) ~= "table" then
		return nil, `Type table required, got {type(List)}.`
	end
	local List1 = {}
	local List2 = {}
	
	for i, value in List do
		local CallbackResult, CallbackResult2 = Callback(value)
		
		if CallbackResult2 then
			table.insert(List1, `{i} normalization failed with: {CallbackResult2}`)
		end
		if CallbackResult then
			table.insert(List2, CallbackResult)
		end
	end
	return List2, if next(List1) then table.concat(List1, " ") else nil
end

local function normalizeUnion(p2, List)
	local v2 = nil
	for _, value in List do
		local _
		v2, _ = value(p2)
		
		if v2 then
			return v2
		end
	end
	return nil, "Value did not match any union."
end

return {
	normalizeType = normalizeType,
	normalizeValue = normalizeValue,
	normalizeBoolean = function(p3)
		-- upvalues: normalizeType (copy)
		return normalizeType(p3, "boolean")
	end,
	normalizeString = normalizeString,
	normalizeNumber = function(p3)
		-- upvalues: normalizeType (copy)
		return normalizeType(p3, "number")
	end,
	normalizeTable = normalizeTable,
	normalizeList = normalizeList,
	normalizeUnion = normalizeUnion,
	normalizeStringToBoolean = function(p3)
		if p3 then
			return p3 == "true"
		else
			return nil, "value is nil"
		end
	end,
	makeNormalizeTableFn = function(p3)
		-- upvalues: normalizeTable (copy)
		return function(p4)
			-- upvalues: normalizeTable (upval), p3 (copy)
			return normalizeTable(p4, p3)
		end
	end,
	makeNormalizeListFn = function(p3)
		-- upvalues: normalizeList (copy)
		return function(p4)
			-- upvalues: normalizeList (upval), p3 (copy)
			return normalizeList(p4, p3)
		end
	end,
	makeNormalizeUnionFn = function(p3)
		-- upvalues: normalizeUnion (copy)
		return function(p4)
			-- upvalues: normalizeUnion (upval), p3 (copy)
			return normalizeUnion(p4, p3)
		end
	end,
	makeNormalizeValueFn = function(p3)
		-- upvalues: normalizeValue (copy)
		return function(p4)
			-- upvalues: normalizeValue (upval), p3 (copy)
			return normalizeValue(p4, p3)
		end
	end,
	makeRequired = function(Fn)
		return { required = true, fn = Fn }
	end,
	normalizeNotEmptyString = function(p3)
		-- upvalues: normalizeString (copy)
		if p3 == nil or p3 == "" then
			return nil, nil
		else
			return normalizeString(p3)
		end
	end
}