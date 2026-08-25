local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
local array = require(parent_1.LuauPolyfill).Array
local luauRegExpModule = require(parent_1.LuauRegExp)
local _ = require(parent_1.GraphQL)
local _ = require(script.Parent.types)
local utilitiesModule = require(parent.utilities)
local isReference = utilitiesModule.isReference
local isField = utilitiesModule.isField
local deepMerger = utilitiesModule.DeepMerger
local resultKeyNameFromFieldf = utilitiesModule.resultKeyNameFromFieldf
local shouldInclude = utilitiesModule.shouldInclude
local isNonNullObject = utilitiesModule.isNonNullObject
local t = {}
local hasOwnPropertyModule = require(parent.luaUtils.hasOwnProperty)
t.hasOwn = hasOwnPropertyModule

function t.getTypenameFromStoreObject(p0, p1)
	-- upvalues: isReference (ref)
	return if isReference(p1) then p0:get(p1.__ref, "__typename") elseif p1 then p1.__typename else nil
end

t.TypeOrFieldNameRegExp = luauRegExpModule("^[_a-zA-Z][_0-9a-zA-Z]*", "i")
local t_1 = {}

function t.fieldNameFromStoreName(p2)
	-- upvalues: t_1 (ref)
	if t_1[p2] then
		return t_1[p2]
	end
	local var6 = string.match(p2, "^[_a-zA-Z][_0-9a-zA-Z]*") or p2
	t_1[p2] = var6
	
	return var6
end

local function selectionSetMatchesResult(value, p3, p4)
	-- upvalues: isNonNullObject (ref), array (ref), selectionSetMatchesResult (ref), isField (ref), shouldInclude (ref), resultKeyNameFromFieldf (ref), hasOwnPropertyModule (ref)
	return if isNonNullObject(p3) then if array.isArray(p3) then array.every(p3, function(p6)
		-- upvalues: selectionSetMatchesResult (copy), value (ref), p4 (ref)
		return selectionSetMatchesResult(value, p6, p4)
	end) else array.every(value.selections, function(p5)
		-- upvalues: isField (copy), shouldInclude (copy), p4 (ref), resultKeyNameFromFieldf (copy), hasOwnPropertyModule (copy), p3 (ref), selectionSetMatchesResult (copy)
		if isField(p5) and shouldInclude(p5, p4) then
			local var7 = resultKeyNameFromFieldf(p5)
			
			return hasOwnPropertyModule(p3, var7) and (not p5.selectionSet or selectionSetMatchesResult(p5.selectionSet, p3[var7], p4))
		end
		return true
	end) else false
end

t.selectionSetMatchesResult = selectionSetMatchesResult

function t.storeValueIsStoreObject(p7)
	-- upvalues: isNonNullObject (ref), isReference (ref), array (ref)
	return isNonNullObject(p7) and (not isReference(p7) and not array.isArray(p7))
end

function t.makeProcessedFieldsMerger()
	-- upvalues: deepMerger (ref)
	return deepMerger.new()
end

return t