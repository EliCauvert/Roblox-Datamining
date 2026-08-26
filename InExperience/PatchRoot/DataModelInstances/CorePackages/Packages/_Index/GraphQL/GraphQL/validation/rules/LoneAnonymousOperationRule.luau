local parent = script.Parent.Parent.Parent
local array = require(parent.Parent.LuauPolyfill).Array
local graphQLError = require(parent.error.GraphQLError).GraphQLError
local kind = require(parent.language.kinds).Kind

return {
	LoneAnonymousOperationRule = function(p1)
		-- upvalues: array (ref), kind (ref), graphQLError (ref)
		local var1 = 0
		
		return {
			Document = function(_, p2)
				-- upvalues: var1 (write), array (copy), kind (copy)
				var1 = #array.filter(p2.definitions, function(p3)
					-- upvalues: kind (copy)
					return p3.kind == kind.OPERATION_DEFINITION
				end)
			end,
			OperationDefinition = function(_, p2)
				-- upvalues: var1 (write), p1 (ref), graphQLError (copy)
				if not p2.name and var1 > 1 then
					p1:reportError(graphQLError.new("This anonymous operation must be the only defined operation.", p2))
				end
			end
		}
	end
}