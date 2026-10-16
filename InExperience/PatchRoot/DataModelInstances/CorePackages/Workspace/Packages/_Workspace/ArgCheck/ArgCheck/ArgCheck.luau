local DebugLuaArgCheck = game:DefineFastFlag("DebugLuaArgCheck", false)
local IsStudio = game:GetService("RunService"):IsStudio()
local ArgCheckModule = {
	isEnabled = function() --[[ Line: 7 ]]
		-- upvalues: DebugLuaArgCheck (copy), IsStudio (copy)
		return DebugLuaArgCheck or (_G.__TESTEZ_RUNNING_TEST__ or IsStudio)
	end
}

local function _(p1, p2) --[[ Line: 11 | Named "assert_" ]]
	-- upvalues: ArgCheckModule (copy)
	if ArgCheckModule.isEnabled() then
		assert(p1, p2)
	end
end

local function stubArgCheckFunction(): boolean --[[ Line: 17 ]]
	return true
end

function ArgCheckModule.wrap(p1) --[[ Line: 43 ]]
	-- upvalues: ArgCheckModule (copy), stubArgCheckFunction (copy)
	return if ArgCheckModule.isEnabled() then p1 else stubArgCheckFunction
end

function ArgCheckModule.isNonNegativeNumber(p1: number, p2): number --[[ Line: 47 ]]
	-- upvalues: ArgCheckModule (copy)
	local v1: boolean = typeof(p1) == "number" and p1 >= 0
	local Formatted = string.format("expects %s to be a non-negative number!", p2)
	
	if ArgCheckModule.isEnabled() then
		assert(v1, Formatted)
	end
	return p1
end

function ArgCheckModule.isType(p1, ValueType, p2) --[[ Line: 54 ]]
	-- upvalues: ArgCheckModule (copy)
	local IsValueTypeMatch = typeof(p1) == ValueType
	local Formatted = string.format("expects %s to be a %s! it was: %s", p2, ValueType, (typeof(p1)))
	
	if ArgCheckModule.isEnabled() then
		assert(IsValueTypeMatch, Formatted)
	end
	return p1
end

function ArgCheckModule.isInTypes(p1, List, p2) --[[ Line: 63 ]]
	-- upvalues: ArgCheckModule (copy)
	for _, value in ipairs(List) do
		if typeof(p1) == value then
			return p1
		end
	end
	local Formatted = string.format("expects %s to be one of expectedTypes! it was: %s", p2, (typeof(p1)))
	
	if ArgCheckModule.isEnabled() then
		assert(false, Formatted)
	end
	return p1
end

function ArgCheckModule.isTypeOrNil(p3, ValueType, p4) --[[ Line: 75 ]]
	-- upvalues: ArgCheckModule (copy)
	local v1: boolean = p3 == nil or typeof(p3) == ValueType
	local Formatted = string.format("expects %s to be a %s! it was: %s", p4, ValueType, (typeof(p3)))
	
	if ArgCheckModule.isEnabled() then
		assert(v1, Formatted)
	end
	return p3
end

function ArgCheckModule.isNotNil(p3, p4) --[[ Line: 84 ]]
	-- upvalues: ArgCheckModule (copy)
	local v1 = p3 ~= nil
	local Formatted = string.format("expects %s to be not nil!", p4)
	
	if ArgCheckModule.isEnabled() then
		assert(v1, Formatted)
	end
	return p3
end

function ArgCheckModule.isNonEmptyString(p3, p4) --[[ Line: 90 ]]
	-- upvalues: ArgCheckModule (copy)
	local v1: boolean = typeof(p3) == "string" and p3 ~= ""
	local Formatted = string.format("expects %s to be a non-empty string!", p4)
	
	if ArgCheckModule.isEnabled() then
		assert(v1, Formatted)
	end
	return p3
end

function ArgCheckModule.isEqual(p3, p4, p5) --[[ Line: 96 ]]
	-- upvalues: ArgCheckModule (copy)
	local v1 = p3 == p4
	local Formatted = string.format("expects %s to equal %s! it was: %s", p5, tostring(p4), (tostring(p3)))
	
	if ArgCheckModule.isEnabled() then
		assert(v1, Formatted)
	end
	return p3
end

function ArgCheckModule.representsInteger(p3, p4) --[[ Line: 106 ]]
	-- upvalues: ArgCheckModule (copy)
	local Number: number? = tonumber(p3)
	local HasNumber = Number ~= nil
	local Formatted = string.format("expects %s to represent a number!", p4)
	
	if ArgCheckModule.isEnabled() then
		assert(HasNumber, Formatted)
	end
	local IsNumberMatch = Number % 1 == 0
	local Formatted1 = string.format("expects %s to represent an integer!", p4)
	
	if ArgCheckModule.isEnabled() then
		assert(IsNumberMatch, Formatted1)
	end
	return p3
end

function ArgCheckModule.matchesInterface(List, Entry, Text, p3) --[[ Line: 137 ]]
	-- upvalues: ArgCheckModule (copy)
	if ArgCheckModule.isEnabled() then
		local config = {
			integer = ArgCheckModule.representsInteger,
			nonEmptyString = ArgCheckModule.isNonEmptyString
		}
		
		if type(Entry) ~= "string" then
			ArgCheckModule.isType(List, "table", Text)
			
			if Entry[1] == nil then
				for i1, value1 in pairs(Entry) do
					if string.sub(i1, 1, 1) ~= "_" then
						local Text1 = Text .. "." .. i1
						local Entry1 = List[i1]
						
						if Entry._required and Entry._required[i1] or Entry1 ~= nil then
							ArgCheckModule.matchesInterface(Entry1, value1, Text1, p3)
						end
					end
				end
			else
				for i, value in ipairs(List) do
					ArgCheckModule.matchesInterface(value, Entry[1], Text .. "[" .. i .. "]", p3)
				end
				return List
			end
		else
			if p3 and p3[Entry] then
				ArgCheckModule.matchesInterface(List, p3[Entry], Text, p3)
				
				return List
			end
			local Callback: (any, any) -> () = config[Entry]
			
			if type(Callback) == "function" then
				Callback(List, Text)
				
				return List
			else
				ArgCheckModule.isType(List, Entry, Text)
				
				return List
			end
		end
	end
	return List
end

function ArgCheckModule.assert(...) --[[ Line: 179 ]]
	-- upvalues: ArgCheckModule (copy)
	local v1, v2 = ...
	
	if ArgCheckModule.isEnabled() then
		assert(v1, v2)
	end
end

return ArgCheckModule