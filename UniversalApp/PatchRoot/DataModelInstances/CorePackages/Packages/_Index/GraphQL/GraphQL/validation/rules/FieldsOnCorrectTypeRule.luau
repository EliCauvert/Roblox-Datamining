local Parent = script.Parent.Parent.Parent
local Jsutils = Parent.jsutils
local Array = require(Parent.Parent.LuauPolyfill).Array
local DidYouMeanFunction = require(Jsutils.didYouMean).didYouMean
local SuggestionListFunction = require(Jsutils.suggestionList).suggestionList
local NaturalCompareFunction = require(Jsutils.naturalCompare).naturalCompare
local GraphQLError = require(Parent.error.GraphQLError).GraphQLError
local DefinitionModule = require(Parent.type.definition)
local IsObjectTypeFunction = DefinitionModule.isObjectType
local IsInterfaceTypeFunction = DefinitionModule.isInterfaceType
local IsAbstractTypeFunction = DefinitionModule.isAbstractType
local Callback1 = nil
local Callback = nil
local FieldsOnCorrectTypeRuleModule = {
	FieldsOnCorrectTypeRule = function(p1) --[[ Line: 36 ]]
		-- upvalues: DidYouMeanFunction (copy), Callback (ref), Callback1 (ref), GraphQLError (copy)
		return {
			Field = function(_, p2) --[[ Line: 38 ]]
				-- upvalues: p1 (copy), DidYouMeanFunction (upval), Callback (upval), Callback1 (upval), GraphQLError (upval)
				local ParentType = p1:getParentType()
				
				if ParentType and not p1:getFieldDef() then
					local Value = p2.name.value
					local ToUseAnInlineFragmentOn = DidYouMeanFunction("to use an inline fragment on", Callback(p1:getSchema(), ParentType, Value))
					
					if ToUseAnInlineFragmentOn == "" then
						ToUseAnInlineFragmentOn = DidYouMeanFunction(Callback1(ParentType, Value))
					end
					p1:reportError(GraphQLError.new(("Cannot query field \"%s\" on type \"%s\"."):format(Value, ParentType.name) .. ToUseAnInlineFragmentOn, p2))
				end
			end
		}
	end
}

Callback = function(Schema, ParentType, p1) --[[ Line: 77 | Named "getSuggestedTypeNames" ]]
	-- upvalues: IsAbstractTypeFunction (copy), Array (copy), IsInterfaceTypeFunction (copy), NaturalCompareFunction (copy)
	if not IsAbstractTypeFunction(ParentType) then
		return {}
	end
	local t = {}
	local t1 = {}
	
	for _, possibleType in ipairs(Schema:getPossibleTypes(ParentType)) do
		if possibleType:getFields():get(p1) then
			t[possibleType] = true
			t1[possibleType.name] = 1
			
			for _, interface in ipairs(possibleType:getInterfaces()) do
				if interface:getFields():get(p1) then
					t[interface] = true
					t1[interface.name] = (t1[interface.name] or 0) + 1
				end
			end
		end
	end
	local List = {}
	
	for i, _ in pairs(t) do
		table.insert(List, i)
	end
	Array.sort(List, function(p2, p3) --[[ Line: 114 ]]
		-- upvalues: t1 (copy), IsInterfaceTypeFunction (upval), Schema (copy), NaturalCompareFunction (upval)
		local EntryDelta = t1[p3.name] - t1[p2.name]
		
		return if EntryDelta == 0 then if IsInterfaceTypeFunction(p2) and Schema:isSubType(p2, p3) then -1 elseif IsInterfaceTypeFunction(p3) and Schema:isSubType(p3, p2) then 1 else NaturalCompareFunction(p2.name, p3.name) else EntryDelta
	end)
	
	return Array.map(List, function(p2) --[[ Line: 131 ]]
		return p2.name
	end)
end

Callback1 = function(ParentType, p2) --[[ Line: 140 | Named "getSuggestedFieldNames" ]]
	-- upvalues: IsObjectTypeFunction (copy), IsInterfaceTypeFunction (copy), SuggestionListFunction (copy)
	return if IsObjectTypeFunction(ParentType) or IsInterfaceTypeFunction(ParentType) then SuggestionListFunction(p2, (ParentType:getFields():keys())) else {}
end

return FieldsOnCorrectTypeRuleModule