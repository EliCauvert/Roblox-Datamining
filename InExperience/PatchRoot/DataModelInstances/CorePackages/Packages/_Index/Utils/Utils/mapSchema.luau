local Parent = script.Parent.Parent
local LuauPolyfillModule = require(Parent.LuauPolyfill)
local Array = LuauPolyfillModule.Array
local Boolean = LuauPolyfillModule.Boolean
local Object = LuauPolyfillModule.Object
local MapSchemaModule = {}
local GraphQLModule = require(Parent.GraphQL)
local GraphQLObjectType = GraphQLModule.GraphQLObjectType
local GraphQLSchema = GraphQLModule.GraphQLSchema
local IsInterfaceTypeFunction = GraphQLModule.isInterfaceType
local IsEnumTypeFunction = GraphQLModule.isEnumType
local IsObjectTypeFunction = GraphQLModule.isObjectType
local IsScalarTypeFunction = GraphQLModule.isScalarType
local IsUnionTypeFunction = GraphQLModule.isUnionType
local IsInputObjectTypeFunction = GraphQLModule.isInputObjectType
local GraphQLInputObjectType = GraphQLModule.GraphQLInputObjectType
local GraphQLInterfaceType = GraphQLModule.GraphQLInterfaceType
local IsLeafTypeFunction = GraphQLModule.isLeafType
local IsListTypeFunction = GraphQLModule.isListType
local IsNonNullTypeFunction = GraphQLModule.isNonNullType
local IsNamedTypeFunction = GraphQLModule.isNamedType
local GraphQLList = GraphQLModule.GraphQLList
local GraphQLNonNull = GraphQLModule.GraphQLNonNull
local GraphQLEnumType = GraphQLModule.GraphQLEnumType
local Kind = GraphQLModule.Kind
local GetObjectTypeFromTypeMapFunction = require(script.Parent.getObjectTypeFromTypeMap).getObjectTypeFromTypeMap
local MapperKind = require(script.Parent.Interfaces).MapperKind
local RewireTypesFunction = require(script.Parent.rewire).rewireTypes
local TransformInputValueModule = require(script.Parent.transformInputValue)
local SerializeInputValue = TransformInputValueModule.serializeInputValue
local ParseInputValue = TransformInputValueModule.parseInputValue
local Map = LuauPolyfillModule.Map
local String = LuauPolyfillModule.String
local Callback2 = nil
local Callback = nil
local Callback1 = nil
local Callback3 = nil
local Callback4 = nil
local Callback7 = nil
local Callback12 = nil
local Callback5 = nil
local Callback10 = nil
local Callback6 = nil
local Callback11 = nil
local Callback9 = nil
local Callback8 = nil

function MapSchemaModule.mapSchema(p1, p2) --[[ Line: 172 ]]
	-- upvalues: Callback (ref), Callback1 (ref), Callback2 (ref), Callback3 (ref), Callback4 (ref), SerializeInputValue (copy), IsLeafTypeFunction (copy), ParseInputValue (copy), Boolean (copy), Callback5 (ref), RewireTypesFunction (copy), GraphQLSchema (copy), Object (copy), GetObjectTypeFromTypeMapFunction (copy)
	local T = if p2 == nil then {} else p2
	local CallbackResult = Callback(Callback1(Callback2(Callback3(Callback4(Callback2(Callback3(p1:getTypeMap(), p1, SerializeInputValue), p1, T, function(p3) --[[ Line: 183 ]]
		-- upvalues: IsLeafTypeFunction (upval)
		return IsLeafTypeFunction(p3)
	end), p1, T), p1, ParseInputValue), p1, T, function(p3): boolean --[[ Line: 195 ]]
		-- upvalues: Boolean (upval), IsLeafTypeFunction (upval)
		return not Boolean.toJSBoolean(IsLeafTypeFunction(p3))
	end), p1, T), p1, T)
	local RewireTypesResult = RewireTypesFunction(CallbackResult, (Callback5(p1:getDirectives(), p1, T)))
	local TypeMap = RewireTypesResult.typeMap
	
	return GraphQLSchema.new(Object.assign({}, p1:toConfig(), {
		query = GetObjectTypeFromTypeMapFunction(TypeMap, GetObjectTypeFromTypeMapFunction(CallbackResult, p1:getQueryType())) or Object.None,
		mutation = GetObjectTypeFromTypeMapFunction(TypeMap, GetObjectTypeFromTypeMapFunction(CallbackResult, p1:getMutationType())) or Object.None,
		subscription = GetObjectTypeFromTypeMapFunction(TypeMap, GetObjectTypeFromTypeMapFunction(CallbackResult, p1:getSubscriptionType())) or Object.None,
		types = TypeMap:values() or Object.None,
		directives = RewireTypesResult.directives or Object.None
	}))
