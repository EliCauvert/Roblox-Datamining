-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:39 2026 Pacific Standard Time.

local graphQLError = require(script.Parent.Parent.Parent.error.GraphQLError).GraphQLError

return {
	UniqueVariableNamesRule = function(p0) --[[ line: 19 ]]
		-- upvalues: graphQLError (ref)
		local t = {}
		
		return {
			OperationDefinition = function() --[[ line: 22 ]]
				-- upvalues: t (write)
				t = {}
			end,
			VariableDefinition = function(_, p1) --[[ line: 25 ]]
				-- upvalues: t (write), p0 (ref), graphQLError (copy)
				local value = p1.variable.name.value
				
				if t[value] then
					p0:reportError(graphQLError.new(("There can be only one variable named \"$%s\"."):format(value), { t[value], p1.variable.name }))
					
					return
				end
				t[value] = p1.variable.name
			end
		}
	end
}