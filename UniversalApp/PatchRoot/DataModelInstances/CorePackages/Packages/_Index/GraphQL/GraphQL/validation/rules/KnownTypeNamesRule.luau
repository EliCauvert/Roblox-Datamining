local parent = script.Parent.Parent.Parent
local jsutils = parent.jsutils
local luauPolyfillModule = require(parent.Parent.LuauPolyfill)
local array = luauPolyfillModule.Array
local map = luauPolyfillModule.Map
local object = luauPolyfillModule.Object
local didYouMean = require(jsutils.didYouMean).didYouMean
local suggestionList = require(jsutils.suggestionList).suggestionList
local graphQLError = require(parent.error.GraphQLError).GraphQLError
local predicatesModule = require(parent.language.predicates)
local isTypeDefinitionNode = predicatesModule.isTypeDefinitionNode
local isTypeSystemDefinitionNode = predicatesModule.isTypeSystemDefinitionNode
local isTypeSystemExtensionNode = predicatesModule.isTypeSystemExtensionNode
local type = parent.type
local specifiedScalarTypes = require(type.scalars).specifiedScalarTypes
local introspectionTypes = require(type.introspection).introspectionTypes
local t = {}
local var3 = nil
local isStandardTypeName = nil
local isSDLNode = nil

function t.KnownTypeNamesRule(p0) --[[ line: 43 ]]
	-- upvalues: map (ref), isTypeDefinitionNode (ref), array (ref), object (ref), isSDLNode (write), isStandardTypeName (write), suggestionList (ref), var3 (write), graphQLError (ref), didYouMean (ref)
	local schema = p0:getSchema()
	local var7 = if schema then schema:getTypeMap() else map.new()
	local t = {}
	
	for i, v in ipairs(p0:getDocument().definitions) do
		if isTypeDefinitionNode(v) then
			t[v.name.value] = true
		end
	end
	local var9 = array.concat(var7:keys(), object.keys(t))
	
	return {
		NamedType = function(_, p1, _, p2, _, p3) --[[ line: 65 ]]
			-- upvalues: var7 (write), t (ref), isSDLNode (copy), isStandardTypeName (copy), suggestionList (copy), array (copy), var3 (copy), var9 (ref), p0 (ref), graphQLError (copy), didYouMean (copy)
			local value = p1.name.value
			
			if not var7:get(value) and not t[value] then
				local var10 = p3[3] or p2
				local var11 = var10 ~= nil and isSDLNode(var10)
				
				if var11 and isStandardTypeName(value) then return end
				p0:reportError(graphQLError.new(("Unknown type \"%s\"."):format(value) .. didYouMean(suggestionList(value, var11 and array.concat(var3, var9) or var9)), p1))
			end
		end
	}
end

var3 = array.map(array.concat(specifiedScalarTypes, introspectionTypes), function(p4) --[[ line: 93 ]]
	return p4.name
end)

isStandardTypeName = function(p5) --[[ line: 98 | named "isStandardTypeName" ]]
	-- upvalues: array (ref), var3 (write)
	return array.indexOf(var3, p5) ~= -1
end

isSDLNode = function(p6) --[[ line: 102 | named "isSDLNode" ]]
	-- upvalues: array (ref), isTypeSystemDefinitionNode (ref), isTypeSystemExtensionNode (ref)
	return not array.isArray(p6) and (isTypeSystemDefinitionNode(p6) or isTypeSystemExtensionNode(p6))
end

return t