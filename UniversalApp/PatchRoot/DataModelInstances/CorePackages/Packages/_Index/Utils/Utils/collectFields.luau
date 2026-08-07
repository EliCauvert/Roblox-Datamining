local parent = script.Parent.Parent
local luauPolyfillModule = require(parent.LuauPolyfill)
local array = luauPolyfillModule.Array
local boolean = luauPolyfillModule.Boolean
local map = luauPolyfillModule.Map
local set = luauPolyfillModule.Set
local t = {}
local memoize5 = require(script.Parent.memoize).memoize5
local graphQLModule = require(parent.GraphQL)
local kind = graphQLModule.Kind
local getDirectiveValues = graphQLModule.getDirectiveValues
local graphQLSkipDirective = graphQLModule.GraphQLSkipDirective
local graphQLIncludeDirective = graphQLModule.GraphQLIncludeDirective
local isAbstractType = graphQLModule.isAbstractType
local typeFromAST = graphQLModule.typeFromAST
local shouldIncludeNode = nil
local getFieldEntryKey = nil
local doesFragmentConditionMatch = nil

local function collectFields(p0, p1, p2, p3, p4, p5, p6) --[[ line: 52 ]]
	-- upvalues: kind (ref), boolean (ref), shouldIncludeNode (write), getFieldEntryKey (write), doesFragmentConditionMatch (write), collectFields (ref)
	for i, v in p4.selections do
		local kind_1 = v.kind
		
		if kind_1 == kind.FIELD then
			if boolean.toJSBoolean(shouldIncludeNode(p2, v)) then
				local var7 = getFieldEntryKey(v)
				local var8 = p5:get(var7)
				
				if var8 == nil then
					p5:set(var7, { v })
				else
					table.insert(var8, v)
				end
			end
		elseif kind_1 == kind.INLINE_FRAGMENT then
			if shouldIncludeNode(p2, v) and doesFragmentConditionMatch(p0, v, p3) then
				collectFields(p0, p1, p2, p3, v.selectionSet, p5, p6)
			end
		elseif kind_1 == kind.FRAGMENT_SPREAD then
			local value = v.name.value
			
			if not p6:has(value) and shouldIncludeNode(p2, v) then
				p6:add(value)
				local var9 = p1[tostring(value)]
				
				if boolean.toJSBoolean(var9) and boolean.toJSBoolean(doesFragmentConditionMatch(p0, var9, p3)) then
					collectFields(p0, p1, p2, p3, var9.selectionSet, p5, p6)
				end
			end
		end
	end
	return p5
end

t.collectFields = collectFields

shouldIncludeNode = function(p7, p8) --[[ line: 164 | named "shouldIncludeNode" ]]
	-- upvalues: getDirectiveValues (ref), graphQLSkipDirective (ref), graphQLIncludeDirective (ref)
	local var10 = getDirectiveValues(graphQLSkipDirective, p8, p7)
	
	if (if typeof(var10) == "table" then var10["if"] else nil) == true then
		return false
	end
	local var11 = getDirectiveValues(graphQLIncludeDirective, p8, p7)
	
	return (if typeof(var11) == "table" then var11["if"] else nil) ~= false
end

doesFragmentConditionMatch = function(p9, p10, p11) --[[ line: 184 | named "doesFragmentConditionMatch" ]]
	-- upvalues: boolean (ref), typeFromAST (ref), isAbstractType (ref), array (ref)
	local typeCondition = p10.typeCondition
	
	if not boolean.toJSBoolean(typeCondition) then
		return true
	end
	local var12 = typeFromAST(p9, typeCondition)
	
	return var12 == p11 or (if boolean.toJSBoolean(isAbstractType(var12)) then array.includes(p9:getPossibleTypes(var12), p11) else false)
end

getFieldEntryKey = function(p12) --[[ line: 218 | named "getFieldEntryKey" ]]
	return if p12.alias then p12.alias.value else p12.name.value
end

t.collectSubFields = memoize5(function(p13, p14, p15, p16, p17) --[[ line: 226 ]]
	-- upvalues: map (ref), set (ref), collectFields (ref)
	local var13 = map.new()
	local var14 = set.new()
	
	for i, v in p17 do
		if v.selectionSet then
			collectFields(p13, p14, p15, p16, v.selectionSet, var13, var14)
		end
	end
	return var13
end)

return t