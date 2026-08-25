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

function t.addTypes(p0, p1)
	-- upvalues: map (ref), boolean (ref), isNamedType (ref), isDirective (ref), rewireTypes (ref), object (ref), graphQLSchema (ref), getObjectTypeFromTypeMap (ref)
	local var3 = p0:toConfig()
	local var4 = map.new()
	
	for i, v in var3.types do
		var4:set(v.name, v)
	end
	local t = {}
	
	for i_1, v_1 in var3.directives do
		t[tostring(v_1.name)] = v_1
	end
	for i_2, v_2 in p1 do
		if boolean.toJSBoolean(isNamedType(v_2)) then
			var4:set(v_2.name, v_2)
		elseif boolean.toJSBoolean(isDirective(v_2)) then
			t[v_2.name] = v_2
		end
	end
	local var6 = rewireTypes(var4, object.values(t))
	local typeMap = var6.typeMap
	
	return graphQLSchema.new(object.assign({}, var3, {
		query = getObjectTypeFromTypeMap(typeMap, p0:getQueryType()),
		mutation = getObjectTypeFromTypeMap(typeMap, p0:getMutationType()),
		subscription = getObjectTypeFromTypeMap(typeMap, p0:getSubscriptionType()),
		types = typeMap:values(),
		directives = var6.directives
	}))
end

return t