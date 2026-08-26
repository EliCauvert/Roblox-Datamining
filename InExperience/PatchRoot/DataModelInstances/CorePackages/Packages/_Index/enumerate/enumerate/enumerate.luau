local function strict(p1, p2)
	p2 = p2 or tostring(p1)
	
	return setmetatable(p1, {
		__index = function(_, p3)
			-- upvalues: p2 (ref)
			error(("%q (%s) is not a valid member of %s"):format(tostring(p3), typeof(p3), p2), 2)
		end,
		__newindex = function(_, p3, _)
			-- upvalues: p2 (ref)
			error(("%q (%s) is not a valid member of %s"):format(tostring(p3), typeof(p3), p2), 2)
		end
	})
end

local function addEnumValue(p1, p2, p3, p4, p5)
	-- upvalues: strict (ref)
	local isString = typeof(p4) == "string"
	assert(isString, "Only string names are supported for enums!")
	
	if isString then
		assert(p4 ~= "fromRawValue", "fromRawValue is reserved")
		assert(p4 ~= "isEnumValue", "isEnumValue is reserved")
		assert(p4 ~= "allValues", "allValues is reserved")
	end
	assert(p1[p4] == nil, "Enum value names can only be used once!")
	assert(p2[p4] == nil, "Enum values can only be used once!")
	local var1 = newproxy(true)
	local var2 = getmetatable(var1)
	
	function var5.__tostring()
		-- upvalues: p3 (ref), p4 (ref)
		return ("%s.%s"):format(p3, p4)
	end
	
	var2.__index = strict({
		rawValue = function()
			-- upvalues: p5 (ref)
			return p5
		end
	})
	p1[p4] = var1
	p2[p5] = var1
end

return function(p1, p2)
	-- upvalues: addEnumValue (ref), strict (ref)
	assert(typeof(p1) == "string", "Bad argument #1 - enums must be created using a string name!")
	assert(typeof(p2) == "table", "Bad argument #2 - enums must be created using a table!")
	local t = {}
	local t_1 = {}
	
	if p2[1] == nil then
		for i, v in pairs(p2) do
			addEnumValue(t, t_1, p1, i, v)
		end
	else
		for i, v in ipairs(p2) do
			addEnumValue(t, t_1, p1, v, v)
		end
	end
	function t.fromRawValue(p3)
		-- upvalues: t_1 (ref)
		return t_1[p3]
	end
	
	function t.isEnumValue(p3)
		-- upvalues: t (ref)
		if typeof(p3) ~= "userdata" then
			return false
		end
		for i, v in pairs(t) do
			if v == p3 then
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
	
	local var1 = newproxy(true)
	local var2 = getmetatable(var1)
	var2.__index = strict(t, p1)
	
	function var9.__tostring()
		-- upvalues: p1 (ref)
		return p1
	end
	
	return var1
end