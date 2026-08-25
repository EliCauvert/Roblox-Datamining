local parent = script.Parent.Parent.Parent
local inspect = require(parent.jsutils.inspect).inspect
local graphQLError = require(parent.error.GraphQLError).GraphQLError
local isCompositeType = require(parent.type.definition).isCompositeType
local utilities = parent.utilities
local typeFromAST = require(utilities.typeFromAST).typeFromAST
local doTypesOverlap = require(utilities.typeComparators).doTypesOverlap
local t = {}
local getFragmentType = nil

function t.PossibleFragmentSpreadsRule(p0)
	-- upvalues: isCompositeType (ref), doTypesOverlap (ref), inspect (ref), graphQLError (ref), getFragmentType (write)
	return {
		InlineFragment = function(_, p1)
			-- upvalues: p0 (ref), isCompositeType (copy), doTypesOverlap (copy), inspect (copy), graphQLError (copy)
			local type = p0:getType()
			local parentType = p0:getParentType()
			
			if isCompositeType(type) and isCompositeType(parentType) and not doTypesOverlap(p0:getSchema(), type, parentType) then
				p0:reportError(graphQLError.new(("Fragment cannot be spread here as objects of type \"%s\" can never be of type \"%s\"."):format(inspect(parentType), inspect(type)), p1))
			end
		end,
		FragmentSpread = function(_, p2)
			-- upvalues: getFragmentType (copy), p0 (ref), doTypesOverlap (copy), inspect (copy), graphQLError (copy)
			local value = p2.name.value
			local var4 = getFragmentType(p0, value)
			local parentType = p0:getParentType()
			
			if var4 and parentType and not doTypesOverlap(p0:getSchema(), var4, parentType) then
				p0:reportError(graphQLError.new(("Fragment \"%s\" cannot be spread here as objects of type \"%s\" can never be of type \"%s\"."):format(value, inspect(parentType), inspect(var4)), p2))
			end
		end
	}
end

getFragmentType = function(p3, p4)
	-- upvalues: typeFromAST (ref), isCompositeType (ref)
	local var6 = p3:getFragment(p4)
	
	if var6 then
		local var7 = typeFromAST(p3:getSchema(), var6.typeCondition)
		
		return if isCompositeType(var7) then var7 else nil
	end
end

return t