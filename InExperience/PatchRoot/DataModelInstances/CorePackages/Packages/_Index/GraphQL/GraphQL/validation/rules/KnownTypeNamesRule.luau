local Parent = script.Parent.Parent.Parent
local Jsutils = Parent.jsutils
local LuauPolyfillModule = require(Parent.Parent.LuauPolyfill)
local Array = LuauPolyfillModule.Array
local Map = LuauPolyfillModule.Map
local Object = LuauPolyfillModule.Object
local DidYouMeanFunction = require(Jsutils.didYouMean).didYouMean
local SuggestionListFunction = require(Jsutils.suggestionList).suggestionList
local GraphQLError = require(Parent.error.GraphQLError).GraphQLError
local PredicatesModule = require(Parent.language.predicates)
local IsTypeDefinitionNodeFunction = PredicatesModule.isTypeDefinitionNode
local IsTypeSystemDefinitionNodeFunction = PredicatesModule.isTypeSystemDefinitionNode
local IsTypeSystemExtensionNodeFunction = PredicatesModule.isTypeSystemExtensionNode
local Type = Parent.type
local MapResult = nil
local Callback1 = nil
local Callback = nil
local KnownTypeNamesRuleModule = {
	KnownTypeNamesRule = function(p1) --[[ Line: 43 ]]
		-- upvalues: Map (copy), IsTypeDefinitionNodeFunction (copy), Array (copy), Object (copy), Callback (ref), Callback1 (ref), SuggestionListFunction (copy), MapResult (ref), GraphQLError (copy), DidYouMeanFunction (copy)
		local Schema = p1:getSchema()
		local TypeMap = if Schema then Schema:getTypeMap() else Map.new()
		local t = {}
		
		for _, definition in ipairs(p1:getDocument().definitions) do
			if IsTypeDefinitionNodeFunction(definition) then
				t[definition.name.value] = true
			end
		end
		local ConcatResult = Array.concat(TypeMap:keys(), Object.keys(t))
		
		return {
			NamedType = function(_, p2, _, p3, _, Entry) --[[ Line: 65 ]]
				-- upvalues: TypeMap (ref), t (copy), Callback (upval), Callback1 (upval), SuggestionListFunction (upval), Array (upval), MapResult (upval), ConcatResult (copy), p1 (copy), GraphQLError (upval), DidYouMeanFunction (upval)
				local Value = p2.name.value
				
				if not TypeMap:get(Value) and not t[Value] then
					local Entry1 = Entry[3] or p3
					local CallbackResult = Entry1 ~= nil and Callback(Entry1)
					
					if CallbackResult and Callback1(Value) then return end
					p1:reportError(GraphQLError.new(("Unknown type \"%s\"."):format(Value) .. DidYouMeanFunction((SuggestionListFunction(Value, CallbackResult and Array.concat(MapResult, ConcatResult) or ConcatResult))), p2))
				end
			end
		}
	end
}
MapResult = Array.map(Array.concat(require(Type.scalars).specifiedScalarTypes, require(Type.introspection).introspectionTypes), function(p2) --[[ Line: 93 ]]
	return p2.name
end)

Callback1 = function(p2): boolean --[[ Line: 98 | Named "isStandardTypeName" ]]
	-- upvalues: Array (copy), MapResult (ref)
	return Array.indexOf(MapResult, p2) ~= -1
end

Callback = function(p2) --[[ Line: 102 | Named "isSDLNode" ]]
	-- upvalues: Array (copy), IsTypeSystemDefinitionNodeFunction (copy), IsTypeSystemExtensionNodeFunction (copy)
	return not Array.isArray(p2) and (IsTypeSystemDefinitionNodeFunction(p2) or IsTypeSystemExtensionNodeFunction(p2))
end

return KnownTypeNamesRuleModule