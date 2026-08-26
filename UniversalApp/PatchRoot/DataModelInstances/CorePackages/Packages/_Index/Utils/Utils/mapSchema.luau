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
local var1 = nil

function t.mapSchema(p1, p2)
	-- upvalues: mapArguments (write), mapFields (write), mapTypes (write), mapDefaultValues (write), mapEnumValues (write), serializeInputValue (ref), isLeafType (ref), parseInputValue (ref), boolean (ref), mapDirectives (write), rewireTypes (ref), graphQLSchema (ref), object (ref), getObjectTypeFromTypeMap (ref)
	local var2 = if p2 ~= nil then {} else p2
	local var3 = mapArguments(mapFields(mapTypes(mapDefaultValues(mapEnumValues(mapTypes(mapDefaultValues(p1:getTypeMap(), p1, serializeInputValue), p1, var2, function(p3)
		-- upvalues: isLeafType (copy)
		return isLeafType(p3)
	end), p1, var2), p1, parseInputValue), p1, var2, function(p3)
		-- upvalues: boolean (copy), isLeafType (copy)
		return not boolean.toJSBoolean(isLeafType(p3))
	end), p1, var2), p1, var2)
	local var4 = rewireTypes(var3, mapDirectives(p1:getDirectives(), p1, var2))
	local typeMap = var4.typeMap
	
	return graphQLSchema.new(object.assign({}, p1:toConfig(), {
		query = getObjectTypeFromTypeMap(typeMap, getObjectTypeFromTypeMap(var3, p1:getQueryType())) or object.None,
		mutation = getObjectTypeFromTypeMap(typeMap, getObjectTypeFromTypeMap(var3, p1:getMutationType())) or object.None,
		subscription = getObjectTypeFromTypeMap(typeMap, getObjectTypeFromTypeMap(var3, p1:getSubscriptionType())) or object.None,
		types = typeMap:values() or object.None,
		directives = var4.directives or object.None
	}))
end

mapTypes = function(p1, p2, p3, p4)
	-- upvalues: map (ref), string (ref), object (ref), getTypeMapper (write)
	local var2 = if p4 ~= nil then function()
		return true
	end else p4
	local var3 = map.new()
	
	for i, v in p1 do
		local unpacked = table.unpack(v)
		
		if not string.startsWith(unpacked, "__") then
			local var4 = p1:get(unpacked)
			
			if var4 == nil or var4 == object.None or not var2(var4) then
				var3:set(unpacked, var4)
			else
				local var5 = getTypeMapper(p2, p3, unpacked)
				
				if var5 == nil or var5 == object.None then
					var3:set(unpacked, var4)
				else
					local var6 = var5(var4, p2)
					
					if var6 == nil then
						var3:set(unpacked, var4)
					else
						var3:set(unpacked, var6)
					end
				end
			end
		end
	end
	return var3
end

mapEnumValues = function(p5, p6, p7)
	-- upvalues: getEnumValueMapper (write), boolean (ref), mapTypes (write), mapperKind (ref), map (ref), array (ref), object (ref), var1 (write), graphQLEnumType (ref), isEnumType (ref)
	local var7 = getEnumValueMapper(p7)
	
	return if boolean.toJSBoolean(var7) then mapTypes(p5, p6, {
		[tostring(mapperKind.ENUM_TYPE)] = function(p8)
			-- upvalues: map (copy), var7 (ref), p6 (ref), boolean (copy), array (copy), object (copy), var1 (copy), graphQLEnumType (copy)
			local var8 = p8:toConfig()
			local values = var8.values
			local var9 = map.new()
			
			for i, v in values do
				local unpacked = table.unpack(v)
				local var10 = values:get(unpacked)
				local var11 = var7(var10, p8.name, p6, unpacked)
				
				if var11 == nil then
					var9:set(unpacked, var10)
				elseif boolean.toJSBoolean(array.isArray(var11)) then
					local unpacked_1, unpacked_2 = table.unpack(var11, 1, 2)
					var9:set(unpacked_1, if unpacked_2 == nil then var10 else unpacked_2)
				elseif var11 ~= object.None then
					var9:set(unpacked, var11)
				end
			end
			return var1(graphQLEnumType.new(object.assign({}, var8, { values = var9 })))
		end
	}, function(p9)
		-- upvalues: isEnumType (copy)
		return isEnumType(p9)
	end) else p5
