local parent = script.Parent.Parent
local luauPolyfillModule = require(parent.LuauPolyfill)
local array = luauPolyfillModule.Array
local boolean = luauPolyfillModule.Boolean
local object = luauPolyfillModule.Object
local t = {}
local graphQLModule = require(parent.GraphQL)
local graphQLObjectType = graphQLModule.GraphQLObjectType
local graphQLSchema = graphQLModule.GraphQLSchema
local isInterfaceType = graphQLModule.isInterfaceType
local isEnumType = graphQLModule.isEnumType
local isObjectType = graphQLModule.isObjectType
local isScalarType = graphQLModule.isScalarType
local isUnionType = graphQLModule.isUnionType
local isInputObjectType = graphQLModule.isInputObjectType
local graphQLInputObjectType = graphQLModule.GraphQLInputObjectType
local graphQLInterfaceType = graphQLModule.GraphQLInterfaceType
local isLeafType = graphQLModule.isLeafType
local isListType = graphQLModule.isListType
local isNonNullType = graphQLModule.isNonNullType
local isNamedType = graphQLModule.isNamedType
local graphQLList = graphQLModule.GraphQLList
local graphQLNonNull = graphQLModule.GraphQLNonNull
local graphQLEnumType = graphQLModule.GraphQLEnumType
local kind = graphQLModule.Kind
local getObjectTypeFromTypeMap = require(script.Parent.getObjectTypeFromTypeMap).getObjectTypeFromTypeMap
local mapperKind = require(script.Parent.Interfaces).MapperKind
local rewireTypes = require(script.Parent.rewire).rewireTypes
local transformInputValueModule = require(script.Parent.transformInputValue)
local serializeInputValue = transformInputValueModule.serializeInputValue
local parseInputValue = transformInputValueModule.parseInputValue
local map = luauPolyfillModule.Map
local string = luauPolyfillModule.String
local mapTypes = nil
local mapArguments = nil
local mapFields = nil
local mapDefaultValues = nil
local mapEnumValues = nil
local getEnumValueMapper = nil
local getDirectiveMapper = nil
local mapDirectives = nil
local getFieldMapper = nil
local getTypeMapper = nil
local getArgumentMapper = nil
local getNewType = nil
local var16 = nil

function t.mapSchema(p0, p1) --[[ line: 172 ]]
	-- upvalues: mapArguments (write), mapFields (write), mapTypes (write), mapDefaultValues (write), mapEnumValues (write), serializeInputValue (ref), isLeafType (ref), parseInputValue (ref), boolean (ref), mapDirectives (write), rewireTypes (ref), graphQLSchema (ref), object (ref), getObjectTypeFromTypeMap (ref)
	local var19 = if p1 ~= nil then {} else p1
	local var20 = mapArguments(mapFields(mapTypes(mapDefaultValues(mapEnumValues(mapTypes(mapDefaultValues(p0:getTypeMap(), p0, serializeInputValue), p0, var19, function(p2) --[[ line: 183 ]]
		-- upvalues: isLeafType (copy)
		return isLeafType(p2)
	end), p0, var19), p0, parseInputValue), p0, var19, function(p3) --[[ line: 195 ]]
		-- upvalues: boolean (copy), isLeafType (copy)
		return not boolean.toJSBoolean(isLeafType(p3))
	end), p0, var19), p0, var19)
	local var21 = rewireTypes(var20, mapDirectives(p0:getDirectives(), p0, var19))
	local typeMap = var21.typeMap
	
	return graphQLSchema.new(object.assign({}, p0:toConfig(), {
		query = getObjectTypeFromTypeMap(typeMap, getObjectTypeFromTypeMap(var20, p0:getQueryType())) or object.None,
		mutation = getObjectTypeFromTypeMap(typeMap, getObjectTypeFromTypeMap(var20, p0:getMutationType())) or object.None,
		subscription = getObjectTypeFromTypeMap(typeMap, getObjectTypeFromTypeMap(var20, p0:getSubscriptionType())) or object.None,
		types = typeMap:values() or object.None,
		directives = var21.directives or object.None
	}))
