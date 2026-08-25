local parent = script.Parent.Parent.Parent
local array = require(parent.Parent.LuauPolyfill).Array
local graphQLError = require(parent.error.GraphQLError).GraphQLError
local kind = require(parent.language.kinds).Kind

return {
	LoneAnonymousOperationRule = function(p0)
		-- upvalues: array (ref), kind (ref), graphQLError (ref)
		local var0 = 0
		
		return {
			Document = function(_, p1)
				-- upvalues: var0 (write), array (copy), kind (copy)
				var0 = #array.filter(p1.definitions, function(p2)
					-- upvalues: kind (copy)
					return p2.kind == kind.OPERATION_DEFINITION
				end)
			end,
			OperationDefinition = function(_, p3)
				-- upvalues: var0 (write), p0 (ref), graphQLError (copy)
				if not p3.name and var0 > 1 then
					p0:reportError(graphQLError.new("This anonymous operation must be the only defined operation.", p3))
				end
			end
		}
	end
}