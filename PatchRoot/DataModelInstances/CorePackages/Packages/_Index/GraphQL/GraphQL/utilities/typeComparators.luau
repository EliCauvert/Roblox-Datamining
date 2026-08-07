-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:38 2026 Pacific Standard Time.

local parent = script.Parent.Parent
local array = require(parent.Parent.LuauPolyfill).Array
local definitionModule = require(parent.type.definition)
local isInterfaceType = definitionModule.isInterfaceType
local isObjectType = definitionModule.isObjectType
local isListType = definitionModule.isListType
local isNonNullType = definitionModule.isNonNullType
local isAbstractType = definitionModule.isAbstractType

local function isEqualType(p0, p1) --[[ line: 24 ]]
	-- upvalues: isNonNullType (ref), isEqualType (ref), isListType (ref)
	return p0 == p1 or (if isNonNullType(p0) and isNonNullType(p1) then isEqualType(p0.ofType, p1.ofType) elseif isListType(p0) and isListType(p1) then isEqualType(p0.ofType, p1.ofType) else false)
end

local function isTypeSubTypeOf(p2, p3, p4) --[[ line: 48 ]]
	-- upvalues: isNonNullType (ref), isTypeSubTypeOf (ref), isListType (ref), isAbstractType (ref), isInterfaceType (ref), isObjectType (ref)
	if p3 == p4 then
		return true
	elseif isNonNullType(p4) then
		return if isNonNullType(p3) then isTypeSubTypeOf(p2, p3.ofType, p4.ofType) else false
	elseif isNonNullType(p3) then
		return isTypeSubTypeOf(p2, p3.ofType, p4)
	elseif isListType(p4) then
		return if isListType(p3) then isTypeSubTypeOf(p2, p3.ofType, p4.ofType) else false
	elseif isListType(p3) then
		return false
	end
	local var3 = isAbstractType(p4)
	
	if var3 and not isInterfaceType(p3) then
		var3 = isObjectType(p3) and p2:isSubType(p4, p3)
	end
	return var3
end

return {
	isEqualType = isEqualType,
	isTypeSubTypeOf = isTypeSubTypeOf,
	doTypesOverlap = function(vectorA, vectorB, p5) --[[ line: 97 ]]
		-- upvalues: isAbstractType (ref), array (ref)
		return vectorB == p5 or (if isAbstractType(vectorB) then if isAbstractType(p5) then array.some(vectorA:getPossibleTypes(vectorB), function(p6) --[[ line: 106 ]]
			-- upvalues: vectorA (ref), p5 (ref)
			return vectorA:isSubType(p5, p6)
		end) else vectorA:isSubType(vectorB, p5) elseif isAbstractType(p5) then vectorA:isSubType(p5, vectorB) else false)
	end
}