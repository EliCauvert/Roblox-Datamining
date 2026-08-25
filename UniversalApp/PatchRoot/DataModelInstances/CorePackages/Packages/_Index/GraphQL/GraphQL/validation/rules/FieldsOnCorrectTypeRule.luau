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
	FieldsOnCorrectTypeRule = function(p0)
		-- upvalues: didYouMean (ref), getSuggestedTypeNames (write), getSuggestedFieldNames (write), graphQLError (ref)
		return {
			Field = function(_, p1)
				-- upvalues: p0 (ref), didYouMean (copy), getSuggestedTypeNames (copy), getSuggestedFieldNames (copy), graphQLError (copy)
				local parentType = p0:getParentType()
				
				if parentType and not p0:getFieldDef() then
					local value = p1.name.value
					local var5 = didYouMean("to use an inline fragment on", getSuggestedTypeNames(p0:getSchema(), parentType, value))
					
					if var5 == "" then
						var5 = didYouMean(getSuggestedFieldNames(parentType, value))
					end
					p0:reportError(graphQLError.new(("Cannot query field \"%s\" on type \"%s\"."):format(value, parentType.name) .. var5, p1))
				end
			end
		}
	end
}

getSuggestedTypeNames = function(p2, p3, p4)
	-- upvalues: isAbstractType (ref), array (ref), isInterfaceType (ref), naturalCompare (ref)
	if not isAbstractType(p3) then
		return {}
	end
	local t = {}
	local t_1 = {}
	
	for i, v in ipairs(p2:getPossibleTypes(p3)) do
		if v:getFields():get(p4) then
			t[v] = true
			t_1[v.name] = 1
			
			for i_1, v_1 in ipairs(v:getInterfaces()) do
				if v_1:getFields():get(p4) then
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
	array.sort(t_2, function(p5, p6)
		-- upvalues: t_1 (ref), isInterfaceType (copy), p2 (ref), naturalCompare (copy)
		local var9 = t_1[p6.name] - t_1[p5.name]
		
		return if var9 == 0 then if isInterfaceType(p5) and p2:isSubType(p5, p6) then -1 elseif isInterfaceType(p6) and p2:isSubType(p6, p5) then 1 else naturalCompare(p5.name, p6.name) else var9
	end)
	
	return array.map(t_2, function(p7)
		return p7.name
	end)
end

getSuggestedFieldNames = function(p8, p9)
	-- upvalues: isObjectType (ref), isInterfaceType (ref), suggestionList (ref)
	return if isObjectType(p8) or isInterfaceType(p8) then suggestionList(p9, p8:getFields():keys()) else {}
end

return t