end

mapDefaultValues = function(p8, p9, p10)
	-- upvalues: mapArguments (write), mapperKind (ref), getNewType (write), object (ref), mapFields (write)
	local var8 = mapArguments(p8, p9, {
		[mapperKind.ARGUMENT] = function(p11)
			-- upvalues: getNewType (copy), p8 (ref), object (copy), p10 (ref)
			if p11.defaultValue == nil then
				return p11
			end
			local var9 = getNewType(p8, p11.type)
			
			return if var9 == nil then nil else object.assign({}, p11, { defaultValue = p10(var9, p11.defaultValue) })
		end
	})
	
	return mapFields(var8, p9, {
		[mapperKind.INPUT_OBJECT_FIELD] = function(p11)
			-- upvalues: getNewType (copy), var8 (ref), object (copy), p10 (ref)
			if p11.defaultValue == nil then
				return p11
			end
			local var9 = getNewType(var8, p11.type)
			
			return if var9 == nil then nil else object.assign({}, p11, { defaultValue = p10(var9, p11.defaultValue) })
		end
	})
end

getNewType = function(p8, p9)
	-- upvalues: boolean (ref), isListType (ref), getNewType (write), graphQLList (ref), isNonNullType (ref), graphQLNonNull (ref), isNamedType (ref)
	if boolean.toJSBoolean(isListType(p9)) then
		local var8 = getNewType(p8, p9.ofType)
		
		return if var8 == nil then nil else graphQLList.new(var8)
	elseif boolean.toJSBoolean(isNonNullType(p9)) then
		local var9 = getNewType(p8, p9.ofType)
		
		return if var9 == nil then nil else graphQLNonNull.new(var9)
	elseif not boolean.toJSBoolean(isNamedType(p9)) then
		return nil
	end
	local name = p8:get(p9.name)
	
	return if name == nil then nil else name
end

mapFields = function(p8, p9, p10)
	-- upvalues: map (ref), string (ref), boolean (ref), isObjectType (ref), isInterfaceType (ref), isInputObjectType (ref), getFieldMapper (write), object (ref), array (ref), var1 (write), graphQLObjectType (ref), graphQLInterfaceType (ref), graphQLInputObjectType (ref)
	local var8 = map.new()
	
	for i, v in p8 do
		local unpacked = table.unpack(v)
		
		if not string.startsWith(unpacked, "__") then
			local var9 = p8:get(unpacked)
			
			if boolean.toJSBoolean(isObjectType(var9)) or boolean.toJSBoolean(isInterfaceType(var9)) or boolean.toJSBoolean(isInputObjectType(var9)) then
				local var10 = getFieldMapper(p9, p10, unpacked)
				
				if var10 == nil or var10 == object.None then
					var8:set(unpacked, var9)
				else
					local var11 = var9:toConfig()
					local fields = var11.fields
					local var12 = map.new()
					
					for i_1, v_1 in fields do
						local unpacked_1 = table.unpack(v_1)
						local var13 = fields:get(unpacked_1)
						local var14 = var10(var13, unpacked_1, unpacked, p9)
						
						if var14 == nil then
							var12:set(unpacked_1, var13)
						elseif boolean.toJSBoolean(array.isArray(var14)) then
							local unpacked_2, unpacked_3 = table.unpack(var14, 1, 2)
							
							if unpacked_3.astNode ~= nil and unpacked_3.astNode ~= object.None then
								unpacked_3.astNode = object.assign({}, unpacked_3.astNode, {
									name = object.assign({}, unpacked_3.astNode.name, { value = unpacked_2 })
								})
							end
							var12:set(unpacked_2, if unpacked_3 == nil then var13 else unpacked_3)
						elseif var14 ~= object.None then
							var12:set(unpacked_1, var14)
						end
					end
					if boolean.toJSBoolean(isObjectType(var9)) then
						var8:set(unpacked, var1(graphQLObjectType.new(object.assign({}, var11, { fields = var12 }))))
					elseif boolean.toJSBoolean(isInterfaceType(var9)) then
						var8:set(unpacked, var1(graphQLInterfaceType.new(object.assign({}, var11, { fields = var12 }))))
					else
						var8:set(unpacked, var1(graphQLInputObjectType.new(object.assign({}, var11, { fields = var12 }))))
					end
				end
			else
				var8:set(unpacked, var9)
			end
		end
	end
	return var8
