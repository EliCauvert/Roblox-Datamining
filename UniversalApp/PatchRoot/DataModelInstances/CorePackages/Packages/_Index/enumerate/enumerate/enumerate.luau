local function strict(p1, p2) --[[ Line: 2 ]]
	local P1 = p2 or tostring(p1)
	
	return (setmetatable(p1, {
		__index = function(_, p3) --[[ Line: 6 ]]
			-- upvalues: P1 (copy)
			error(("%q (%s) is not a valid member of %s"):format(tostring(p3), typeof(p3), P1), 2)
		end,
		__newindex = function(_, p3, _) --[[ Line: 12 ]]
			-- upvalues: P1 (copy)
			error(("%q (%s) is not a valid member of %s"):format(tostring(p3), typeof(p3), P1), 2)
		end
	}))
end

local function addEnumValue(Proxies, Proxies1, p1, Key, Key1) --[[ Line: 20 ]]
	-- upvalues: strict (copy)
	local IsString = typeof(Key) == "string"
	assert(IsString, "Only string names are supported for enums!")
	
	if IsString then
		assert(Key ~= "fromRawValue", "fromRawValue is reserved")
		assert(Key ~= "isEnumValue", "isEnumValue is reserved")
		assert(Key ~= "allValues", "allValues is reserved")
	end
	assert(Proxies[Key] == nil, "Enum value names can only be used once!")
	assert(Proxies1[Key] == nil, "Enum values can only be used once!")
	local Proxy = newproxy(true)
	local Meta = getmetatable(Proxy)
	
	function Meta.__tostring(): string --[[ Line: 34 ]]
		-- upvalues: p1 (copy), Key (copy)
		return ("%s.%s"):format(p1, Key)
	end
	
	Meta.__index = strict({
		rawValue = function() --[[ Line: 39 ]]
			-- upvalues: Key1 (copy)
			return Key1
		end
	})
	Proxies[Key] = Proxy
	Proxies1[Key1] = Proxy
end

return function(p1, Entry) --[[ Line: 51 | Named "enumerate" ]]
	-- upvalues: addEnumValue (copy), strict (copy)
	assert(typeof(p1) == "string", "Bad argument #1 - enums must be created using a string name!")
	assert(typeof(Entry) == "table", "Bad argument #2 - enums must be created using a table!")
	local t = {}
	local t1 = {}
	
	if Entry[1] == nil then
		for i, value1 in pairs(Entry) do
			addEnumValue(t, t1, p1, i, value1)
		end
	else
		for _, value in ipairs(Entry) do
			addEnumValue(t, t1, p1, value, value)
		end
	end
	function t.fromRawValue(p2) --[[ Line: 69 ]]
		-- upvalues: t1 (copy)
		return t1[p2]
	end
	
	function t.isEnumValue(p2): boolean --[[ Line: 73 ]]
		-- upvalues: t (copy)
		if typeof(p2) ~= "userdata" then
			return false
		end
		for _, value in pairs(t) do
			if value == p2 then
				return true
			end
		end
		return false
	end
	
	function t.allValues() --[[ Line: 87 ]]
		-- upvalues: t1 (copy)
		local List = {}
		
		for _, value in pairs(t1) do
			table.insert(List, value)
		end
		return List
	end
	
	local Proxy = newproxy(true)
	local Meta = getmetatable(Proxy)
	Meta.__index = strict(t, p1)
	
	function Meta.__tostring() --[[ Line: 100 ]]
		-- upvalues: p1 (copy)
		return p1
	end
	
	return Proxy
end