end

Callback2 = function(List, p1, p2, p3) --[[ Line: 241 | Named "mapTypes" ]]
	-- upvalues: Map (copy), String (copy), Object (copy), Callback6 (ref)
	local Callback = if p3 == nil then function(): boolean --[[ Line: 256 ]]
		return true
	end else p3
	local NewMap = Map.new()
	
	for _, value in List do
		local Unpacked = table.unpack(value)
		
		if not String.startsWith(Unpacked, "__") then
			local GetResult = List:get(Unpacked)
			
			if GetResult == nil or GetResult == Object.None or not Callback(GetResult) then
				NewMap:set(Unpacked, GetResult)
			else
				local CallbackResult = Callback6(p1, p2, Unpacked)
				
				if CallbackResult == nil or CallbackResult == Object.None then
					NewMap:set(Unpacked, GetResult)
				else
					local CallbackResultResult = CallbackResult(GetResult, p1)
					
					if CallbackResultResult == nil then
						NewMap:set(Unpacked, GetResult)
					else
						NewMap:set(Unpacked, CallbackResultResult)
					end
				end
			end
		end
	end
	return NewMap
end

Callback4 = function(p4, p5, p6) --[[ Line: 313 | Named "mapEnumValues" ]]
	-- upvalues: Callback7 (ref), Boolean (copy), Callback2 (ref), MapperKind (copy), Map (copy), Array (copy), Object (copy), Callback8 (ref), GraphQLEnumType (copy), IsEnumTypeFunction (copy)
	local CallbackResult = Callback7(p6)
	
	return if Boolean.toJSBoolean(CallbackResult) then Callback2(p4, p5, {
		[tostring(MapperKind.ENUM_TYPE)] = function(p7) --[[ Line: 337 ]]
			-- upvalues: Map (upval), CallbackResult (copy), p5 (copy), Boolean (upval), Array (upval), Object (upval), Callback8 (upval), GraphQLEnumType (upval)
			local Config = p7:toConfig()
			local Values = Config.values
			local NewMap = Map.new()
			
			for _, value in Values do
				local Unpacked = table.unpack(value)
				local GetResult = Values:get(Unpacked)
				local CallbackResultResult = CallbackResult(GetResult, p7.name, p5, Unpacked)
				
				if CallbackResultResult == nil then
					NewMap:set(Unpacked, GetResult)
				elseif Boolean.toJSBoolean(Array.isArray(CallbackResultResult)) then
					local Unpacked1, Unpacked2 = table.unpack(CallbackResultResult, 1, 2)
					NewMap:set(Unpacked1, if Unpacked2 == nil then GetResult else Unpacked2)
				elseif CallbackResultResult ~= Object.None then
					NewMap:set(Unpacked, CallbackResultResult)
				end
			end
			return (Callback8(GraphQLEnumType.new(Object.assign({}, Config, { values = NewMap }))))
		end
	}, function(p8) --[[ Line: 391 ]]
		-- upvalues: IsEnumTypeFunction (upval)
		return IsEnumTypeFunction(p8)
	end) else p4
end

