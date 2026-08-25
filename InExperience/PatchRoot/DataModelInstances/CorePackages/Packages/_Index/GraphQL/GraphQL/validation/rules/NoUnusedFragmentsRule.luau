local graphQLError = require(script.Parent.Parent.Parent.error.GraphQLError).GraphQLError

return {
	NoUnusedFragmentsRule = function(p0)
		-- upvalues: graphQLError (ref)
		local t = {}
		local t_1 = {}
		
		return {
			OperationDefinition = function(_, p1)
				-- upvalues: t (ref)
				table.insert(t, p1)
				
				return false
			end,
			FragmentDefinition = function(_, p2)
				-- upvalues: t_1 (ref)
				table.insert(t_1, p2)
				
				return false
			end,
			Document = {
				leave = function()
					-- upvalues: t (ref), p0 (ref), t_1 (ref), graphQLError (copy)
					local t_2 = {}
					
					for i, v in ipairs(t) do
						for i_2, v_1 in ipairs(p0:getRecursivelyReferencedFragments(v)) do
							t_2[v_1.name.value] = true
						end
					end
					for i, v_1 in ipairs(t_1) do
						local value = v_1.name.value
						
						if t_2[value] ~= true then
							p0:reportError(graphQLError.new(("Fragment \"%s\" is never used."):format(value), v_1))
						end
					end
				end
			}
		}
	end
}