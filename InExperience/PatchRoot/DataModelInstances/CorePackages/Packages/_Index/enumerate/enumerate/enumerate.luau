local function strict(p0, p1)
	p1 = p1 or tostring(p0)
	
	return setmetatable(p0, {
		__index = function(_, p2)
			-- upvalues: p1 (ref)
			error(("%q (%s) is not a valid member of %s"):format(tostring(p2), typeof(p2), p1), 2)
		end,
		__newindex = function(_, p3, _)
			-- upvalues: p1 (ref)
			error(("%q (%s) is not a valid member of %s"):format(tostring(p3), typeof(p3), p1), 2)
		end
	})
end

local function addEnumValue(p4, p5, p6, p7, p8)
	-- upvalues: strict (ref)
	local isString = typeof(p7) == "string"
	assert(isString, "Only string names are supported for enums!")
	
	if isString then
		assert(p7 ~= "fromRawValue", "fromRawValue is reserved")
		assert(p7 ~= "isEnumValue", "isEnumValue is reserved")
		assert(p7 ~= "allValues", "allValues is reserved")
	end
	assert(p4[p7] == nil, "Enum value names can only be used once!")
	assert(p5[p7] == nil, "Enum values can only be used once!")
	local var4 = newproxy(true)
	local var5 = getmetatable(var4)
	
	function var5.__tostring()
		-- upvalues: p6 (ref), p7 (ref)
		return ("%s.%s"):format(p6, p7)
	end
	
	var5.__index = strict({
		rawValue = function()
			-- upvalues: p8 (ref)
			return p8
		end
	})
	p4[p7] = var4
	p5[p8] = var4
end

return function(p9, p10)
	-- upvalues: addEnumValue (ref), strict (ref)
	assert(typeof(p9) == "string", "Bad argument #1 - enums must be created using a string name!")
	assert(typeof(p10) == "table", "Bad argument #2 - enums must be created using a table!")
	local t = {}
	local t_1 = {}
	
	if p10[1] == nil then
		for i, v in pairs(p10) do
			addEnumValue(t, t_1, p9, i, v)
		end
	else
		for i, v in ipairs(p10) do
			addEnumValue(t, t_1, p9, v, v)
		end
	end
	function t.fromRawValue(p11)
		-- upvalues: t_1 (ref)
		return t_1[p11]
	end
	
	function t.isEnumValue(p12)
		-- upvalues: t (ref)
		if typeof(p12) ~= "userdata" then
			return false
		end
		for i, v in pairs(t) do
			if v == p12 then
				return true
			end
		end
		return false
	end
	
	function t.allValues()
		-- upvalues: t_1 (ref)
		local t = {}
		
		for i, v in pairs(t_1) do
			table.insert(t, v)
		end
		return t
	end
	
	local var8 = newproxy(true)
	local var9 = getmetatable(var8)
	var9.__index = strict(t, p9)
	
	function var9.__tostring()
		-- upvalues: p9 (ref)
		return p9
	end
	
	return var8
end