end

mapArguments = function(p11, p12, p13)
	-- upvalues: map (ref), string (ref), boolean (ref), isObjectType (ref), isInterfaceType (ref), getArgumentMapper (write), object (ref), array (ref), graphQLObjectType (ref), graphQLInterfaceType (ref), graphQLInputObjectType (ref)
	local var15 = map.new()
	
	for i, v in p11 do
		local unpacked = table.unpack(v)
		
		if not string.startsWith(unpacked, "__") then
			local var16 = p11:get(unpacked)
			
			if boolean.toJSBoolean(isObjectType(var16)) or boolean.toJSBoolean(isInterfaceType(var16)) then
				local var17 = getArgumentMapper(p13)
				
				if var17 == nil or var17 == object.None then
					var15:set(unpacked, var16)
				else
					local var18 = var16:toConfig()
					local fields = var18.fields
					local var19 = map.new()
					
					for i_1, v_1 in fields do
						local unpacked_1 = table.unpack(v_1)
						local var20 = fields:get(unpacked_1)
						local args = var20.args
						
						if args == nil or args == object.None then
							var19:set(unpacked_1, var20)
						else
							local var21 = args:keys()
							
							if #var21 > 0 then
								local var22 = map.new()
								
								for i_2, v_2 in var21 do
									local var23 = args:get(v_2)
									local var24 = var17(var23, unpacked_1, unpacked, p12)
									
									if var24 == nil then
										var22:set(v_2, var23)
									elseif boolean.toJSBoolean(array.isArray(var24)) then
										local unpacked_2, unpacked_3 = table.unpack(var24, 1, 2)
										var22:set(unpacked_2, unpacked_3)
									elseif var24 ~= object.None then
										var22:set(v_2, var24)
									end
								end
								var19:set(unpacked_1, object.assign({}, var20, { args = var22 }))
							else
								var19:set(unpacked_1, var20)
							end
						end
					end
					if boolean.toJSBoolean(isObjectType(var16)) then
						var15:set(unpacked, graphQLObjectType.new(object.assign({}, var18, { fields = var19 })))
					elseif boolean.toJSBoolean(isInterfaceType(var16)) then
						var15:set(unpacked, graphQLInterfaceType.new(object.assign({}, var18, { fields = var19 })))
					else
						var15:set(unpacked, graphQLInputObjectType.new(object.assign({}, var18, { fields = var19 })))
					end
				end
			else
				var15:set(unpacked, var16)
			end
		end
	end
	return var15
end

mapDirectives = function(p14, p15, p16)
	-- upvalues: getDirectiveMapper (write), object (ref), array (ref)
	local var25 = getDirectiveMapper(p16)
	
	if var25 == nil or var25 == object.None then
		return array.slice(p14)
	end
	local t = {}
	
	for i, v in p14 do
		local var26 = var25(v, p15)
		
		if var26 == nil then
			table.insert(t, v)
		elseif var26 ~= object.None then
			table.insert(t, var26)
		end
	end
	return t
end

