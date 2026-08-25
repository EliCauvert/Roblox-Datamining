local parent = script.Parent.Parent.Parent
local graphQLError = require(parent.error.GraphQLError).GraphQLError
local print = require(parent.language.printer).print
local isInputType = require(parent.type.definition).isInputType
local typeFromAST = require(parent.utilities.typeFromAST).typeFromAST

return {
	VariablesAreInputTypesRule = function(p0)
		-- upvalues: typeFromAST (ref), isInputType (ref), print (ref), graphQLError (ref)
		return {
			VariableDefinition = function(_, p1)
				-- upvalues: typeFromAST (copy), p0 (ref), isInputType (copy), print (copy), graphQLError (copy)
				local var0 = typeFromAST(p0:getSchema(), p1.type)
				
				if var0 and not isInputType(var0) then
					p0:reportError(graphQLError.new(("Variable \"$%s\" cannot be non-input type \"%s\"."):format(p1.variable.name.value, print(p1.type)), p1.type))
				end
			end
		}
	end
}