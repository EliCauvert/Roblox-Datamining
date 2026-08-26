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
local var1 = nil
local isStandardTypeName = nil
local isSDLNode = nil

function t.KnownTypeNamesRule(p1)
	-- upvalues: map (ref), isTypeDefinitionNode (ref), array (ref), object (ref), isSDLNode (write), isStandardTypeName (write), suggestionList (ref), var1 (write), graphQLError (ref), didYouMean (ref)
	local schema = p1:getSchema()
	local var2 = if schema then schema:getTypeMap() else map.new()
	local t = {}
	
	for i, v in ipairs(p1:getDocument().definitions) do
		if isTypeDefinitionNode(v) then
			t[v.name.value] = true
		end
	end
	local var3 = array.concat(var2:keys(), object.keys(t))
	
	return {
		NamedType = function(_, p2, _, p3, _, p4)
			-- upvalues: var2 (write), t (ref), isSDLNode (copy), isStandardTypeName (copy), suggestionList (copy), array (copy), var1 (copy), var3 (ref), p1 (ref), graphQLError (copy), didYouMean (copy)
			local value = p2.name.value
			
			if not var2:get(value) and not t[value] then
				local var4 = p4[3] or p3
				local var5 = var4 ~= nil and isSDLNode(var4)
				
				if var5 and isStandardTypeName(value) then return end
				p1:reportError(graphQLError.new(("Unknown type \"%s\"."):format(value) .. didYouMean(suggestionList(value, var5 and array.concat(var1, var3) or var3)), p2))
			end
		end
	}
end

var1 = array.map(array.concat(specifiedScalarTypes, introspectionTypes), function(p2)
	return p2.name
end)

isStandardTypeName = function(p2)
	-- upvalues: array (ref), var1 (write)
	return array.indexOf(var1, p2) ~= -1
end

isSDLNode = function(p2)
	-- upvalues: array (ref), isTypeSystemDefinitionNode (ref), isTypeSystemExtensionNode (ref)
	return not array.isArray(p2) and (isTypeSystemDefinitionNode(p2) or isTypeSystemExtensionNode(p2))
end

return t