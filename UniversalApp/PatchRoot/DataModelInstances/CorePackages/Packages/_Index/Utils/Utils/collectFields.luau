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

local function collectFields(p1, p2, p3, p4, p5, p6, p7)
	-- upvalues: kind (ref), boolean (ref), shouldIncludeNode (write), getFieldEntryKey (write), doesFragmentConditionMatch (write), collectFields (ref)
	for i, v in p5.selections do
		local kind_1 = v.kind
		
		if kind_1 == kind.FIELD then
			if boolean.toJSBoolean(shouldIncludeNode(p3, v)) then
				local var1 = getFieldEntryKey(v)
				local var2 = p6:get(var1)
				
				if var2 == nil then
					p6:set(var1, { v })
				else
					table.insert(var2, v)
				end
			end
		elseif kind_1 == kind.INLINE_FRAGMENT then
			if shouldIncludeNode(p3, v) and doesFragmentConditionMatch(p1, v, p4) then
				collectFields(p1, p2, p3, p4, v.selectionSet, p6, p7)
			end
		elseif kind_1 == kind.FRAGMENT_SPREAD then
			local value = v.name.value
			
			if not p7:has(value) and shouldIncludeNode(p3, v) then
				p7:add(value)
				local var3 = p2[tostring(value)]
				
				if boolean.toJSBoolean(var3) and boolean.toJSBoolean(doesFragmentConditionMatch(p1, var3, p4)) then
					collectFields(p1, p2, p3, p4, var3.selectionSet, p6, p7)
				end
			end
		end
	end
	return p6
end

t.collectFields = collectFields

shouldIncludeNode = function(p8, p9)
	-- upvalues: getDirectiveValues (ref), graphQLSkipDirective (ref), graphQLIncludeDirective (ref)
	local var4 = getDirectiveValues(graphQLSkipDirective, p9, p8)
	
	if (if typeof(var4) == "table" then var4["if"] else nil) == true then
		return false
	end
	local var5 = getDirectiveValues(graphQLIncludeDirective, p9, p8)
	
	return (if typeof(var5) == "table" then var5["if"] else nil) ~= false
end

doesFragmentConditionMatch = function(p8, p9, p10)
	-- upvalues: boolean (ref), typeFromAST (ref), isAbstractType (ref), array (ref)
	local typeCondition = p9.typeCondition
	
	if not boolean.toJSBoolean(typeCondition) then
		return true
	end
	local var4 = typeFromAST(p8, typeCondition)
	
	return var4 == p10 or (if boolean.toJSBoolean(isAbstractType(var4)) then array.includes(p8:getPossibleTypes(var4), p10) else false)
end

getFieldEntryKey = function(p8)
	return if p8.alias then p8.alias.value else p8.name.value
end

t.collectSubFields = memoize5(function(p8, p9, p10, p11, p12)
	-- upvalues: map (ref), set (ref), collectFields (ref)
	local var4 = map.new()
	local var5 = set.new()
	
	for i, v in p12 do
		if v.selectionSet then
			collectFields(p8, p9, p10, p11, v.selectionSet, var4, var5)
		end
	end
	return var4
end)

return t