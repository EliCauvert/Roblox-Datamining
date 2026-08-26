local parent = script.Parent.Parent.Parent
local graphQLError = require(parent.error.GraphQLError).GraphQLError
local print = require(parent.language.printer).print
local isInputType = require(parent.type.definition).isInputType
local typeFromAST = require(parent.utilities.typeFromAST).typeFromAST

return {
	VariablesAreInputTypesRule = function(p1)
		-- upvalues: typeFromAST (ref), isInputType (ref), print (ref), graphQLError (ref)
		return {
			VariableDefinition = function(_, p2)
				-- upvalues: typeFromAST (copy), p1 (ref), isInputType (copy), print (copy), graphQLError (copy)
				local var1 = typeFromAST(p1:getSchema(), p2.type)
				
				if var1 and not isInputType(var1) then
					p1:reportError(graphQLError.new(("Variable \"$%s\" cannot be non-input type \"%s\"."):format(p2.variable.name.value, print(p2.type)), p2.type))
				end
			end
		}
	end
}