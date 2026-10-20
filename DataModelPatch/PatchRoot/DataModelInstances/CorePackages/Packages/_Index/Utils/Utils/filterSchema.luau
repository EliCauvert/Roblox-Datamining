local Parent = script.Parent.Parent
local LuauPolyfillModule = require(Parent.LuauPolyfill)
local Array = LuauPolyfillModule.Array
local Boolean = LuauPolyfillModule.Boolean
local Object = LuauPolyfillModule.Object
local GraphQLModule = require(Parent.GraphQL)
local GraphQLInputObjectType = GraphQLModule.GraphQLInputObjectType
local GraphQLInterfaceType = GraphQLModule.GraphQLInterfaceType
local GraphQLObjectType = GraphQLModule.GraphQLObjectType
local MapperKind = require(script.Parent.Interfaces).MapperKind
local MapSchemaFunction = require(script.Parent.mapSchema).mapSchema
local _ = require(script.Parent.types)
local Callback = nil
local Callback1 = nil
local FilterSchemaModule = {
	filterSchema = function(p1)
		-- upvalues: MapSchemaFunction (copy), MapperKind (copy), Callback (ref), Boolean (copy), Callback1 (ref), GraphQLObjectType (copy), Object (copy), GraphQLInterfaceType (copy), GraphQLInputObjectType (copy)
		local TypeFilter = if p1.typeFilter == nil then function(...): boolean
			return true
		end else p1.typeFilter
		local FieldFilter = if p1.fieldFilter == nil then nil else p1.fieldFilter
		local RootFieldFilter = if p1.rootFieldFilter == nil then nil else p1.rootFieldFilter
		local ObjectFieldFilter = if p1.objectFieldFilter == nil then nil else p1.objectFieldFilter
		local InterfaceFieldFilter = if p1.interfaceFieldFilter == nil then nil else p1.interfaceFieldFilter
		local InputObjectFieldFilter = if p1.inputObjectFieldFilter == nil then nil else p1.inputObjectFieldFilter
		local ArgumentFilter = if p1.argumentFilter == nil then nil else p1.argumentFilter
		
		return (MapSchemaFunction(p1.schema, {
			[MapperKind.QUERY] = function(p2)
				-- upvalues: Callback (upval), RootFieldFilter (copy), ArgumentFilter (copy)
				return Callback(p2, "Query", RootFieldFilter, ArgumentFilter)
			end,
			[MapperKind.MUTATION] = function(p2)
				-- upvalues: Callback (upval), RootFieldFilter (copy), ArgumentFilter (copy)
				return Callback(p2, "Mutation", RootFieldFilter, ArgumentFilter)
			end,
			[MapperKind.SUBSCRIPTION] = function(p2)
				-- upvalues: Callback (upval), RootFieldFilter (copy), ArgumentFilter (copy)
				return Callback(p2, "Subscription", RootFieldFilter, ArgumentFilter)
			end,
			[MapperKind.OBJECT_TYPE] = function(p2)
				-- upvalues: Boolean (upval), TypeFilter (copy), Callback1 (upval), GraphQLObjectType (upval), ObjectFieldFilter (copy), FieldFilter (copy), ArgumentFilter (copy), Object (upval)
				return if Boolean.toJSBoolean(TypeFilter(p2.name, p2)) then Callback1(GraphQLObjectType, p2, Boolean.toJSBoolean(ObjectFieldFilter) and ObjectFieldFilter or FieldFilter, ArgumentFilter) else Object.None
			end,
			[MapperKind.INTERFACE_TYPE] = function(p2)
				-- upvalues: Boolean (upval), TypeFilter (copy), Callback1 (upval), GraphQLInterfaceType (upval), InterfaceFieldFilter (copy), FieldFilter (copy), ArgumentFilter (copy), Object (upval)
				return if Boolean.toJSBoolean(TypeFilter(p2.name, p2)) then Callback1(GraphQLInterfaceType, p2, Boolean.toJSBoolean(InterfaceFieldFilter) and InterfaceFieldFilter or FieldFilter, ArgumentFilter) else Object.None
			end,
			[MapperKind.INPUT_OBJECT_TYPE] = function(p2)
				-- upvalues: Boolean (upval), TypeFilter (copy), Callback1 (upval), GraphQLInputObjectType (upval), InputObjectFieldFilter (copy), FieldFilter (copy), Object (upval)
				return if Boolean.toJSBoolean(TypeFilter(p2.name, p2)) then Callback1(GraphQLInputObjectType, p2, Boolean.toJSBoolean(InputObjectFieldFilter) and InputObjectFieldFilter or FieldFilter) else Object.None
			end,
			[MapperKind.UNION_TYPE] = function(p2)
				-- upvalues: Boolean (upval), TypeFilter (copy), Object (upval)
				return if Boolean.toJSBoolean(TypeFilter(p2.name, p2)) then nil else Object.None
			end,
			[MapperKind.ENUM_TYPE] = function(p2)
				-- upvalues: Boolean (upval), TypeFilter (copy), Object (upval)
				return if Boolean.toJSBoolean(TypeFilter(p2.name, p2)) then nil else Object.None
			end,
			[MapperKind.SCALAR_TYPE] = function(p2)
				-- upvalues: Boolean (upval), TypeFilter (copy), Object (upval)
				return if Boolean.toJSBoolean(TypeFilter(p2.name, p2)) then nil else Object.None
			end
		}))
	end
}

Callback = function(p1, p2, Callback, Callback1)
	-- upvalues: Boolean (copy), GraphQLObjectType (copy)
	if not Boolean.toJSBoolean(Boolean.toJSBoolean(Callback) and Callback or Callback1) then
		return p1
	end
	local Config = p1:toConfig()
	
	for _, field in Config.fields do
		local Unpacked = table.unpack(field)
		local GetResult = Config.fields:get(Unpacked)
		
		if if Callback then not Callback(p2, Unpacked, (Config.fields:get(Unpacked))) else Callback then
			Config.fields:delete(Unpacked)
		elseif Boolean.toJSBoolean(if Boolean.toJSBoolean(Callback1) then GetResult.args else Callback1) then
			for _, arg in GetResult.args do
				local Unpacked1 = table.unpack(arg)
				
				if not Callback1(p2, Unpacked, Unpacked1, GetResult.args:get(Unpacked1)) then
					GetResult.args:delete(Unpacked1)
				end
			end
		end
	end
	return GraphQLObjectType.new(Config)
end

Callback1 = function(GraphQLInputObjectType, p3, Callback, Callback1)
	-- upvalues: Boolean (copy), Array (copy), Object (copy)
	if not Boolean.toJSBoolean(Boolean.toJSBoolean(Callback) and Callback or Callback1) then
		return nil
	end
	local Config = p3:toConfig()
	
	for _, field in Config.fields do
		local Unpacked = table.unpack(field)
		local GetResult = Config.fields:get(Unpacked)
		
		if Boolean.toJSBoolean(if Callback then not Callback(p3.name, Unpacked, Config.fields:get(Unpacked)) else Callback) then
			Config.fields:delete(Unpacked)
		elseif Boolean.toJSBoolean(if Boolean.toJSBoolean(Callback1) then Array.indexOf(Object.keys(GetResult), "args") ~= -1 else Callback1) then
			for _, arg in GetResult.args do
				local Unpacked1 = table.unpack(arg)
				
				if not Boolean.toJSBoolean(Callback1(p3.name, Unpacked, Unpacked1, GetResult.args:get(Unpacked1))) then
					GetResult.args:delete(Unpacked1)
				end
			end
		end
	end
	return GraphQLInputObjectType.new(Config)
end

return FilterSchemaModule