Callback3 = function(TypeMap, p7, Callback2) --[[ Line: 399 | Named "mapDefaultValues" ]]
	-- upvalues: Callback (ref), MapperKind (copy), Callback9 (ref), Object (copy), Callback1 (ref)
	local CallbackResult = Callback(TypeMap, p7, {
		[MapperKind.ARGUMENT] = function(p8) --[[ Line: 421 ]]
			-- upvalues: Callback9 (upval), TypeMap (copy), Object (upval), Callback2 (copy)
			if p8.defaultValue == nil then
				return p8
			else
				local CallbackResult = Callback9(TypeMap, p8.type)
				
				return if CallbackResult == nil then nil else Object.assign({}, p8, {
					defaultValue = Callback2(CallbackResult, p8.defaultValue)
				})
			end
		end
	})
	
	return Callback1(CallbackResult, p7, {
		[MapperKind.INPUT_OBJECT_FIELD] = function(p8) --[[ Line: 456 ]]
			-- upvalues: Callback9 (upval), CallbackResult (copy), Object (upval), Callback2 (copy)
			if p8.defaultValue == nil then
				return p8
			else
				local CallbackResult1 = Callback9(CallbackResult, p8.type)
				
				return if CallbackResult1 == nil then nil else Object.assign({}, p8, {
					defaultValue = Callback2(CallbackResult1, p8.defaultValue)
				})
			end
		end
	})
end

Callback9 = function(p7, OfType) --[[ Line: 487 | Named "getNewType" ]]
	-- upvalues: Boolean (copy), IsListTypeFunction (copy), Callback9 (ref), GraphQLList (copy), IsNonNullTypeFunction (copy), GraphQLNonNull (copy), IsNamedTypeFunction (copy)
	if Boolean.toJSBoolean(IsListTypeFunction(OfType)) then
		local CallbackResult = Callback9(p7, OfType.ofType)
		
		return if CallbackResult == nil then nil else GraphQLList.new(CallbackResult)
	elseif Boolean.toJSBoolean(IsNonNullTypeFunction(OfType)) then
		local CallbackResult = Callback9(p7, OfType.ofType)
		
		return if CallbackResult == nil then nil else GraphQLNonNull.new(CallbackResult)
	elseif Boolean.toJSBoolean(IsNamedTypeFunction(OfType)) then
		local GetResult = p7:get(OfType.name)
		
		return if GetResult == nil then nil else GetResult
	else
		return nil
	end
end

Callback1 = function(List, p7, p8) --[[ Line: 521 | Named "mapFields" ]]
	-- upvalues: Map (copy), String (copy), Boolean (copy), IsObjectTypeFunction (copy), IsInterfaceTypeFunction (copy), IsInputObjectTypeFunction (copy), Callback10 (ref), Object (copy), Array (copy), Callback8 (ref), GraphQLObjectType (copy), GraphQLInterfaceType (copy), GraphQLInputObjectType (copy)
	local NewMap = Map.new()
	
	for _, value in List do
		local Unpacked = table.unpack(value)
		
		if not String.startsWith(Unpacked, "__") then
			local GetResult = List:get(Unpacked)
			
			if Boolean.toJSBoolean(IsObjectTypeFunction(GetResult)) or Boolean.toJSBoolean(IsInterfaceTypeFunction(GetResult)) or Boolean.toJSBoolean(IsInputObjectTypeFunction(GetResult)) then
				local CallbackResult = Callback10(p7, p8, Unpacked)
				
				if CallbackResult == nil or CallbackResult == Object.None then
					NewMap:set(Unpacked, GetResult)
					continue
				end
				local Config = GetResult:toConfig()
				local Fields = Config.fields
				local NewMap1 = Map.new()
				
				for _, field in Fields do
					local Unpacked1 = table.unpack(field)
					local GetResult1 = Fields:get(Unpacked1)
					local CallbackResultResult = CallbackResult(GetResult1, Unpacked1, Unpacked, p7)
					
					if CallbackResultResult == nil then
						NewMap1:set(Unpacked1, GetResult1)
					elseif Boolean.toJSBoolean(Array.isArray(CallbackResultResult)) then
						local Unpacked2, Unpacked2_1 = table.unpack(CallbackResultResult, 1, 2)
						
						if Unpacked2_1.astNode ~= nil and Unpacked2_1.astNode ~= Object.None then
							Unpacked2_1.astNode = Object.assign({}, Unpacked2_1.astNode, {
								name = Object.assign({}, Unpacked2_1.astNode.name, { value = Unpacked2 })
							})
						end
						NewMap1:set(Unpacked2, if Unpacked2_1 == nil then GetResult1 else Unpacked2_1)
					elseif CallbackResultResult ~= Object.None then
						NewMap1:set(Unpacked1, CallbackResultResult)
					end
				end
				if Boolean.toJSBoolean(IsObjectTypeFunction(GetResult)) then
					NewMap:set(Unpacked, (Callback8(GraphQLObjectType.new(Object.assign({}, Config, { fields = NewMap1 })))))
				elseif Boolean.toJSBoolean(IsInterfaceTypeFunction(GetResult)) then
					NewMap:set(Unpacked, (Callback8(GraphQLInterfaceType.new(Object.assign({}, Config, { fields = NewMap1 })))))
				else
					NewMap:set(Unpacked, (Callback8(GraphQLInputObjectType.new(Object.assign({}, Config, { fields = NewMap1 })))))
				end
			else
				NewMap:set(Unpacked, GetResult)
			end
		end
	end
	return NewMap
