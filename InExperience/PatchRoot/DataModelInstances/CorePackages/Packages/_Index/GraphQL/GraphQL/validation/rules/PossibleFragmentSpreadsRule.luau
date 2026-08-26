local parent = script.Parent.Parent.Parent
local inspect = require(parent.jsutils.inspect).inspect
local graphQLError = require(parent.error.GraphQLError).GraphQLError
local isCompositeType = require(parent.type.definition).isCompositeType
local utilities = parent.utilities
local typeFromAST = require(utilities.typeFromAST).typeFromAST
local doTypesOverlap = require(utilities.typeComparators).doTypesOverlap
local t = {}
local getFragmentType = nil

function t.PossibleFragmentSpreadsRule(p1)
	-- upvalues: isCompositeType (ref), doTypesOverlap (ref), inspect (ref), graphQLError (ref), getFragmentType (write)
	return {
		InlineFragment = function(_, p2)
			-- upvalues: p1 (ref), isCompositeType (copy), doTypesOverlap (copy), inspect (copy), graphQLError (copy)
			local type = p1:getType()
			local parentType = p1:getParentType()
			
			if isCompositeType(type) and isCompositeType(parentType) and not doTypesOverlap(p1:getSchema(), type, parentType) then
				p1:reportError(graphQLError.new(("Fragment cannot be spread here as objects of type \"%s\" can never be of type \"%s\"."):format(inspect(parentType), inspect(type)), p2))
			end
		end,
		FragmentSpread = function(_, p2)
			-- upvalues: getFragmentType (copy), p1 (ref), doTypesOverlap (copy), inspect (copy), graphQLError (copy)
			local value = p2.name.value
			local var1 = getFragmentType(p1, value)
			local parentType = p1:getParentType()
			
			if var1 and parentType and not doTypesOverlap(p1:getSchema(), var1, parentType) then
				p1:reportError(graphQLError.new(("Fragment \"%s\" cannot be spread here as objects of type \"%s\" can never be of type \"%s\"."):format(value, inspect(parentType), inspect(var1)), p2))
			end
		end
	}
end

getFragmentType = function(p1, p2)
	-- upvalues: typeFromAST (ref), isCompositeType (ref)
	local var1 = p1:getFragment(p2)
	
	if var1 then
		local var2 = typeFromAST(p1:getSchema(), var1.typeCondition)
		
		return if isCompositeType(var2) then var2 else nil
	end
end

return t