local parent = script.Parent.Parent.Parent
local jsutils = parent.jsutils
local array = require(parent.Parent.LuauPolyfill).Array
local didYouMean = require(jsutils.didYouMean).didYouMean
local suggestionList = require(jsutils.suggestionList).suggestionList
local naturalCompare = require(jsutils.naturalCompare).naturalCompare
local graphQLError = require(parent.error.GraphQLError).GraphQLError
local definitionModule = require(parent.type.definition)
local isObjectType = definitionModule.isObjectType
local isInterfaceType = definitionModule.isInterfaceType
local isAbstractType = definitionModule.isAbstractType
local getSuggestedFieldNames = nil
local getSuggestedTypeNames = nil
local t = {
	FieldsOnCorrectTypeRule = function(p1)
		-- upvalues: didYouMean (ref), getSuggestedTypeNames (write), getSuggestedFieldNames (write), graphQLError (ref)
		return {
			Field = function(_, p2)
				-- upvalues: p1 (ref), didYouMean (copy), getSuggestedTypeNames (copy), getSuggestedFieldNames (copy), graphQLError (copy)
				local parentType = p1:getParentType()
				
				if parentType and not p1:getFieldDef() then
					local value = p2.name.value
					local var1 = didYouMean("to use an inline fragment on", getSuggestedTypeNames(p1:getSchema(), parentType, value))
					
					if var1 == "" then
						var1 = didYouMean(getSuggestedFieldNames(parentType, value))
					end
					p1:reportError(graphQLError.new(("Cannot query field \"%s\" on type \"%s\"."):format(value, parentType.name) .. var5, p2))
				end
			end
		}
	end
}

getSuggestedTypeNames = function(p1, p2, p3)
	-- upvalues: isAbstractType (ref), array (ref), isInterfaceType (ref), naturalCompare (ref)
	if not isAbstractType(p2) then
		return {}
	end
	local t = {}
	local t_1 = {}
	
	for i, v in ipairs(p1:getPossibleTypes(p2)) do
		if v:getFields():get(p3) then
			t[v] = true
			t_1[v.name] = 1
			
			for i_1, v_1 in ipairs(v:getInterfaces()) do
				if v_1:getFields():get(p3) then
					t[v_1] = true
					t_1[v_1.name] = (t_1[v_1.name] or 0) + 1
				end
			end
		end
	end
	local t_2 = {}
	
	for i_1, v_1 in pairs(t) do
		table.insert(t_2, i_1)
	end
	array.sort(t_2, function(p4, p5)
		-- upvalues: t_1 (ref), isInterfaceType (copy), p1 (ref), naturalCompare (copy)
		local var1 = t_1[p5.name] - t_1[p4.name]
		
		return if var1 == 0 then if isInterfaceType(p4) and p1:isSubType(p4, p5) then -1 elseif isInterfaceType(p5) and p1:isSubType(p5, p4) then 1 else naturalCompare(p4.name, p5.name) else var1
	end)
	
	return array.map(t_2, function(p4)
		return p4.name
	end)
end

getSuggestedFieldNames = function(p4, p5)
	-- upvalues: isObjectType (ref), isInterfaceType (ref), suggestionList (ref)
	return if isObjectType(p4) or isInterfaceType(p4) then suggestionList(p5, p4:getFields():keys()) else {}
end

return t