end

Callback = function(List, p9, p10) --[[ Line: 688 | Named "mapArguments" ]]
	-- upvalues: Map (copy), String (copy), Boolean (copy), IsObjectTypeFunction (copy), IsInterfaceTypeFunction (copy), Callback11 (ref), Object (copy), Array (copy), GraphQLObjectType (copy), GraphQLInterfaceType (copy), GraphQLInputObjectType (copy)
	local NewMap = Map.new()
	
	for _, value in List do
		local Unpacked = table.unpack(value)
		
		if not String.startsWith(Unpacked, "__") then
			local GetResult = List:get(Unpacked)
			
			if Boolean.toJSBoolean(IsObjectTypeFunction(GetResult)) or Boolean.toJSBoolean(IsInterfaceTypeFunction(GetResult)) then
				local CallbackResult = Callback11(p10)
				
				if CallbackResult == nil or CallbackResult == Object.None then
					NewMap:set(Unpacked, GetResult)
				else
					local Config = GetResult:toConfig()
					local Fields = Config.fields
					local NewMap1 = Map.new()
					
					for _, field in Fields do
						local Unpacked1 = table.unpack(field)
						local GetResult1 = Fields:get(Unpacked1)
						local Args = GetResult1.args
						
						if Args == nil or Args == Object.None then
							NewMap1:set(Unpacked1, GetResult1)
						else
							local KeysResult = Args:keys()
							
							if #KeysResult <= 0 then
								NewMap1:set(Unpacked1, GetResult1)
								continue
							end
							local NewMap2 = Map.new()
							
							for _, value1 in KeysResult do
								local GetResult2 = Args:get(value1)
								local CallbackResultResult = CallbackResult(GetResult2, Unpacked1, Unpacked, p9)
								
								if CallbackResultResult == nil then
									NewMap2:set(value1, GetResult2)
								elseif Boolean.toJSBoolean(Array.isArray(CallbackResultResult)) then
									local Unpacked2, Unpacked2_1 = table.unpack(CallbackResultResult, 1, 2)
									NewMap2:set(Unpacked2, Unpacked2_1)
								elseif CallbackResultResult ~= Object.None then
									NewMap2:set(value1, CallbackResultResult)
								end
							end
							NewMap1:set(Unpacked1, Object.assign({}, GetResult1, { args = NewMap2 }))
						end
					end
					if Boolean.toJSBoolean(IsObjectTypeFunction(GetResult)) then
						NewMap:set(Unpacked, GraphQLObjectType.new(Object.assign({}, Config, { fields = NewMap1 })))
					elseif Boolean.toJSBoolean(IsInterfaceTypeFunction(GetResult)) then
						NewMap:set(Unpacked, GraphQLInterfaceType.new(Object.assign({}, Config, { fields = NewMap1 })))
					else
						NewMap:set(Unpacked, GraphQLInputObjectType.new(Object.assign({}, Config, { fields = NewMap1 })))
					end
				end
			else
				NewMap:set(Unpacked, GetResult)
			end
		end
	end
	return NewMap
