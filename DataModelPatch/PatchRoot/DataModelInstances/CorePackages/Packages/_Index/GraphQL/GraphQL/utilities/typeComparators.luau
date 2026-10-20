local Parent = script.Parent.Parent
local Array = require(Parent.Parent.LuauPolyfill).Array
local DefinitionModule = require(Parent.type.definition)
local IsInterfaceTypeFunction = DefinitionModule.isInterfaceType
local IsObjectTypeFunction = DefinitionModule.isObjectType
local IsListTypeFunction = DefinitionModule.isListType
local IsNonNullTypeFunction = DefinitionModule.isNonNullType
local IsAbstractTypeFunction = DefinitionModule.isAbstractType

local function isEqualType(OfType, OfType1)
	-- upvalues: IsNonNullTypeFunction (copy), isEqualType (copy), IsListTypeFunction (copy)
	return OfType == OfType1 or (if IsNonNullTypeFunction(OfType) and IsNonNullTypeFunction(OfType1) then isEqualType(OfType.ofType, OfType1.ofType) elseif IsListTypeFunction(OfType) and IsListTypeFunction(OfType1) then isEqualType(OfType.ofType, OfType1.ofType) else false)
end

local function isTypeSubTypeOf(p1, OfType, OfType1)
	-- upvalues: IsNonNullTypeFunction (copy), isTypeSubTypeOf (copy), IsListTypeFunction (copy), IsAbstractTypeFunction (copy), IsInterfaceTypeFunction (copy), IsObjectTypeFunction (copy)
	return OfType == OfType1 or (if IsNonNullTypeFunction(OfType1) then if IsNonNullTypeFunction(OfType) then isTypeSubTypeOf(p1, OfType.ofType, OfType1.ofType) else false elseif IsNonNullTypeFunction(OfType) then isTypeSubTypeOf(p1, OfType.ofType, OfType1) elseif IsListTypeFunction(OfType1) then if IsListTypeFunction(OfType) then isTypeSubTypeOf(p1, OfType.ofType, OfType1.ofType) else false else not IsListTypeFunction(OfType) and (IsAbstractTypeFunction(OfType1) and (if IsInterfaceTypeFunction(OfType) then p1:isSubType(OfType1, OfType) else IsObjectTypeFunction(OfType) and p1:isSubType(OfType1, OfType))))
end

return {
	isEqualType = isEqualType,
	isTypeSubTypeOf = isTypeSubTypeOf,
	doTypesOverlap = function(p1, p2, p3)
		-- upvalues: IsAbstractTypeFunction (copy), Array (copy)
		return p2 == p3 or (if IsAbstractTypeFunction(p2) then if IsAbstractTypeFunction(p3) then Array.some(p1:getPossibleTypes(p2), function(p4)
			-- upvalues: p1 (copy), p3 (copy)
			return p1:isSubType(p3, p4)
		end) else p1:isSubType(p2, p3) elseif IsAbstractTypeFunction(p3) then p1:isSubType(p3, p2) else false)
	end
}