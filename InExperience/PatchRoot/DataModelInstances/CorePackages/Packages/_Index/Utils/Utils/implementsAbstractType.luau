local Parent = script.Parent.Parent
local Boolean = require(Parent.LuauPolyfill).Boolean
local GraphQLModule = require(Parent.GraphQL)
local DoTypesOverlapFunction = GraphQLModule.doTypesOverlap
local IsCompositeTypeFunction = GraphQLModule.isCompositeType
local _ = require(script.Parent.types)

return {
	implementsAbstractType = function(p1, p2, p3) --[[ Line: 20 ]]
		-- upvalues: Boolean (copy), IsCompositeTypeFunction (copy), DoTypesOverlapFunction (copy)
		if p3 == nil or p2 == nil then
			return false
		elseif p2 == p3 then
			return true
		else
			local ToJSBooleanFunction = Boolean.toJSBoolean
			local IsCompositeType = IsCompositeTypeFunction(p2)
			
			return if ToJSBooleanFunction(if Boolean.toJSBoolean(IsCompositeType) then IsCompositeTypeFunction(p3) else IsCompositeType) then DoTypesOverlapFunction(p1, p2, p3) else false
		end
	end
}