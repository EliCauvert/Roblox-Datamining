-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:39 2026 Pacific Standard Time.

local parent = script.Parent.Parent.Parent
local array = require(parent.Parent.LuauPolyfill).Array
local graphQLError = require(parent.error.GraphQLError).GraphQLError

return {
	NoFragmentCyclesRule = function(p0) --[[ line: 18 ]]
		-- upvalues: array (ref), graphQLError (ref)
		local t = {}
		local t_1 = {}
		local t_2 = {}
		
		local function detectCycleRecursive(p1) --[[ line: 31 ]]
			-- upvalues: t (ref), p0 (ref), t_2 (ref), t_1 (ref), detectCycleRecursive (ref), array (copy), graphQLError (copy)
			if t[p1.name.value] then return end
			local value = p1.name.value
			t[value] = true
			local selectionSetFragmentSpreads = p0:getFragmentSpreads(p1.selectionSet)
			
			if #selectionSetFragmentSpreads == 0 then return end
			t_2[value] = #t_1
			
			for i, v in ipairs(selectionSetFragmentSpreads) do
				local value_1 = v.name.value
				local var5 = t_2[value_1]
				table.insert(t_1, v)
				
				if var5 == nil then
					local var6 = p0:getFragment(value_1)
					
					if var6 then
						detectCycleRecursive(var6)
					end
				else
					local var7 = array.slice(t_1, var5 + 1)
					local joined = table.concat(array.map(array.slice(var7, 1, #var7), function(p2) --[[ line: 61 ]]
						return "\"" .. p2.name.value .. "\""
					end), ", ")
					p0:reportError(graphQLError.new(("Cannot spread fragment \"%s\" within itself"):format(value_1) .. (joined ~= "" and (" via %s."):format(joined) or "."), var7))
				end
				table.remove(t_1)
			end
			t_2[value] = nil
		end
		
		return {
			OperationDefinition = function() --[[ line: 82 ]]
				return false
			end,
			FragmentDefinition = function(_, p3) --[[ line: 85 ]]
				-- upvalues: detectCycleRecursive (ref)
				detectCycleRecursive(p3)
				
				return false
			end
		}
	end
}