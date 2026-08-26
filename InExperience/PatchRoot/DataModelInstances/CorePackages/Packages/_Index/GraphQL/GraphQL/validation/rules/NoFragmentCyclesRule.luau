local parent = script.Parent.Parent.Parent
local array = require(parent.Parent.LuauPolyfill).Array
local graphQLError = require(parent.error.GraphQLError).GraphQLError

return {
	NoFragmentCyclesRule = function(p1)
		-- upvalues: array (ref), graphQLError (ref)
		local t = {}
		local t_1 = {}
		local t_2 = {}
		
		local function detectCycleRecursive(p2)
			-- upvalues: t (ref), p1 (ref), t_2 (ref), t_1 (ref), detectCycleRecursive (ref), array (copy), graphQLError (copy)
			if t[p2.name.value] then return end
			local value = p2.name.value
			t[value] = true
			local selectionSetFragmentSpreads = p1:getFragmentSpreads(p2.selectionSet)
			
			if #selectionSetFragmentSpreads == 0 then return end
			t_2[value] = #t_1
			
			for i, v in ipairs(selectionSetFragmentSpreads) do
				local value_1 = v.name.value
				local var1 = t_2[value_1]
				table.insert(t_1, v)
				
				if var1 == nil then
					local var2 = p1:getFragment(value_1)
					
					if var2 then
						detectCycleRecursive(var2)
					end
				else
					local var3 = array.slice(t_1, var1 + 1)
					local joined = table.concat(array.map(array.slice(var3, 1, #var3), function(p3)
						return "\"" .. p2.name.value .. "\""
					end), ", ")
					p1:reportError(graphQLError.new(("Cannot spread fragment \"%s\" within itself"):format(value_1) .. (joined ~= "" and (" via %s."):format(joined) or "."), var3))
				end
				table.remove(t_1)
			end
			t_2[value] = nil
		end
		
		return {
			OperationDefinition = function()
				return false
			end,
			FragmentDefinition = function(_, p3)
				-- upvalues: detectCycleRecursive (ref)
				detectCycleRecursive(p3)
				
				return false
			end
		}
	end
}