end

mapTypes = function(p4, p5, p6, p7) --[[ line: 241 | named "mapTypes" ]]
	-- upvalues: map (ref), string (ref), object (ref), getTypeMapper (write)
	local var22 = if p7 ~= nil then function() --[[ line: 256 ]]
		return true
	end else p7
	local var23 = map.new()
	
	for i, v in p4 do
		local unpacked = table.unpack(v)
		
		if not string.startsWith(unpacked, "__") then
			local var25 = p4:get(unpacked)
			
			if var25 == nil or var25 == object.None or not var22(var25) then
				var23:set(unpacked, var25)
			else
				local var26 = getTypeMapper(p5, p6, unpacked)
				
				if var26 == nil or var26 == object.None then
					var23:set(unpacked, var25)
				else
					local var27 = var26(var25, p5)
					
					if var27 == nil then
						var23:set(unpacked, var25)
					else
						var23:set(unpacked, var27)
					end
				end
			end
		end
	end
	return var23
end

mapEnumValues = function(p8, p9, p10) --[[ line: 313 | named "mapEnumValues" ]]
	-- upvalues: getEnumValueMapper (write), boolean (ref), mapTypes (write), mapperKind (ref), map (ref), array (ref), object (ref), var16 (write), graphQLEnumType (ref), isEnumType (ref)
	local var28 = getEnumValueMapper(p10)
	
	return if boolean.toJSBoolean(var28) then mapTypes(p8, p9, {
		[tostring(mapperKind.ENUM_TYPE)] = function(p11) --[[ line: 337 ]]
			-- upvalues: map (copy), var28 (ref), p9 (ref), boolean (copy), array (copy), object (copy), var16 (copy), graphQLEnumType (copy)
			local var29 = p11:toConfig()
			local values = var29.values
			local var30 = map.new()
			
			for i, v in values do
				local unpacked = table.unpack(v)
				local var32 = values:get(unpacked)
				local var33 = var28(var32, p11.name, p9, unpacked)
				
				if var33 == nil then
					var30:set(unpacked, var32)
				elseif boolean.toJSBoolean(array.isArray(var33)) then
					local unpacked_1, unpacked_2 = table.unpack(var33, 1, 2)
					var30:set(unpacked_1, if unpacked_2 == nil then var32 else unpacked_2)
				elseif var33 ~= object.None then
					var30:set(unpacked, var33)
				end
			end
			return var16(graphQLEnumType.new(object.assign({}, var29, { values = var30 })))
		end
	}, function(p12) --[[ line: 391 ]]
		-- upvalues: isEnumType (copy)
		return isEnumType(p12)
	end) else p8
end

mapDefaultValues = function(p13, p14, p15) --[[ line: 399 | named "mapDefaultValues" ]]
	-- upvalues: mapArguments (write), mapperKind (ref), getNewType (write), object (ref), mapFields (write)
	local var36 = mapArguments(p13, p14, {
		[mapperKind.ARGUMENT] = function(p16) --[[ line: 421 ]]
			-- upvalues: getNewType (copy), p13 (ref), object (copy), p15 (ref)
			if p16.defaultValue == nil then
				return p16
			end
			local var37 = getNewType(p13, p16.type)
			
			return if var37 == nil then nil else object.assign({}, p16, { defaultValue = p15(var37, p16.defaultValue) })
		end
	})
	
	return mapFields(var36, p14, {
		[mapperKind.INPUT_OBJECT_FIELD] = function(p17) --[[ line: 456 ]]
			-- upvalues: getNewType (copy), var36 (ref), object (copy), p15 (ref)
			if p17.defaultValue == nil then
				return p17
			end
			local var38 = getNewType(var36, p17.type)
			
			return if var38 == nil then nil else object.assign({}, p17, { defaultValue = p15(var38, p17.defaultValue) })
		end
	})
end

