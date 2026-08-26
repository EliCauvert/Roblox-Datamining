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

function t.getTypenameFromStoreObject(p1, p2)
	-- upvalues: isReference (ref)
	return if isReference(p2) then p1:get(p2.__ref, "__typename") elseif p2 then p2.__typename else nil
end

t.TypeOrFieldNameRegExp = luauRegExpModule("^[_a-zA-Z][_0-9a-zA-Z]*", "i")
local t_1 = {}

function t.fieldNameFromStoreName(p1)
	-- upvalues: t_1 (ref)
	if t_1[p1] then
		return t_1[p1]
	end
	local var1 = string.match(p1, "^[_a-zA-Z][_0-9a-zA-Z]*") or p1
	t_1[p1] = var1
	
	return var1
end

local function selectionSetMatchesResult(value, p1, p2)
	-- upvalues: isNonNullObject (ref), array (ref), selectionSetMatchesResult (ref), isField (ref), shouldInclude (ref), resultKeyNameFromFieldf (ref), hasOwnPropertyModule (ref)
	return if isNonNullObject(p1) then if array.isArray(p1) then array.every(p1, function(p3)
		-- upvalues: selectionSetMatchesResult (copy), value (ref), p2 (ref)
		return selectionSetMatchesResult(value, p3, p2)
	end) else array.every(value.selections, function(p3)
		-- upvalues: isField (copy), shouldInclude (copy), p2 (ref), resultKeyNameFromFieldf (copy), hasOwnPropertyModule (copy), p1 (ref), selectionSetMatchesResult (copy)
		if isField(p3) and shouldInclude(p3, p2) then
			local var1 = resultKeyNameFromFieldf(p3)
			
			return hasOwnPropertyModule(p1, var1) and (not p3.selectionSet or selectionSetMatchesResult(p3.selectionSet, p1[var1], p2))
		end
		return true
	end) else false
end

t.selectionSetMatchesResult = selectionSetMatchesResult

function t.storeValueIsStoreObject(p1)
	-- upvalues: isNonNullObject (ref), isReference (ref), array (ref)
	return isNonNullObject(p1) and (not isReference(p1) and not array.isArray(p1))
end

function t.makeProcessedFieldsMerger()
	-- upvalues: deepMerger (ref)
	return deepMerger.new()
end

return t