local parent = script.Parent.Parent
local luauPolyfillModule = require(parent.LuauPolyfill)
local boolean = luauPolyfillModule.Boolean
local object = luauPolyfillModule.Object
local t = {}
local graphQLModule = require(parent.GraphQL)
local graphQLSchema = graphQLModule.GraphQLSchema
local isNamedType = graphQLModule.isNamedType
local isDirective = graphQLModule.isDirective
local getObjectTypeFromTypeMap = require(script.Parent.getObjectTypeFromTypeMap).getObjectTypeFromTypeMap
local rewireTypes = require(script.Parent.rewire).rewireTypes
local map = luauPolyfillModule.Map

function t.addTypes(p1, p2)
	-- upvalues: map (ref), boolean (ref), isNamedType (ref), isDirective (ref), rewireTypes (ref), object (ref), graphQLSchema (ref), getObjectTypeFromTypeMap (ref)
	local var1 = p1:toConfig()
	local var2 = map.new()
	
	for i, v in var1.types do
		var2:set(v.name, v)
	end
	local t = {}
	
	for i_1, v_1 in var1.directives do
		t[tostring(v_1.name)] = v_1
	end
	for i_2, v_2 in p2 do
		if boolean.toJSBoolean(isNamedType(v_2)) then
			var2:set(v_2.name, v_2)
		elseif boolean.toJSBoolean(isDirective(v_2)) then
			t[v_2.name] = v_2
		end
	end
	local var3 = rewireTypes(var2, object.values(t))
	local typeMap = var3.typeMap
	
	return graphQLSchema.new(object.assign({}, var1, {
		query = getObjectTypeFromTypeMap(typeMap, p1:getQueryType()),
		mutation = getObjectTypeFromTypeMap(typeMap, p1:getMutationType()),
		subscription = getObjectTypeFromTypeMap(typeMap, p1:getSubscriptionType()),
		types = typeMap:values(),
		directives = var3.directives
	}))
end

return t