getNewType = function(p18, p19) --[[ line: 487 | named "getNewType" ]]
	-- upvalues: boolean (ref), isListType (ref), getNewType (write), graphQLList (ref), isNonNullType (ref), graphQLNonNull (ref), isNamedType (ref)
	if boolean.toJSBoolean(isListType(p19)) then
		local var39 = getNewType(p18, p19.ofType)
		
		return if var39 == nil then nil else graphQLList.new(var39)
	elseif boolean.toJSBoolean(isNonNullType(p19)) then
		local var40 = getNewType(p18, p19.ofType)
		
		return if var40 == nil then nil else graphQLNonNull.new(var40)
	elseif not boolean.toJSBoolean(isNamedType(p19)) then
		return nil
	end
	local name = p18:get(p19.name)
	
	return if name == nil then nil else name
end

mapFields = function(p20, p21, p22) --[[ line: 521 | named "mapFields" ]]
	-- upvalues: map (ref), string (ref), boolean (ref), isObjectType (ref), isInterfaceType (ref), isInputObjectType (ref), getFieldMapper (write), object (ref), array (ref), var16 (write), graphQLObjectType (ref), graphQLInterfaceType (ref), graphQLInputObjectType (ref)
	local var42 = map.new()
	
	for i, v in p20 do
		local unpacked = table.unpack(v)
		
		if not string.startsWith(unpacked, "__") then
			local var44 = p20:get(unpacked)
			
			if boolean.toJSBoolean(isObjectType(var44)) or boolean.toJSBoolean(isInterfaceType(var44)) or boolean.toJSBoolean(isInputObjectType(var44)) then
				local var45 = getFieldMapper(p21, p22, unpacked)
				
				if var45 == nil or var45 == object.None then
					var42:set(unpacked, var44)
				else
					local var46 = var44:toConfig()
					local fields = var46.fields
					local var47 = map.new()
					
					for i_1, v_1 in fields do
						local unpacked_1 = table.unpack(v_1)
						local var49 = fields:get(unpacked_1)
						local var50 = var45(var49, unpacked_1, unpacked, p21)
						
						if var50 == nil then
							var47:set(unpacked_1, var49)
						elseif boolean.toJSBoolean(array.isArray(var50)) then
							local unpacked_2, unpacked_3 = table.unpack(var50, 1, 2)
							
							if unpacked_3.astNode ~= nil and unpacked_3.astNode ~= object.None then
								unpacked_3.astNode = object.assign({}, unpacked_3.astNode, {
									name = object.assign({}, unpacked_3.astNode.name, { value = unpacked_2 })
								})
							end
							var47:set(unpacked_2, if unpacked_3 == nil then var49 else unpacked_3)
						elseif var50 ~= object.None then
							var47:set(unpacked_1, var50)
						end
					end
					if boolean.toJSBoolean(isObjectType(var44)) then
						var42:set(unpacked, var16(graphQLObjectType.new(object.assign({}, var46, { fields = var47 }))))
					elseif boolean.toJSBoolean(isInterfaceType(var44)) then
						var42:set(unpacked, var16(graphQLInterfaceType.new(object.assign({}, var46, { fields = var47 }))))
					else
						var42:set(unpacked, var16(graphQLInputObjectType.new(object.assign({}, var46, { fields = var47 }))))
					end
				end
			else
				var42:set(unpacked, var44)
			end
		end
	end
	return var42
end

