local Parent = script.Parent.Parent
local LuauPolyfillModule = require(Parent.LuauPolyfill)
local Array = LuauPolyfillModule.Array
local Boolean = LuauPolyfillModule.Boolean
local Map = LuauPolyfillModule.Map
local Set = LuauPolyfillModule.Set
local GraphQLModule = require(Parent.GraphQL)
local Kind = GraphQLModule.Kind
local GetDirectiveValuesFunction = GraphQLModule.getDirectiveValues
local GraphQLSkipDirective = GraphQLModule.GraphQLSkipDirective
local GraphQLIncludeDirective = GraphQLModule.GraphQLIncludeDirective
local IsAbstractTypeFunction = GraphQLModule.isAbstractType
local TypeFromASTFunction = GraphQLModule.typeFromAST
local Callback = nil
local Callback1 = nil
local Callback2 = nil

local function collectFields(p1, p2, p3, p4, SelectionSet, NewResult, NewResult1)
	-- upvalues: Kind (copy), Boolean (copy), Callback (ref), Callback1 (ref), Callback2 (ref), collectFields (copy)
	for _, selection in SelectionSet.selections do
		local Kind1 = selection.kind
		
		if Kind1 == Kind.FIELD then
			if Boolean.toJSBoolean(Callback(p3, selection)) then
				local CallbackResult = Callback1(selection)
				local GetResult = NewResult:get(CallbackResult)
				
				if GetResult == nil then
					NewResult:set(CallbackResult, { selection })
				else
					table.insert(GetResult, selection)
				end
			end
		elseif Kind1 == Kind.INLINE_FRAGMENT then
			if Callback(p3, selection) and Callback2(p1, selection, p4) then
				collectFields(p1, p2, p3, p4, selection.selectionSet, NewResult, NewResult1)
			end
		elseif Kind1 == Kind.FRAGMENT_SPREAD then
			local Value = selection.name.value
			
			if not NewResult1:has(Value) and Callback(p3, selection) then
				NewResult1:add(Value)
				local v1 = p2[tostring(Value)]
				
				if Boolean.toJSBoolean(v1) and Boolean.toJSBoolean(Callback2(p1, v1, p4)) then
					collectFields(p1, p2, p3, p4, v1.selectionSet, NewResult, NewResult1)
				end
			end
		end
	end
	return NewResult
end

Callback = function(p5, p6): boolean
	-- upvalues: GetDirectiveValuesFunction (copy), GraphQLSkipDirective (copy), GraphQLIncludeDirective (copy)
	local DirectiveValues = GetDirectiveValuesFunction(GraphQLSkipDirective, p6, p5)
	
	if (if typeof(DirectiveValues) == "table" then DirectiveValues["if"] else nil) == true then
		return false
	else
		local DirectiveValues1 = GetDirectiveValuesFunction(GraphQLIncludeDirective, p6, p5)
		
		return (if typeof(DirectiveValues1) == "table" then DirectiveValues1["if"] else nil) ~= false
	end
end

Callback2 = function(p5, p6, p7)
	-- upvalues: Boolean (copy), TypeFromASTFunction (copy), IsAbstractTypeFunction (copy), Array (copy)
	local TypeCondition = p6.typeCondition
	
	if Boolean.toJSBoolean(TypeCondition) then
		local TypeFromASTResult = TypeFromASTFunction(p5, TypeCondition)
		
		return TypeFromASTResult == p7 or (if Boolean.toJSBoolean(IsAbstractTypeFunction(TypeFromASTResult)) then Array.includes(p5:getPossibleTypes(TypeFromASTResult), p7) else false)
	else
		return true
	end
end

Callback1 = function(p5)
	return if p5.alias then p5.alias.value else p5.name.value
end

return {
	collectFields = collectFields,
	collectSubFields = require(script.Parent.memoize).memoize5(function(p5, p6, p7, p8, List)
		-- upvalues: Map (copy), Set (copy), collectFields (copy)
		local NewMap = Map.new()
		local NewSet = Set.new()
		
		for _, value in List do
			if value.selectionSet then
				collectFields(p5, p6, p7, p8, value.selectionSet, NewMap, NewSet)
			end
		end
		return NewMap
	end)
}