local LuauPolyfillModule = require(script:FindFirstAncestor("GraphQLServer").Parent.LuauPolyfill)
local Array = LuauPolyfillModule.Array
local Boolean = LuauPolyfillModule.Boolean
local MergeDeepModule = require(script.Parent.mergeDeep)

local function mergeResolvers(Entry, p1)
	-- upvalues: Array (copy), mergeResolvers (copy), MergeDeepModule (copy), Boolean (copy)
	if not Entry or Array.isArray(Entry) and #Entry == 0 then
		return {}
	end
	if not Array.isArray(Entry) then
		return Entry
	end
	if #Entry == 1 then
		return Entry[1] or {}
	end
	local List = {}
	
	for _, value in Entry do
		if Array.isArray(value) then
			value = mergeResolvers(value)
		end
		if type(value) == "table" and value then
			table.insert(List, value)
		end
	end
	local MergeDeepModuleResult = MergeDeepModule(List, true)
	
	if p1 and p1.exclusions then
		for _, exclusion in p1.exclusions do
			local Unpacked, Unpacked2 = table.unpack(exclusion:split("."), 1, 2)
			
			if not Unpacked2 or Unpacked2 == "*" then
				MergeDeepModuleResult[tostring(Unpacked)] = nil
			elseif Boolean.toJSBoolean(MergeDeepModuleResult[tostring(Unpacked)]) then
				MergeDeepModuleResult[tostring(Unpacked)][tostring(Unpacked2)] = nil
			end
		end
	end
	return MergeDeepModuleResult
end

return mergeResolvers