mapArguments = function(p23, p24, p25) --[[ line: 688 | named "mapArguments" ]]
	-- upvalues: map (ref), string (ref), boolean (ref), isObjectType (ref), isInterfaceType (ref), getArgumentMapper (write), object (ref), array (ref), graphQLObjectType (ref), graphQLInterfaceType (ref), graphQLInputObjectType (ref)
	local var53 = map.new()
	
	for i, v in p23 do
		local unpacked = table.unpack(v)
		
		if not string.startsWith(unpacked, "__") then
			local var55 = p23:get(unpacked)
			
			if boolean.toJSBoolean(isObjectType(var55)) or boolean.toJSBoolean(isInterfaceType(var55)) then
				local var56 = getArgumentMapper(p25)
				
				if var56 == nil or var56 == object.None then
					var53:set(unpacked, var55)
				else
					local var57 = var55:toConfig()
					local fields = var57.fields
					local var58 = map.new()
					
					for i_1, v_1 in fields do
						local unpacked_1 = table.unpack(v_1)
						local var60 = fields:get(unpacked_1)
						local args = var60.args
						
						if args == nil or args == object.None then
							var58:set(unpacked_1, var60)
						else
							local var61 = args:keys()
							
							if #var61 > 0 then
								local var62 = map.new()
								
								for i_2, v_2 in var61 do
									local var63 = args:get(v_2)
									local var64 = var56(var63, unpacked_1, unpacked, p24)
									
									if var64 == nil then
										var62:set(v_2, var63)
									elseif boolean.toJSBoolean(array.isArray(var64)) then
										local unpacked_2, unpacked_3 = table.unpack(var64, 1, 2)
										var62:set(unpacked_2, unpacked_3)
									elseif var64 ~= object.None then
										var62:set(v_2, var64)
									end
								end
								var58:set(unpacked_1, object.assign({}, var60, { args = var62 }))
							else
								var58:set(unpacked_1, var60)
							end
						end
					end
					if boolean.toJSBoolean(isObjectType(var55)) then
						var53:set(unpacked, graphQLObjectType.new(object.assign({}, var57, { fields = var58 })))
					elseif boolean.toJSBoolean(isInterfaceType(var55)) then
						var53:set(unpacked, graphQLInterfaceType.new(object.assign({}, var57, { fields = var58 })))
					else
						var53:set(unpacked, graphQLInputObjectType.new(object.assign({}, var57, { fields = var58 })))
					end
				end
			else
				var53:set(unpacked, var55)
			end
		end
	end
	return var53
end

mapDirectives = function(p26, p27, p28) --[[ line: 884 | named "mapDirectives" ]]
	-- upvalues: getDirectiveMapper (write), object (ref), array (ref)
	local var67 = getDirectiveMapper(p28)
	
	if var67 == nil or var67 == object.None then
		return array.slice(p26)
	end
	local t = {}
	
	for i, v in p26 do
		local var69 = var67(v, p27)
		
		if var69 == nil then
			table.insert(t, v)
		elseif var69 ~= object.None then
			table.insert(t, var69)
		end
	end
	return t
end

local function getTypeSpecifiers(p29, p30) --[[ line: 916 ]]
	-- upvalues: mapperKind (ref), boolean (ref), isObjectType (ref), array (ref), isInputObjectType (ref), isInterfaceType (ref), isUnionType (ref), isEnumType (ref), isScalarType (ref)
	local var70 = p29:getType(p30)
	local list = { mapperKind.TYPE }
	
	if boolean.toJSBoolean(isObjectType(var70)) then
		list = array.concat(list, { mapperKind.COMPOSITE_TYPE, mapperKind.OBJECT_TYPE })
		
		if p30 == (if typeof(p29:getQueryType()) == "table" then p29:getQueryType().name else nil) then
			list = array.concat(list, { mapperKind.ROOT_OBJECT, mapperKind.QUERY })
			
			return list
		elseif p30 == (if typeof(p29:getMutationType()) == "table" then p29:getMutationType().name else nil) then
			list = array.concat(list, { mapperKind.ROOT_OBJECT, mapperKind.MUTATION })
			
			return list
		elseif p30 == (if typeof(p29:getSubscriptionType()) == "table" then p29:getSubscriptionType().name else nil) then
			list = array.concat(list, { mapperKind.ROOT_OBJECT, mapperKind.SUBSCRIPTION })
			
			return list
		end
	elseif boolean.toJSBoolean(isInputObjectType(var70)) then
		table.insert(list, mapperKind.INPUT_OBJECT_TYPE)
		
		return list
	elseif boolean.toJSBoolean(isInterfaceType(var70)) then
		list = array.concat(list, {
			mapperKind.COMPOSITE_TYPE,
			mapperKind.ABSTRACT_TYPE,
			mapperKind.INTERFACE_TYPE
		})
		
		return list
	elseif boolean.toJSBoolean(isUnionType(var70)) then
		list = array.concat(list, {
			mapperKind.COMPOSITE_TYPE,
			mapperKind.ABSTRACT_TYPE,
			mapperKind.UNION_TYPE
		})
		
		return list
	elseif boolean.toJSBoolean(isEnumType(var70)) then
		table.insert(list, mapperKind.ENUM_TYPE)
		
		return list
	elseif boolean.toJSBoolean(isScalarType(var70)) then
		table.insert(list, mapperKind.SCALAR_TYPE)
	end
	return list
