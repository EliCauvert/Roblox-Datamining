local Parent = script.Parent.Parent.Parent
local Parent1 = Parent.Parent
local Array = require(Parent1.LuauPolyfill).Array
local _ = require(Parent1.GraphQL)
local _ = require(script.Parent.types)
local UtilitiesModule = require(Parent.utilities)
local IsReferenceFunction = UtilitiesModule.isReference
local IsFieldFunction = UtilitiesModule.isField
local DeepMerger = UtilitiesModule.DeepMerger
local ResultKeyNameFromFieldfFunction = UtilitiesModule.resultKeyNameFromFieldf
local ShouldIncludeFunction = UtilitiesModule.shouldInclude
local IsNonNullObjectFunction = UtilitiesModule.isNonNullObject
local HasOwnPropertyModule = require(Parent.luaUtils.hasOwnProperty)
local Matches = {}

local function selectionSetMatchesResult(SelectionSet, p1, p2)
	-- upvalues: IsNonNullObjectFunction (copy), Array (copy), selectionSetMatchesResult (copy), IsFieldFunction (copy), ShouldIncludeFunction (copy), ResultKeyNameFromFieldfFunction (copy), HasOwnPropertyModule (copy)
	return if IsNonNullObjectFunction(p1) then if Array.isArray(p1) then Array.every(p1, function(p3)
		-- upvalues: selectionSetMatchesResult (upval), SelectionSet (copy), p2 (copy)
		return selectionSetMatchesResult(SelectionSet, p3, p2)
	end) else Array.every(SelectionSet.selections, function(p3)
		-- upvalues: IsFieldFunction (upval), ShouldIncludeFunction (upval), p2 (copy), ResultKeyNameFromFieldfFunction (upval), HasOwnPropertyModule (upval), p1 (copy), selectionSetMatchesResult (upval)
		if IsFieldFunction(p3) and ShouldIncludeFunction(p3, p2) then
			local ResultKeyNameFromFieldfResult = ResultKeyNameFromFieldfFunction(p3)
			
			return HasOwnPropertyModule(p1, ResultKeyNameFromFieldfResult) and (not p3.selectionSet or selectionSetMatchesResult(p3.selectionSet, p1[ResultKeyNameFromFieldfResult], p2))
		else
			return true
		end
	end) else false
end

return {
	hasOwn = HasOwnPropertyModule,
	getTypenameFromStoreObject = function(p1, p2)
		-- upvalues: IsReferenceFunction (copy)
		return if IsReferenceFunction(p2) then p1:get(p2.__ref, "__typename") elseif p2 then p2.__typename else nil
	end,
	TypeOrFieldNameRegExp = require(Parent1.LuauRegExp)("^[_a-zA-Z][_0-9a-zA-Z]*", "i"),
	fieldNameFromStoreName = function(Text: string)
		-- upvalues: Matches (copy)
		if Matches[Text] then
			return Matches[Text]
		else
			local Match: string = string.match(Text, "^[_a-zA-Z][_0-9a-zA-Z]*") or Text
			Matches[Text] = Match
			
			return Match
		end
	end,
	selectionSetMatchesResult = selectionSetMatchesResult,
	storeValueIsStoreObject = function(p1): boolean
		-- upvalues: IsNonNullObjectFunction (copy), IsReferenceFunction (copy), Array (copy)
		return IsNonNullObjectFunction(p1) and (not IsReferenceFunction(p1) and not Array.isArray(p1))
	end,
	makeProcessedFieldsMerger = function()
		-- upvalues: DeepMerger (copy)
		return DeepMerger.new()
	end
}