local function getTypeSpecifiers(p17, p18)
	-- upvalues: mapperKind (ref), boolean (ref), isObjectType (ref), array (ref), isInputObjectType (ref), isInterfaceType (ref), isUnionType (ref), isEnumType (ref), isScalarType (ref)
	local var27 = p17:getType(p18)
	local list = { mapperKind.TYPE }
	
	if boolean.toJSBoolean(isObjectType(var27)) then
		list = array.concat(list, { mapperKind.COMPOSITE_TYPE, mapperKind.OBJECT_TYPE })
		
		if p18 == (if typeof(p17:getQueryType()) == "table" then p17:getQueryType().name else nil) then
			list = array.concat(list, { mapperKind.ROOT_OBJECT, mapperKind.QUERY })
			
			return list
		elseif p18 == (if typeof(p17:getMutationType()) == "table" then p17:getMutationType().name else nil) then
			list = array.concat(list, { mapperKind.ROOT_OBJECT, mapperKind.MUTATION })
			
			return list
		elseif p18 == (if typeof(p17:getSubscriptionType()) == "table" then p17:getSubscriptionType().name else nil) then
			list = array.concat(list, { mapperKind.ROOT_OBJECT, mapperKind.SUBSCRIPTION })
			
			return list
		end
	elseif boolean.toJSBoolean(isInputObjectType(var27)) then
		table.insert(list, mapperKind.INPUT_OBJECT_TYPE)
		
		return list
	elseif boolean.toJSBoolean(isInterfaceType(var27)) then
		list = array.concat(list, {
			mapperKind.COMPOSITE_TYPE,
			mapperKind.ABSTRACT_TYPE,
			mapperKind.INTERFACE_TYPE
		})
		
		return list
	elseif boolean.toJSBoolean(isUnionType(var27)) then
		list = array.concat(list, {
			mapperKind.COMPOSITE_TYPE,
			mapperKind.ABSTRACT_TYPE,
			mapperKind.UNION_TYPE
		})
		
		return list
	elseif boolean.toJSBoolean(isEnumType(var27)) then
		table.insert(list, mapperKind.ENUM_TYPE)
		
		return list
	elseif boolean.toJSBoolean(isScalarType(var27)) then
		table.insert(list, mapperKind.SCALAR_TYPE)
	end
	return list
end

getTypeMapper = function(p17, p18, p19)
	-- upvalues: getTypeSpecifiers (ref), array (ref), boolean (ref)
	local var27 = nil
	local var28 = array.concat({}, getTypeSpecifiers(p17, p19))
	while not boolean.toJSBoolean(var27) and #var28 > 0 do
		var27 = p18[tostring(table.remove(var28))]
	end
	return if var27 == nil then nil else var27
end

local function getFieldSpecifiers(p20, p21)
	-- upvalues: mapperKind (ref), boolean (ref), isObjectType (ref), array (ref), isInterfaceType (ref), isInputObjectType (ref)
	local var29 = p20:getType(p21)
	local list = { mapperKind.FIELD }
	
	if boolean.toJSBoolean(isObjectType(var29)) then
		list = array.concat(list, { mapperKind.COMPOSITE_FIELD, mapperKind.OBJECT_FIELD })
		
		if p21 == (if typeof(p20:getQueryType()) == "table" then p20:getQueryType().name else nil) then
			list = array.concat(list, { mapperKind.ROOT_FIELD, mapperKind.QUERY_ROOT_FIELD })
			
			return list
		elseif p21 == (if typeof(p20:getMutationType()) == "table" then p20:getMutationType().name else nil) then
			list = array.concat(list, { mapperKind.ROOT_FIELD, mapperKind.MUTATION_ROOT_FIELD })
			
			return list
		elseif p21 == (if typeof(p20:getSubscriptionType()) == "table" then p20:getSubscriptionType().name else nil) then
			list = array.concat(list, {
				mapperKind.ROOT_FIELD,
				mapperKind.SUBSCRIPTION_ROOT_FIELD
			})
			
			return list
		end
	elseif boolean.toJSBoolean(isInterfaceType(var29)) then
		list = array.concat(list, { mapperKind.COMPOSITE_FIELD, mapperKind.INTERFACE_FIELD })
		
		return list
	elseif boolean.toJSBoolean(isInputObjectType(var29)) then
		table.insert(list, mapperKind.INPUT_OBJECT_FIELD)
	end
	return list
end

getFieldMapper = function(p20, p21, p22)
	-- upvalues: getFieldSpecifiers (ref), array (ref), boolean (ref)
	local var29 = nil
	local var30 = array.concat({}, table.unpack(getFieldSpecifiers(p20, p22)))
	while not boolean.toJSBoolean(var29) and #var30 > 0 do
		var29 = p21[tostring(table.remove(var30))]
	end
	return if var29 == nil then nil else var29
end

getArgumentMapper = function(p23)
	-- upvalues: mapperKind (ref)
	local ARGUMENT = p23[tostring(mapperKind.ARGUMENT)]
	
	return if ARGUMENT == nil then nil else ARGUMENT
end