end

getTypeMapper = function(p31, p32, p33) --[[ line: 996 | named "getTypeMapper" ]]
	-- upvalues: getTypeSpecifiers (ref), array (ref), boolean (ref)
	local var72 = nil
	local var73 = array.concat({}, getTypeSpecifiers(p31, p33))
	while not boolean.toJSBoolean(var72) and #var73 > 0 do
		var72 = p32[tostring(table.remove(var73))]
	end
	return if var72 == nil then nil else var72
end

local function getFieldSpecifiers(p34, p35) --[[ line: 1023 ]]
	-- upvalues: mapperKind (ref), boolean (ref), isObjectType (ref), array (ref), isInterfaceType (ref), isInputObjectType (ref)
	local var74 = p34:getType(p35)
	local list = { mapperKind.FIELD }
	
	if boolean.toJSBoolean(isObjectType(var74)) then
		list = array.concat(list, { mapperKind.COMPOSITE_FIELD, mapperKind.OBJECT_FIELD })
		
		if p35 == (if typeof(p34:getQueryType()) == "table" then p34:getQueryType().name else nil) then
			list = array.concat(list, { mapperKind.ROOT_FIELD, mapperKind.QUERY_ROOT_FIELD })
			
			return list
		elseif p35 == (if typeof(p34:getMutationType()) == "table" then p34:getMutationType().name else nil) then
			list = array.concat(list, { mapperKind.ROOT_FIELD, mapperKind.MUTATION_ROOT_FIELD })
			
			return list
		elseif p35 == (if typeof(p34:getSubscriptionType()) == "table" then p34:getSubscriptionType().name else nil) then
			list = array.concat(list, {
				mapperKind.ROOT_FIELD,
				mapperKind.SUBSCRIPTION_ROOT_FIELD
			})
			
			return list
		end
	elseif boolean.toJSBoolean(isInterfaceType(var74)) then
		list = array.concat(list, { mapperKind.COMPOSITE_FIELD, mapperKind.INTERFACE_FIELD })
		
		return list
	elseif boolean.toJSBoolean(isInputObjectType(var74)) then
		table.insert(list, mapperKind.INPUT_OBJECT_FIELD)
	end
	return list
end

getFieldMapper = function(p36, p37, p38) --[[ line: 1102 | named "getFieldMapper" ]]
	-- upvalues: getFieldSpecifiers (ref), array (ref), boolean (ref)
	local var76 = nil
	local var77 = array.concat({}, table.unpack(getFieldSpecifiers(p36, p38)))
	while not boolean.toJSBoolean(var76) and #var77 > 0 do
		var76 = p37[tostring(table.remove(var77))]
	end
	return if var76 == nil then nil else var76
end

getArgumentMapper = function(p39) --[[ line: 1129 | named "getArgumentMapper" ]]
	-- upvalues: mapperKind (ref)
	local ARGUMENT = p39[tostring(mapperKind.ARGUMENT)]
	
	return if ARGUMENT == nil then nil else ARGUMENT
end

getDirectiveMapper = function(p40) --[[ line: 1140 | named "getDirectiveMapper" ]]
	-- upvalues: mapperKind (ref)
	local DIRECTIVE = p40[tostring(mapperKind.DIRECTIVE)]
	
	return if DIRECTIVE == nil then nil else DIRECTIVE
end

getEnumValueMapper = function(p41) --[[ line: 1151 | named "getEnumValueMapper" ]]
	-- upvalues: mapperKind (ref)
	local ENUM_VALUE = p41[tostring(mapperKind.ENUM_VALUE)]
	
	return if ENUM_VALUE == nil then nil else ENUM_VALUE
