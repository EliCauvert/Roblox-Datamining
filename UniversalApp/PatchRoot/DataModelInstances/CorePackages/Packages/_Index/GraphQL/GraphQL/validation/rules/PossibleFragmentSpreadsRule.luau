local Parent = script.Parent.Parent.Parent
local InspectFunction = require(Parent.jsutils.inspect).inspect
local GraphQLError = require(Parent.error.GraphQLError).GraphQLError
local IsCompositeTypeFunction = require(Parent.type.definition).isCompositeType
local Utilities = Parent.utilities
local TypeFromASTFunction = require(Utilities.typeFromAST).typeFromAST
local DoTypesOverlapFunction = require(Utilities.typeComparators).doTypesOverlap
local Callback = nil
local PossibleFragmentSpreadsRuleModule = {
	PossibleFragmentSpreadsRule = function(p1) --[[ Line: 31 ]]
		-- upvalues: IsCompositeTypeFunction (copy), DoTypesOverlapFunction (copy), InspectFunction (copy), GraphQLError (copy), Callback (ref)
		return {
			InlineFragment = function(_, p2) --[[ Line: 33 ]]
				-- upvalues: p1 (copy), IsCompositeTypeFunction (upval), DoTypesOverlapFunction (upval), InspectFunction (upval), GraphQLError (upval)
				local Type = p1:getType()
				local ParentType = p1:getParentType()
				
				if IsCompositeTypeFunction(Type) and IsCompositeTypeFunction(ParentType) and not DoTypesOverlapFunction(p1:getSchema(), Type, ParentType) then
					p1:reportError(GraphQLError.new(("Fragment cannot be spread here as objects of type \"%s\" can never be of type \"%s\"."):format(InspectFunction(ParentType), (InspectFunction(Type))), p2))
				end
			end,
			FragmentSpread = function(_, p2) --[[ Line: 54 ]]
				-- upvalues: Callback (upval), p1 (copy), DoTypesOverlapFunction (upval), InspectFunction (upval), GraphQLError (upval)
				local Value = p2.name.value
				local CallbackResult = Callback(p1, Value)
				local ParentType = p1:getParentType()
				
				if CallbackResult and ParentType and not DoTypesOverlapFunction(p1:getSchema(), CallbackResult, ParentType) then
					p1:reportError(GraphQLError.new(("Fragment \"%s\" cannot be spread here as objects of type \"%s\" can never be of type \"%s\"."):format(Value, InspectFunction(ParentType), (InspectFunction(CallbackResult))), p2))
				end
			end
		}
	end
}

Callback = function(p1, p2) --[[ Line: 78 | Named "getFragmentType" ]]
	-- upvalues: TypeFromASTFunction (copy), IsCompositeTypeFunction (copy)
	local Fragment = p1:getFragment(p2)
	
	if Fragment then
		local TypeFromASTResult = TypeFromASTFunction(p1:getSchema(), Fragment.typeCondition)
		
		if IsCompositeTypeFunction(TypeFromASTResult) then
			return TypeFromASTResult
		end
	end
	return nil
end

return PossibleFragmentSpreadsRuleModule