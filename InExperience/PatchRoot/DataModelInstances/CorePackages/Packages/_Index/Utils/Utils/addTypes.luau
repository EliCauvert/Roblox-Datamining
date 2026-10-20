local Parent = script.Parent.Parent
local LuauPolyfillModule = require(Parent.LuauPolyfill)
local Boolean = LuauPolyfillModule.Boolean
local Object = LuauPolyfillModule.Object
local GraphQLModule = require(Parent.GraphQL)
local GraphQLSchema = GraphQLModule.GraphQLSchema
local IsNamedTypeFunction = GraphQLModule.isNamedType
local IsDirectiveFunction = GraphQLModule.isDirective
local GetObjectTypeFromTypeMapFunction = require(script.Parent.getObjectTypeFromTypeMap).getObjectTypeFromTypeMap
local RewireTypesFunction = require(script.Parent.rewire).rewireTypes
local Map = LuauPolyfillModule.Map

return {
	addTypes = function(p1, List)
		-- upvalues: Map (copy), Boolean (copy), IsNamedTypeFunction (copy), IsDirectiveFunction (copy), RewireTypesFunction (copy), Object (copy), GraphQLSchema (copy), GetObjectTypeFromTypeMapFunction (copy)
		local Config = p1:toConfig()
		local NewMap = Map.new()
		
		for _, _type in Config.types do
			NewMap:set(_type.name, _type)
		end
		local t = {}
		
		for _, directive in Config.directives do
			t[tostring(directive.name)] = directive
		end
		for _, value in List do
			if Boolean.toJSBoolean(IsNamedTypeFunction(value)) then
				NewMap:set(value.name, value)
			elseif Boolean.toJSBoolean(IsDirectiveFunction(value)) then
				t[value.name] = value
			end
		end
		local RewireTypesResult = RewireTypesFunction(NewMap, (Object.values(t)))
		local TypeMap = RewireTypesResult.typeMap
		
		return GraphQLSchema.new(Object.assign({}, Config, {
			query = GetObjectTypeFromTypeMapFunction(TypeMap, p1:getQueryType()),
			mutation = GetObjectTypeFromTypeMapFunction(TypeMap, p1:getMutationType()),
			subscription = GetObjectTypeFromTypeMapFunction(TypeMap, p1:getSubscriptionType()),
			types = TypeMap:values(),
			directives = RewireTypesResult.directives
		}))
	end
}