end

Callback5 = function(Directives, p11, p12) --[[ Line: 884 | Named "mapDirectives" ]]
	-- upvalues: Callback12 (ref), Object (copy), Array (copy)
	local CallbackResult = Callback12(p12)
	
	if CallbackResult == nil or CallbackResult == Object.None then
		return Array.slice(Directives)
	end
	local List = {}
	
	for _, directive in Directives do
		local CallbackResultResult = CallbackResult(directive, p11)
		
		if CallbackResultResult == nil then
			table.insert(List, directive)
		elseif CallbackResultResult ~= Object.None then
			table.insert(List, CallbackResultResult)
		end
	end
	return List
end

local function getTypeSpecifiers(p13, Name) --[[ Line: 916 ]]
	-- upvalues: MapperKind (copy), Boolean (copy), IsObjectTypeFunction (copy), Array (copy), IsInputObjectTypeFunction (copy), IsInterfaceTypeFunction (copy), IsUnionTypeFunction (copy), IsEnumTypeFunction (copy), IsScalarTypeFunction (copy)
	local Type = p13:getType(Name)
	local ConcatResult = { MapperKind.TYPE }
	
	if Boolean.toJSBoolean(IsObjectTypeFunction(Type)) then
		ConcatResult = Array.concat(ConcatResult, { MapperKind.COMPOSITE_TYPE, MapperKind.OBJECT_TYPE })
		
		if Name == (if typeof(p13:getQueryType()) == "table" then p13:getQueryType().name else nil) then
			ConcatResult = Array.concat(ConcatResult, { MapperKind.ROOT_OBJECT, MapperKind.QUERY })
			
			return ConcatResult
		elseif Name == (if typeof(p13:getMutationType()) == "table" then p13:getMutationType().name else nil) then
			ConcatResult = Array.concat(ConcatResult, { MapperKind.ROOT_OBJECT, MapperKind.MUTATION })
			
			return ConcatResult
		elseif Name == (if typeof(p13:getSubscriptionType()) == "table" then p13:getSubscriptionType().name else nil) then
			ConcatResult = Array.concat(ConcatResult, { MapperKind.ROOT_OBJECT, MapperKind.SUBSCRIPTION })
			
			return ConcatResult
		end
	else
		if Boolean.toJSBoolean(IsInputObjectTypeFunction(Type)) then
			table.insert(ConcatResult, MapperKind.INPUT_OBJECT_TYPE)
			
			return ConcatResult
		end
		if Boolean.toJSBoolean(IsInterfaceTypeFunction(Type)) then
			ConcatResult = Array.concat(ConcatResult, {
				MapperKind.COMPOSITE_TYPE,
				MapperKind.ABSTRACT_TYPE,
				MapperKind.INTERFACE_TYPE
			})
			
			return ConcatResult
		end
		if Boolean.toJSBoolean(IsUnionTypeFunction(Type)) then
			ConcatResult = Array.concat(ConcatResult, {
				MapperKind.COMPOSITE_TYPE,
				MapperKind.ABSTRACT_TYPE,
				MapperKind.UNION_TYPE
			})
			
			return ConcatResult
		end
		if Boolean.toJSBoolean(IsEnumTypeFunction(Type)) then
			table.insert(ConcatResult, MapperKind.ENUM_TYPE)
			
			return ConcatResult
		end
		if Boolean.toJSBoolean(IsScalarTypeFunction(Type)) then
			table.insert(ConcatResult, MapperKind.SCALAR_TYPE)
		end
	end
	return ConcatResult
end

Callback6 = function(p13, p14, Name) --[[ Line: 996 | Named "getTypeMapper" ]]
	-- upvalues: getTypeSpecifiers (copy), Array (copy), Boolean (copy)
	local v1 = nil
	local ConcatResult = Array.concat({}, (getTypeSpecifiers(p13, Name)))
	while not Boolean.toJSBoolean(v1) and #ConcatResult > 0 do
		v1 = p14[tostring((table.remove(ConcatResult)))]
	end
	return if v1 == nil then nil else v1
