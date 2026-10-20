local GraphQLError = require(script.Parent.Parent.Parent.error.GraphQLError).GraphQLError

return {
	NoUndefinedVariablesRule = function(p1)
		-- upvalues: GraphQLError (copy)
		local t = {}
		
		return {
			OperationDefinition = {
				enter = function()
					-- upvalues: t (ref)
					t = {}
				end,
				leave = function(_, p2)
					-- upvalues: p1 (copy), t (ref), GraphQLError (upval)
					for _, recursiveVariableUsage in ipairs((p1:getRecursiveVariableUsages(p2))) do
						local Node = recursiveVariableUsage.node
						local Value = Node.name.value
						
						if t[Value] ~= true then
							p1:reportError(GraphQLError.new(p2.name and ("Variable \"$%s\" is not defined by operation \"%s\"."):format(Value, p2.name.value) or ("Variable \"$%s\" is not defined."):format(Value), { Node, p2 }))
						end
					end
				end
			},
			VariableDefinition = function(_, p3)
				-- upvalues: t (ref)
				t[p3.variable.name.value] = true
			end
		}
	end
}