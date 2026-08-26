local parent = script.Parent.Parent
local array = require(parent.Parent.LuauPolyfill).Array
local definitionModule = require(parent.type.definition)
local isInterfaceType = definitionModule.isInterfaceType
local isObjectType = definitionModule.isObjectType
local isListType = definitionModule.isListType
local isNonNullType = definitionModule.isNonNullType
local isAbstractType = definitionModule.isAbstractType

local function isEqualType(p1, p2)
	-- upvalues: isNonNullType (ref), isEqualType (ref), isListType (ref)
	return p1 == p2 or (if isNonNullType(p1) and isNonNullType(p2) then isEqualType(p1.ofType, p2.ofType) elseif isListType(p1) and isListType(p2) then isEqualType(p1.ofType, p2.ofType) else false)
end

local function isTypeSubTypeOf(p1, p2, p3)
	-- upvalues: isNonNullType (ref), isTypeSubTypeOf (ref), isListType (ref), isAbstractType (ref), isInterfaceType (ref), isObjectType (ref)
	if p2 == p3 then
		return true
	elseif isNonNullType(p3) then
		return if isNonNullType(p2) then isTypeSubTypeOf(p1, p2.ofType, p3.ofType) else false
	elseif isNonNullType(p2) then
		return isTypeSubTypeOf(p1, p2.ofType, p3)
	elseif isListType(p3) then
		return if isListType(p2) then isTypeSubTypeOf(p1, p2.ofType, p3.ofType) else false
	elseif isListType(p2) then
		return false
	end
	local var1 = isAbstractType(p3)
	
	if var1 and not isInterfaceType(p2) then
		var1 = isObjectType(p2) and p1:isSubType(p3, p2)
	end
	return var1
end

return {
	isEqualType = isEqualType,
	isTypeSubTypeOf = isTypeSubTypeOf,
	doTypesOverlap = function(vectorA, vectorB, p1)
		-- upvalues: isAbstractType (ref), array (ref)
		return vectorB == p1 or (if isAbstractType(vectorB) then if isAbstractType(p1) then array.some(vectorA:getPossibleTypes(vectorB), function(p2)
			-- upvalues: vectorA (ref), p1 (ref)
			return vectorA:isSubType(p1, p2)
		end) else vectorA:isSubType(vectorB, p1) elseif isAbstractType(p1) then vectorA:isSubType(p1, vectorB) else false)
	end
}