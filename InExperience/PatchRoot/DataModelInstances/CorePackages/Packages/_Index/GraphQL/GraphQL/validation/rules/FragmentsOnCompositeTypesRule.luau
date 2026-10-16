local Parent = script.Parent.Parent.Parent
local GraphQLError = require(Parent.error.GraphQLError).GraphQLError
local PrintFunction = require(Parent.language.printer).print
local IsCompositeTypeFunction = require(Parent.type.definition).isCompositeType
local TypeFromASTFunction = require(Parent.utilities.typeFromAST).typeFromAST

return {
	FragmentsOnCompositeTypesRule = function(p1) --[[ Line: 24 ]]
		-- upvalues: TypeFromASTFunction (copy), IsCompositeTypeFunction (copy), PrintFunction (copy), GraphQLError (copy)
		return {
			InlineFragment = function(_, p2) --[[ Line: 26 ]]
				-- upvalues: TypeFromASTFunction (upval), p1 (copy), IsCompositeTypeFunction (upval), PrintFunction (upval), GraphQLError (upval)
				local TypeCondition = p2.typeCondition
				
				if TypeCondition then
					local TypeFromASTResult = TypeFromASTFunction(p1:getSchema(), TypeCondition)
					
					if TypeFromASTResult and not IsCompositeTypeFunction(TypeFromASTResult) then
						p1:reportError(GraphQLError.new(("Fragment cannot condition on non composite type \"%s\"."):format((PrintFunction(TypeCondition))), TypeCondition))
					end
				end
			end,
			FragmentDefinition = function(_, p2) --[[ Line: 43 ]]
				-- upvalues: TypeFromASTFunction (upval), p1 (copy), IsCompositeTypeFunction (upval), PrintFunction (upval), GraphQLError (upval)
				local TypeFromASTResult = TypeFromASTFunction(p1:getSchema(), p2.typeCondition)
				
				if TypeFromASTResult and not IsCompositeTypeFunction(TypeFromASTResult) then
					p1:reportError(GraphQLError.new(("Fragment \"%s\" cannot condition on non composite type \"%s\"."):format(p2.name.value, (PrintFunction(p2.typeCondition))), p2.typeCondition))
				end
			end
		}
	end
}