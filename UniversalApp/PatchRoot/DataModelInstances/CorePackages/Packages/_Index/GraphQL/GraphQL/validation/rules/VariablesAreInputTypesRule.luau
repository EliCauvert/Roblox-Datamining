local Parent = script.Parent.Parent.Parent
local GraphQLError = require(Parent.error.GraphQLError).GraphQLError
local PrintFunction = require(Parent.language.printer).print
local IsInputTypeFunction = require(Parent.type.definition).isInputType
local TypeFromASTFunction = require(Parent.utilities.typeFromAST).typeFromAST

return {
	VariablesAreInputTypesRule = function(p1) --[[ Line: 24 ]]
		-- upvalues: TypeFromASTFunction (copy), IsInputTypeFunction (copy), PrintFunction (copy), GraphQLError (copy)
		return {
			VariableDefinition = function(_, p2) --[[ Line: 26 ]]
				-- upvalues: TypeFromASTFunction (upval), p1 (copy), IsInputTypeFunction (upval), PrintFunction (upval), GraphQLError (upval)
				local TypeFromASTResult = TypeFromASTFunction(p1:getSchema(), p2.type)
				
				if TypeFromASTResult and not IsInputTypeFunction(TypeFromASTResult) then
					p1:reportError(GraphQLError.new(("Variable \"$%s\" cannot be non-input type \"%s\"."):format(p2.variable.name.value, (PrintFunction(p2.type))), p2.type))
				end
			end
		}
	end
}