getDirectiveMapper = function(p23)
	-- upvalues: mapperKind (ref)
	local DIRECTIVE = p23[tostring(mapperKind.DIRECTIVE)]
	
	return if DIRECTIVE == nil then nil else DIRECTIVE
end

getEnumValueMapper = function(p23)
	-- upvalues: mapperKind (ref)
	local ENUM_VALUE = p23[tostring(mapperKind.ENUM_VALUE)]
	
	return if ENUM_VALUE == nil then nil else ENUM_VALUE
end

function t.correctASTNodes(p23)
	-- upvalues: boolean (ref), isObjectType (ref), object (ref), kind (ref), array (ref), graphQLObjectType (ref), isInterfaceType (ref), graphQLInterfaceType (ref), isInputObjectType (ref), graphQLInputObjectType (ref), isEnumType (ref), graphQLEnumType (ref)
	if boolean.toJSBoolean(isObjectType(p23)) then
		local var31 = p23:toConfig()
		
		if var31.astNode ~= nil then
			local t = {}
			
			for i, v in var31.fields do
				local var32 = var31.fields:get(table.unpack(v))
				
				if var32.astNode ~= nil then
					table.insert(t, var32.astNode)
				end
			end
			var31.astNode = object.assign({}, var31.astNode, { kind = kind.OBJECT_TYPE_DEFINITION, fields = t })
		end
		if var31.extensionASTNodes ~= nil then
			var31.extensionASTNodes = array.map(var31.extensionASTNodes, function(p24)
				-- upvalues: object (copy), kind (copy)
				return object.assign({}, p24, { kind = kind.OBJECT_TYPE_EXTENSION, fields = object.None })
			end)
		end
		return graphQLObjectType.new(var31)
	elseif boolean.toJSBoolean(isInterfaceType(p23)) then
		local var33 = p23:toConfig()
		
		if var33.astNode ~= nil then
			local t = {}
			
			for i, v in var33.fields do
				local var34 = var33.fields:get(table.unpack(v))
				
				if var34.astNode ~= nil then
					table.insert(t, var34.astNode)
				end
			end
			var33.astNode = object.assign({}, var33.astNode, { kind = kind.INTERFACE_TYPE_DEFINITION, fields = t })
		end
		if var33.extensionASTNodes ~= nil then
			var33.extensionASTNodes = array.map(var33.extensionASTNodes, function(p24)
				-- upvalues: object (copy), kind (copy)
				return object.assign({}, p24, {
					kind = kind.INTERFACE_TYPE_EXTENSION,
					fields = object.None
				})
			end)
		end
		return graphQLInterfaceType.new(var33)
	elseif boolean.toJSBoolean(isInputObjectType(p23)) then
		local var35 = p23:toConfig()
		
		if var35.astNode ~= nil then
			local t = {}
			
			for i, v in var35.fields do
				local var36 = var35.fields:get(table.unpack(v))
				
				if var36.astNode ~= nil then
					table.insert(t, var36.astNode)
				end
			end
			var35.astNode = object.assign({}, var35.astNode, { kind = kind.INPUT_OBJECT_TYPE_DEFINITION, fields = t })
		end
		if var35.extensionASTNodes ~= nil then
			var35.extensionASTNodes = array.map(var35.extensionASTNodes, function(p24)
				-- upvalues: object (copy), kind (copy)
				return object.assign({}, p24, {
					kind = kind.INPUT_OBJECT_TYPE_EXTENSION,
					fields = object.None
				})
			end)
		end
		return graphQLInputObjectType.new(var35)
	elseif not boolean.toJSBoolean(isEnumType(p23)) then
		return p23
	end
	local var37 = p23:toConfig()
	
	if var37.astNode ~= nil then
		local t = {}
		
		for i, v in var37.values do
			local var38 = var37.values:get(table.unpack(v))
			
			if var38.astNode ~= nil then
				table.insert(t, var38.astNode)
			end
		end
		var37.astNode = object.assign({}, var37.astNode, { values = t })
	end
	if var37.extensionASTNodes ~= nil then
		var37.extensionASTNodes = array.map(var37.extensionASTNodes, function(p24)
			-- upvalues: object (copy)
			return object.assign({}, p24, { values = object.None })
		end)
	end
	return graphQLEnumType.new(var37)
end

return t