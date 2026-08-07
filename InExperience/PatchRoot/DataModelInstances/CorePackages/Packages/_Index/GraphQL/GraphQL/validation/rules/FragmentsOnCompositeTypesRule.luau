local parent = script.Parent.Parent.Parent
local graphQLError = require(parent.error.GraphQLError).GraphQLError
local print = require(parent.language.printer).print
local isCompositeType = require(parent.type.definition).isCompositeType
local typeFromAST = require(parent.utilities.typeFromAST).typeFromAST

return {
	FragmentsOnCompositeTypesRule = function(p0) --[[ line: 24 ]]
		-- upvalues: typeFromAST (ref), isCompositeType (ref), print (ref), graphQLError (ref)
		return {
			InlineFragment = function(_, p1) --[[ line: 26 ]]
				-- upvalues: typeFromAST (copy), p0 (ref), isCompositeType (copy), print (copy), graphQLError (copy)
				local typeCondition = p1.typeCondition
				
				if typeCondition then
					local var0 = typeFromAST(p0:getSchema(), typeCondition)
					
					if var0 and not isCompositeType(var0) then
						p0:reportError(graphQLError.new(("Fragment cannot condition on non composite type \"%s\"."):format(print(typeCondition)), typeCondition))
					end
				end
			end,
			FragmentDefinition = function(_, p2) --[[ line: 43 ]]
				-- upvalues: typeFromAST (copy), p0 (ref), isCompositeType (copy), print (copy), graphQLError (copy)
				local var1 = typeFromAST(p0:getSchema(), p2.typeCondition)
				
				if var1 and not isCompositeType(var1) then
					p0:reportError(graphQLError.new(("Fragment \"%s\" cannot condition on non composite type \"%s\"."):format(p2.name.value, print(p2.typeCondition)), p2.typeCondition))
				end
			end
		}
	end
}