end

local function getFieldSpecifiers(p15, Name) --[[ Line: 1023 ]]
	-- upvalues: MapperKind (copy), Boolean (copy), IsObjectTypeFunction (copy), Array (copy), IsInterfaceTypeFunction (copy), IsInputObjectTypeFunction (copy)
	local Type = p15:getType(Name)
	local ConcatResult = { MapperKind.FIELD }
	
	if Boolean.toJSBoolean(IsObjectTypeFunction(Type)) then
		ConcatResult = Array.concat(ConcatResult, { MapperKind.COMPOSITE_FIELD, MapperKind.OBJECT_FIELD })
		
		if Name == (if typeof(p15:getQueryType()) == "table" then p15:getQueryType().name else nil) then
			ConcatResult = Array.concat(ConcatResult, { MapperKind.ROOT_FIELD, MapperKind.QUERY_ROOT_FIELD })
			
			return ConcatResult
		elseif Name == (if typeof(p15:getMutationType()) == "table" then p15:getMutationType().name else nil) then
			ConcatResult = Array.concat(ConcatResult, { MapperKind.ROOT_FIELD, MapperKind.MUTATION_ROOT_FIELD })
			
			return ConcatResult
		elseif Name == (if typeof(p15:getSubscriptionType()) == "table" then p15:getSubscriptionType().name else nil) then
			ConcatResult = Array.concat(ConcatResult, {
				MapperKind.ROOT_FIELD,
				MapperKind.SUBSCRIPTION_ROOT_FIELD
			})
			
			return ConcatResult
		end
	else
		if Boolean.toJSBoolean(IsInterfaceTypeFunction(Type)) then
			ConcatResult = Array.concat(ConcatResult, { MapperKind.COMPOSITE_FIELD, MapperKind.INTERFACE_FIELD })
			
			return ConcatResult
		end
		if Boolean.toJSBoolean(IsInputObjectTypeFunction(Type)) then
			table.insert(ConcatResult, MapperKind.INPUT_OBJECT_FIELD)
		end
	end
	return ConcatResult
end

Callback10 = function(p15, p16, Name) --[[ Line: 1102 | Named "getFieldMapper" ]]
	-- upvalues: getFieldSpecifiers (copy), Array (copy), Boolean (copy)
	local v2 = nil
	local ConcatResult = Array.concat({}, table.unpack((getFieldSpecifiers(p15, Name))))
	while not Boolean.toJSBoolean(v2) and #ConcatResult > 0 do
		v2 = p16[tostring((table.remove(ConcatResult)))]
	end
	return if v2 == nil then nil else v2
end

Callback11 = function(p17) --[[ Line: 1129 | Named "getArgumentMapper" ]]
	-- upvalues: MapperKind (copy)
	local v3 = p17[tostring(MapperKind.ARGUMENT)]
	
	return if v3 == nil then nil else v3
end

Callback12 = function(p17) --[[ Line: 1140 | Named "getDirectiveMapper" ]]
	-- upvalues: MapperKind (copy)
	local v3 = p17[tostring(MapperKind.DIRECTIVE)]
	
	return if v3 == nil then nil else v3
end

Callback7 = function(p17) --[[ Line: 1151 | Named "getEnumValueMapper" ]]
	-- upvalues: MapperKind (copy)
	local v3 = p17[tostring(MapperKind.ENUM_VALUE)]
	
	return if v3 == nil then nil else v3
end