end

function t.correctASTNodes(p42) --[[ line: 1175 ]]
	-- upvalues: boolean (ref), isObjectType (ref), object (ref), kind (ref), array (ref), graphQLObjectType (ref), isInterfaceType (ref), graphQLInterfaceType (ref), isInputObjectType (ref), graphQLInputObjectType (ref), isEnumType (ref), graphQLEnumType (ref)
	if boolean.toJSBoolean(isObjectType(p42)) then
		local var78 = p42:toConfig()
		
		if var78.astNode ~= nil then
			local t = {}
			
			for i, v in var78.fields do
				local var80 = var78.fields:get(table.unpack(v))
				
				if var80.astNode ~= nil then
					table.insert(t, var80.astNode)
				end
			end
			var78.astNode = object.assign({}, var78.astNode, { kind = kind.OBJECT_TYPE_DEFINITION, fields = t })
		end
		if var78.extensionASTNodes ~= nil then
			var78.extensionASTNodes = array.map(var78.extensionASTNodes, function(p43) --[[ line: 1206 ]]
				-- upvalues: object (copy), kind (copy)
				return object.assign({}, p43, { kind = kind.OBJECT_TYPE_EXTENSION, fields = object.None })
			end)
		end
		return graphQLObjectType.new(var78)
	elseif boolean.toJSBoolean(isInterfaceType(p42)) then
		local var81 = p42:toConfig()
		
		if var81.astNode ~= nil then
			local t = {}
			
			for i, v in var81.fields do
				local var83 = var81.fields:get(table.unpack(v))
				
				if var83.astNode ~= nil then
					table.insert(t, var83.astNode)
				end
			end
			var81.astNode = object.assign({}, var81.astNode, { kind = kind.INTERFACE_TYPE_DEFINITION, fields = t })
		end
		if var81.extensionASTNodes ~= nil then
			var81.extensionASTNodes = array.map(var81.extensionASTNodes, function(p44) --[[ line: 1239 ]]
				-- upvalues: object (copy), kind (copy)
				return object.assign({}, p44, {
					kind = kind.INTERFACE_TYPE_EXTENSION,
					fields = object.None
				})
			end)
		end
		return graphQLInterfaceType.new(var81)
	elseif boolean.toJSBoolean(isInputObjectType(p42)) then
		local var84 = p42:toConfig()
		
		if var84.astNode ~= nil then
			local t = {}
			
			for i, v in var84.fields do
				local var86 = var84.fields:get(table.unpack(v))
				
				if var86.astNode ~= nil then
					table.insert(t, var86.astNode)
				end
			end
			var84.astNode = object.assign({}, var84.astNode, { kind = kind.INPUT_OBJECT_TYPE_DEFINITION, fields = t })
		end
		if var84.extensionASTNodes ~= nil then
			var84.extensionASTNodes = array.map(var84.extensionASTNodes, function(p45) --[[ line: 1275 ]]
				-- upvalues: object (copy), kind (copy)
				return object.assign({}, p45, {
					kind = kind.INPUT_OBJECT_TYPE_EXTENSION,
					fields = object.None
				})
			end)
		end
		return graphQLInputObjectType.new(var84)
	elseif not boolean.toJSBoolean(isEnumType(p42)) then
		return p42
	end
	local var87 = p42:toConfig()
	
	if var87.astNode ~= nil then
		local t = {}
		
		for i, v in var87.values do
			local var89 = var87.values:get(table.unpack(v))
			
			if var89.astNode ~= nil then
				table.insert(t, var89.astNode)
			end
		end
		var87.astNode = object.assign({}, var87.astNode, { values = t })
	end
	if var87.extensionASTNodes ~= nil then
		var87.extensionASTNodes = array.map(var87.extensionASTNodes, function(p46) --[[ line: 1307 ]]
			-- upvalues: object (copy)
			return object.assign({}, p46, { values = object.None })
		end)
	end
	return graphQLEnumType.new(var87)
end

return t