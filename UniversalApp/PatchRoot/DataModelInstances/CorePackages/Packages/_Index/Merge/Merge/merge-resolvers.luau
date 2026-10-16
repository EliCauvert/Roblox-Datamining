local Parent = script.Parent.Parent
local LuauPolyfillModule = require(Parent.LuauPolyfill)
local Array = LuauPolyfillModule.Array
local Boolean = LuauPolyfillModule.Boolean
local String = LuauPolyfillModule.String
local MergeDeepFunction = require(Parent.Utils).mergeDeep

local function mergeResolvers(Entry, p1) --[[ Line: 59 ]]
	-- upvalues: Boolean (copy), Array (copy), mergeResolvers (copy), MergeDeepFunction (copy), String (copy)
	if not Boolean.toJSBoolean(Entry) or Array.isArray(Entry) and #Entry == 0 then
		return {}
	end
	if not Boolean.toJSBoolean(Array.isArray(Entry)) then
		return Entry
	end
	if #Entry == 1 then
		return if Boolean.toJSBoolean(Entry[1]) then Entry[1] else {}
	end
	local List = {}
	
	for _, value in Entry do
		if Boolean.toJSBoolean(Array.isArray(value)) then
			value = mergeResolvers(value)
		end
		if Boolean.toJSBoolean(typeof(value) == "table" and value) then
			table.insert(List, value)
		end
	end
	local MergeDeepResult = MergeDeepFunction(List, true)
	
	if Boolean.toJSBoolean(if typeof(p1) == "table" then p1.exclusions else nil) then
		for _, exclusion in p1.exclusions do
			local Unpacked, Unpacked2 = table.unpack(String.split(exclusion, "."), 1, 2)
			
			if not Boolean.toJSBoolean(Unpacked2) or Unpacked2 == "*" then
				MergeDeepResult[Unpacked] = nil
			elseif Boolean.toJSBoolean(MergeDeepResult[Unpacked]) then
				MergeDeepResult[Unpacked][Unpacked2] = nil
			end
		end
	end
	return MergeDeepResult
end

return { mergeResolvers = mergeResolvers }