Callback8 = function(NewResult) --[[ Line: 1175 | Named "correctASTNodes" ]]
	-- upvalues: Boolean (copy), IsObjectTypeFunction (copy), Object (copy), Kind (copy), Array (copy), GraphQLObjectType (copy), IsInterfaceTypeFunction (copy), GraphQLInterfaceType (copy), IsInputObjectTypeFunction (copy), GraphQLInputObjectType (copy), IsEnumTypeFunction (copy), GraphQLEnumType (copy)
	if Boolean.toJSBoolean(IsObjectTypeFunction(NewResult)) then
		local Config = NewResult:toConfig()
		
		if Config.astNode ~= nil then
			local Fields = {}
			
			for _, field in Config.fields do
				local GetResult = Config.fields:get((table.unpack(field)))
				
				if GetResult.astNode ~= nil then
					table.insert(Fields, GetResult.astNode)
				end
			end
			Config.astNode = Object.assign({}, Config.astNode, { kind = Kind.OBJECT_TYPE_DEFINITION, fields = Fields })
		end
		if Config.extensionASTNodes ~= nil then
			Config.extensionASTNodes = Array.map(Config.extensionASTNodes, function(p17) --[[ Line: 1206 ]]
				-- upvalues: Object (upval), Kind (upval)
				return Object.assign({}, p17, { kind = Kind.OBJECT_TYPE_EXTENSION, fields = Object.None })
			end)
		end
		return GraphQLObjectType.new(Config)
	elseif Boolean.toJSBoolean(IsInterfaceTypeFunction(NewResult)) then
		local Config = NewResult:toConfig()
		
		if Config.astNode ~= nil then
			local Fields = {}
			
			for _, field1 in Config.fields do
				local GetResult = Config.fields:get((table.unpack(field1)))
				
				if GetResult.astNode ~= nil then
					table.insert(Fields, GetResult.astNode)
				end
			end
			Config.astNode = Object.assign({}, Config.astNode, { kind = Kind.INTERFACE_TYPE_DEFINITION, fields = Fields })
		end
		if Config.extensionASTNodes ~= nil then
			Config.extensionASTNodes = Array.map(Config.extensionASTNodes, function(p17) --[[ Line: 1239 ]]
				-- upvalues: Object (upval), Kind (upval)
				return Object.assign({}, p17, {
					kind = Kind.INTERFACE_TYPE_EXTENSION,
					fields = Object.None
				})
			end)
		end
		return GraphQLInterfaceType.new(Config)
	elseif Boolean.toJSBoolean(IsInputObjectTypeFunction(NewResult)) then
		local Config = NewResult:toConfig()
		
		if Config.astNode ~= nil then
			local Fields = {}
			
			for _, field2 in Config.fields do
				local GetResult = Config.fields:get((table.unpack(field2)))
				
				if GetResult.astNode ~= nil then
					table.insert(Fields, GetResult.astNode)
				end
			end
			Config.astNode = Object.assign({}, Config.astNode, {
				kind = Kind.INPUT_OBJECT_TYPE_DEFINITION,
				fields = Fields
			})
		end
		if Config.extensionASTNodes ~= nil then
			Config.extensionASTNodes = Array.map(Config.extensionASTNodes, function(p17) --[[ Line: 1275 ]]
				-- upvalues: Object (upval), Kind (upval)
				return Object.assign({}, p17, {
					kind = Kind.INPUT_OBJECT_TYPE_EXTENSION,
					fields = Object.None
				})
			end)
		end
		return GraphQLInputObjectType.new(Config)
	else
		if not Boolean.toJSBoolean(IsEnumTypeFunction(NewResult)) then
			return NewResult
		end
		local Config = NewResult:toConfig()
		
		if Config.astNode ~= nil then
			local Values = {}
			
			for _, value in Config.values do
				local GetResult = Config.values:get((table.unpack(value)))
				
				if GetResult.astNode ~= nil then
					table.insert(Values, GetResult.astNode)
				end
			end
			Config.astNode = Object.assign({}, Config.astNode, { values = Values })
		end
		if Config.extensionASTNodes ~= nil then
			Config.extensionASTNodes = Array.map(Config.extensionASTNodes, function(p17) --[[ Line: 1307 ]]
				-- upvalues: Object (upval)
				return Object.assign({}, p17, { values = Object.None })
			end)
		end
		return GraphQLEnumType.new(Config)
	end
end

MapSchemaModule.correctASTNodes = Callback8

return MapSchemaModule