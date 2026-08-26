local parent = script.Parent.Parent
local luauPolyfillModule = require(parent.Parent.LuauPolyfill)
local array = luauPolyfillModule.Array
local error = luauPolyfillModule.Error
local map = luauPolyfillModule.Map
local object = luauPolyfillModule.Object
local coerceToMap = luauPolyfillModule.coerceToMap
local mapValueOrdered = require(parent.luaUtils.mapValueOrdered).mapValueOrdered
local _ = require(parent.luaUtils.null)
local jsutils = parent.jsutils
local keyMap = require(jsutils.keyMap).keyMap
local inspect = require(jsutils.inspect).inspect
local devAssert = require(jsutils.devAssert).devAssert
local _ = require(jsutils.ObjMap)
local _ = require(parent.language.ast)
local kind = require(parent.language.kinds).Kind
local predicatesModule = require(parent.language.predicates)
local isTypeDefinitionNode = predicatesModule.isTypeDefinitionNode
local isTypeExtensionNode = predicatesModule.isTypeExtensionNode
local assertValidSDLExtension = require(parent.validation.validate).assertValidSDLExtension
local getDirectiveValues = require(parent.execution.values).getDirectiveValues
local type = parent.type
local schemaModule = require(type.schema)
local assertSchema = schemaModule.assertSchema
local graphQLSchema = schemaModule.GraphQLSchema
local scalarsModule = require(type.scalars)
local specifiedScalarTypes = scalarsModule.specifiedScalarTypes
local isSpecifiedScalarType = scalarsModule.isSpecifiedScalarType
local introspectionModule = require(type.introspection)
local introspectionTypes = introspectionModule.introspectionTypes
local isIntrospectionType = introspectionModule.isIntrospectionType
local directivesModule = require(type.directives)
local graphQLDirective = directivesModule.GraphQLDirective
local graphQLDeprecatedDirective = directivesModule.GraphQLDeprecatedDirective
local graphQLSpecifiedByDirective = directivesModule.GraphQLSpecifiedByDirective
local definitionModule = require(type.definition)
local isScalarType = definitionModule.isScalarType
local isObjectType = definitionModule.isObjectType
local isInterfaceType = definitionModule.isInterfaceType
local isUnionType = definitionModule.isUnionType
local isListType = definitionModule.isListType
local isNonNullType = definitionModule.isNonNullType
local isEnumType = definitionModule.isEnumType
local isInputObjectType = definitionModule.isInputObjectType
local graphQLList = definitionModule.GraphQLList
local graphQLNonNull = definitionModule.GraphQLNonNull
local graphQLScalarType = definitionModule.GraphQLScalarType
local graphQLObjectType = definitionModule.GraphQLObjectType
local graphQLInterfaceType = definitionModule.GraphQLInterfaceType
local graphQLUnionType = definitionModule.GraphQLUnionType
local graphQLEnumType = definitionModule.GraphQLEnumType
local graphQLInputObjectType = definitionModule.GraphQLInputObjectType
local valueFromAST = require(script.Parent.valueFromAST).valueFromAST
local var1 = nil
local getDeprecationReason = nil
local getSpecifiedByUrl = nil

local function extendSchema(p1, p2, p3)
	-- upvalues: assertSchema (ref), devAssert (ref), kind (ref), assertValidSDLExtension (ref), graphQLSchema (ref)
	assertSchema(p1)
	devAssert(p2 ~= nil and p2.kind == kind.DOCUMENT, "Must provide valid Document AST.")
	
	if (p3 and p3.assumeValid) ~= true and (p3 and p3.assumeValidSDL) ~= true then
		assertValidSDLExtension(p2, p1)
	end
	local var2 = p1:toConfig()
	local var3 = extendSchemaImpl(var2, p2, p3)
	
	return if var2 == var3 then p1 else graphQLSchema.new(var3)
end

function extendSchemaImpl(p1, p2, p3)
	-- upvalues: map (ref), kind (ref), isTypeDefinitionNode (ref), isTypeExtensionNode (ref), array (ref), isListType (ref), graphQLList (ref), isNonNullType (ref), graphQLNonNull (ref), graphQLDirective (ref), object (ref), mapValueOrdered (ref), coerceToMap (ref), isIntrospectionType (ref), isSpecifiedScalarType (ref), isScalarType (ref), isObjectType (ref), isInterfaceType (ref), isUnionType (ref), isEnumType (ref), isInputObjectType (ref), inspect (ref), graphQLInputObjectType (ref), graphQLEnumType (ref), getSpecifiedByUrl (write), graphQLScalarType (ref), graphQLObjectType (ref), graphQLInterfaceType (ref), graphQLUnionType (ref), var1 (write), error (ref), getDeprecationReason (write), valueFromAST (ref)
	local t = {}
	local var2 = map.new()
	local t_1 = {}
	local var3 = nil
	local t_2 = {}
	
	for i, v in ipairs(p2.definitions) do
		if v.kind == kind.SCHEMA_DEFINITION then
			var3 = v
		elseif v.kind == kind.SCHEMA_EXTENSION then
			table.insert(t_2, v)
		elseif isTypeDefinitionNode(v) then
			table.insert(t, v)
		elseif isTypeExtensionNode(v) then
			local extendObjectType = v.name.value
			local extendInterfaceType = var2:get(extendObjectType)
			var2:set(extendObjectType, if extendInterfaceType then array.concat(extendInterfaceType, { v }) else { v })
		elseif v.kind == kind.DIRECTIVE_DEFINITION then
			table.insert(t_1, v)
		end
	end
	if #var2:keys() == 0 and #t == 0 and (#t_1 == 0 and #t_2 == 0) and var3 == nil then
		return p1
	end
	local var4 = map.new()
	local replaceNamedType = nil
	local extendArg = nil
	local extendField = nil
	local extendScalarType = nil
	local extendObjectType = nil
	local extendInterfaceType = nil
	local extendUnionType = nil
	local extendEnumType = nil
	local extendInputObjectType = nil
	local buildInputFieldMap = nil
	local buildEnumValueMap = nil
	local buildInterfaces = nil
	local buildUnionTypes = nil
	local getNamedType = nil
	local buildArgumentMap = nil
	local buildFieldMap = nil
	
	local function replaceType(p4)
		-- upvalues: isListType (copy), graphQLList (copy), replaceType (ref), isNonNullType (copy), graphQLNonNull (copy), replaceNamedType (write)
		return if isListType(p4) then graphQLList.new(replaceType(p4.ofType)) elseif isNonNullType(p4) then graphQLNonNull.new(replaceType(p4.ofType)) else replaceNamedType(p4)
	end
	
	replaceNamedType = function(p4)
		-- upvalues: var4 (ref)
		return var4:get(p4.name)
	end
	
	local function replaceDirective(p4)
		-- upvalues: graphQLDirective (copy), object (copy), mapValueOrdered (copy), coerceToMap (copy), extendArg (write)
		local var5 = p4:toConfig()
		
		return graphQLDirective.new(object.assign({}, var5, {
			args = mapValueOrdered(coerceToMap(var5.args), extendArg)
		}))
	end
	
	local function extendNamedType(p4)
		-- upvalues: isIntrospectionType (copy), isSpecifiedScalarType (copy), isScalarType (copy), extendScalarType (write), isObjectType (copy), extendObjectType (write), isInterfaceType (copy), extendInterfaceType (write), isUnionType (copy), extendUnionType (write), isEnumType (copy), extendEnumType (write), isInputObjectType (copy), extendInputObjectType (write), inspect (copy)
		if isIntrospectionType(p4) or isSpecifiedScalarType(p4) then
			return p4
		elseif isScalarType(p4) then
			return extendScalarType(p4)
		elseif isObjectType(p4) then
			return extendObjectType(p4)
		elseif isInterfaceType(p4) then
			return extendInterfaceType(p4)
		elseif isUnionType(p4) then
			return extendUnionType(p4)
		elseif isEnumType(p4) then
			return extendEnumType(p4)
		elseif isInputObjectType(p4) then
			return extendInputObjectType(p4)
		end
		assert(false, "Unexpected type: " .. inspect(p4))
	end
	
	extendInputObjectType = function(p4)
		-- upvalues: var2 (ref), graphQLInputObjectType (copy), object (copy), map (copy), array (copy), mapValueOrdered (copy), coerceToMap (copy), replaceType (ref), buildInputFieldMap (write)
		local var5 = p4:toConfig()
		local name = var2[var5.name] or {}
		
		return graphQLInputObjectType.new(object.assign({}, var5, {
			fields = function()
				-- upvalues: map (copy), array (copy), mapValueOrdered (copy), coerceToMap (copy), var5 (ref), object (copy), replaceType (copy), buildInputFieldMap (copy), name (ref)
				return map.new(array.concat(mapValueOrdered(coerceToMap(var5.fields), function(p5)
					-- upvalues: object (copy), replaceType (copy)
					return object.assign({}, p5, { type = replaceType(p5.type) })
				end):entries(), buildInputFieldMap(name):entries()))
			end,
			extensionASTNodes = array.concat(var5.extensionASTNodes, name)
		}))
	end
	
	extendEnumType = function(p4)
		-- upvalues: var2 (ref), graphQLEnumType (copy), object (copy), map (copy), array (copy), buildEnumValueMap (write)
		local var5 = p4:toConfig()
		local name = var2:get(p4.name) or {}
		
		return graphQLEnumType.new(object.assign({}, var5, {
			values = map.new(array.concat(var5.values:entries(), buildEnumValueMap(name):entries())),
			extensionASTNodes = array.concat(var5.extensionASTNodes, name)
		}))
	end
	
	extendScalarType = function(p4)
		-- upvalues: var2 (ref), getSpecifiedByUrl (copy), graphQLScalarType (copy), object (copy), array (copy)
		local var5 = p4:toConfig()
		local name = var2:get(var5.name) or {}
		local specifiedByUrl = var5.specifiedByUrl
		
		for i, v in ipairs(name) do
			specifiedByUrl = getSpecifiedByUrl(v) or specifiedByUrl
		end
		return graphQLScalarType.new(object.assign({}, var5, {
			specifiedByUrl = specifiedByUrl,
			extensionASTNodes = array.concat(var5.extensionASTNodes, name)
		}))
	end
	
	extendObjectType = function(p5)
		-- upvalues: var2 (ref), graphQLObjectType (copy), object (copy), array (copy), replaceNamedType (write), buildInterfaces (write), map (copy), mapValueOrdered (copy), coerceToMap (copy), extendField (write), buildFieldMap (write)
		local var6 = p5:toConfig()
		local name = var2:get(var6.name) or {}
		
		return graphQLObjectType.new(object.assign({}, var6, {
			interfaces = function()
				-- upvalues: array (copy), p5 (ref), replaceNamedType (copy), buildInterfaces (copy), name (ref)
				return array.concat(array.map(p5:getInterfaces(), replaceNamedType), buildInterfaces(name))
			end,
			fields = function()
				-- upvalues: map (copy), array (copy), mapValueOrdered (copy), coerceToMap (copy), var6 (ref), extendField (copy), buildFieldMap (copy), name (ref)
				return map.new(array.concat(mapValueOrdered(coerceToMap(var6.fields), extendField):entries(), buildFieldMap(name):entries()))
			end,
			extensionASTNodes = array.concat(var6.extensionASTNodes, name)
		}))
	end
	
	extendInterfaceType = function(p5)
		-- upvalues: var2 (ref), graphQLInterfaceType (copy), object (copy), array (copy), replaceNamedType (write), buildInterfaces (write), map (copy), mapValueOrdered (copy), coerceToMap (copy), extendField (write), buildFieldMap (write)
		local var6 = p5:toConfig()
		local name = var2:get(var6.name) or {}
		
		return graphQLInterfaceType.new(object.assign({}, var6, {
			interfaces = function()
				-- upvalues: array (copy), p5 (ref), replaceNamedType (copy), buildInterfaces (copy), name (ref)
				return array.concat(array.map(p5:getInterfaces(), replaceNamedType), buildInterfaces(name))
			end,
			fields = function()
				-- upvalues: map (copy), array (copy), mapValueOrdered (copy), coerceToMap (copy), var6 (ref), extendField (copy), buildFieldMap (copy), name (ref)
				return map.new(array.concat(mapValueOrdered(coerceToMap(var6.fields), extendField):entries(), buildFieldMap(name):entries()))
			end,
			extensionASTNodes = array.concat(var6.extensionASTNodes, name)
		}))
	end
	
	extendUnionType = function(p5)
		-- upvalues: var2 (ref), graphQLUnionType (copy), object (copy), array (copy), replaceNamedType (write), buildUnionTypes (write)
		local var6 = p5:toConfig()
		local name = var2:get(var6.name) or {}
		
		return graphQLUnionType.new(object.assign({}, var6, {
			types = function()
				-- upvalues: array (copy), p5 (ref), replaceNamedType (copy), buildUnionTypes (copy), name (ref)
				return array.concat(array.map(p5:getTypes(), replaceNamedType), buildUnionTypes(name))
			end,
			extensionASTNodes = array.concat(var6.extensionASTNodes, name)
		}))
	end
	
	extendField = function(p5)
		-- upvalues: object (copy), replaceType (ref), mapValueOrdered (copy), extendArg (write)
		return object.assign({}, p5, {
			type = replaceType(p5.type),
			args = if p5.args then mapValueOrdered(p5.args, extendArg) else nil
		})
	end
	
	extendArg = function(p5)
		-- upvalues: object (copy), replaceType (ref)
		return object.assign({}, p5, { type = replaceType(p5.type) })
	end
	
	local function getOperationTypes(p5)
		-- upvalues: getNamedType (write)
		local t = {}
		
		for i, v in ipairs(p5) do
			for i_1, v_1 in ipairs(v.operationTypes or {}) do
				t[v_1.operation] = getNamedType(v_1.type)
			end
		end
		return t
	end
	
	getNamedType = function(p6)
		-- upvalues: var1 (copy), var4 (ref), error (copy)
		local value = p6.name.value
		local var6 = var1[value] or var4[value]
		
		if var6 == nil then
			error(error.new(("Unknown type: \"%s\"."):format(value)))
		end
		return var6
	end
	
	local function getWrappedType(p6)
		-- upvalues: kind (copy), graphQLList (copy), getWrappedType (ref), graphQLNonNull (copy), getNamedType (write)
		return if p6.kind == kind.LIST_TYPE then graphQLList.new(getWrappedType(p6.type)) elseif p6.kind == kind.NON_NULL_TYPE then graphQLNonNull.new(getWrappedType(p6.type)) else getNamedType(p6)
	end
	
	local function buildDirective(p6)
		-- upvalues: array (copy), graphQLDirective (copy), buildArgumentMap (write)
		return graphQLDirective.new({
			name = p6.name.value,
			description = if p6.description then p6.description.value else nil,
			locations = array.map(p6.locations, function(p7)
				return p7.value
			end),
			isRepeatable = p6.repeatable,
			args = buildArgumentMap(p6.arguments),
			astNode = p6
		})
	end
	
	buildFieldMap = function(p6)
		-- upvalues: map (copy), getWrappedType (ref), buildArgumentMap (write), getDeprecationReason (copy)
		local var6 = map.new()
		
		for i, v in ipairs(p6) do
			for i_1, v_1 in ipairs(if v.fields then v.fields else {}) do
				var6:set(v_1.name.value, {
					type = getWrappedType(v_1.type),
					description = if v_1.description then v_1.description.value else nil,
					args = buildArgumentMap(v_1.arguments),
					deprecationReason = getDeprecationReason(v_1),
					astNode = v_1
				})
			end
		end
		return var6
	end
	
	buildArgumentMap = function(p7)
		-- upvalues: map (copy), getWrappedType (ref), valueFromAST (copy), getDeprecationReason (copy)
		local var7 = map.new()
		
		for i, v in ipairs(p7 or {}) do
			local var8 = getWrappedType(v.type)
			var7:set(v.name.value, {
				type = var8,
				description = if v.description then v.description.value else nil,
				defaultValue = valueFromAST(v.defaultValue, var8),
				deprecationReason = getDeprecationReason(v),
				astNode = v
			})
		end
		return var7
	end
	
	buildInputFieldMap = function(p8)
		-- upvalues: map (copy), getWrappedType (ref), valueFromAST (copy), getDeprecationReason (copy)
		local var9 = map.new()
		
		for i, v in ipairs(p8) do
			for i_1, v_1 in ipairs(if v.fields then v.fields else {}) do
				local var10 = getWrappedType(v_1.type)
				var9:set(v_1.name.value, {
					type = var10,
					description = if v_1.description then v_1.description.value else nil,
					defaultValue = valueFromAST(v_1.defaultValue, var10),
					deprecationReason = getDeprecationReason(v_1),
					astNode = v_1
				})
			end
		end
		return var9
	end
	
	buildEnumValueMap = function(p9)
		-- upvalues: map (copy), getDeprecationReason (copy)
		local var11 = map.new()
		
		for i, v in ipairs(p9) do
			for i_1, v_1 in ipairs(if v.values then v.values else {}) do
				var11:set(v_1.name.value, {
					description = if v_1.description then v_1.description.value else nil,
					deprecationReason = getDeprecationReason(v_1),
					astNode = v_1
				})
			end
		end
		return var11
	end
	
	buildInterfaces = function(p10)
		-- upvalues: getNamedType (write)
		local t = {}
		
		for i, v in ipairs(p10) do
			if v.interfaces then
				for i_1, v_1 in ipairs(v.interfaces) do
					table.insert(t, getNamedType(v_1))
				end
			end
		end
		return t
	end
	
	buildUnionTypes = function(p11)
		-- upvalues: getNamedType (write)
		local t = {}
		
		for i, v in ipairs(p11) do
			if v.types then
				for i_1, v_1 in ipairs(v.types) do
					table.insert(t, getNamedType(v_1))
				end
			end
		end
		return t
	end
	
	local function buildType(p12)
		-- upvalues: var2 (ref), kind (copy), array (copy), graphQLObjectType (copy), buildInterfaces (write), buildFieldMap (write), graphQLInterfaceType (copy), graphQLEnumType (copy), buildEnumValueMap (write), graphQLUnionType (copy), buildUnionTypes (write), graphQLScalarType (copy), getSpecifiedByUrl (copy), graphQLInputObjectType (copy), buildInputFieldMap (write), inspect (copy)
		local value = p12.name.value
		local var12 = var2[value] or {}
		local kind_1 = p12.kind
		
		if kind_1 == kind.OBJECT_TYPE_DEFINITION then
			local var13 = array.concat(p12, var12)
			
			return graphQLObjectType.new({
				name = value,
				description = if p12.description then p12.description.value else nil,
				interfaces = function()
					-- upvalues: buildInterfaces (copy), var13 (ref)
					return buildInterfaces(var13)
				end,
				fields = function()
					-- upvalues: buildFieldMap (copy), var13 (ref)
					return buildFieldMap(var13)
				end,
				astNode = p12,
				extensionASTNodes = var12
			})
		elseif kind_1 == kind.INTERFACE_TYPE_DEFINITION then
			local var14 = array.concat(p12, var12)
			
			return graphQLInterfaceType.new({
				name = value,
				description = if p12.description then p12.description.value else nil,
				interfaces = function()
					-- upvalues: buildInterfaces (copy), var14 (ref)
					return buildInterfaces(var14)
				end,
				fields = function()
					-- upvalues: buildFieldMap (copy), var14 (ref)
					return buildFieldMap(var14)
				end,
				astNode = p12,
				extensionASTNodes = var12
			})
		elseif kind_1 == kind.ENUM_TYPE_DEFINITION then
			return graphQLEnumType.new({
				name = value,
				description = if p12.description then p12.description.value else nil,
				values = buildEnumValueMap(array.concat(p12, var12)),
				astNode = p12,
				extensionASTNodes = var12
			})
		elseif kind_1 == kind.UNION_TYPE_DEFINITION then
			local var15 = array.concat(p12, var12)
			
			return graphQLUnionType.new({
				name = value,
				description = if p12.description then p12.description.value else nil,
				types = function()
					-- upvalues: buildUnionTypes (copy), var15 (ref)
					return buildUnionTypes(var15)
				end,
				astNode = p12,
				extensionASTNodes = var12
			})
		elseif kind_1 == kind.SCALAR_TYPE_DEFINITION then
			return graphQLScalarType.new({
				name = value,
				description = if p12.description then p12.description.value else nil,
				specifiedByUrl = getSpecifiedByUrl(p12),
				astNode = p12,
				extensionASTNodes = var12
			})
		elseif kind_1 == kind.INPUT_OBJECT_TYPE_DEFINITION then
			local var16 = array.concat(p12, var12)
			
			return graphQLInputObjectType.new({
				name = value,
				description = if p12.description then p12.description.value else nil,
				fields = function()
					-- upvalues: buildInputFieldMap (copy), var16 (ref)
					return buildInputFieldMap(var16)
				end,
				astNode = p12,
				extensionASTNodes = var12
			})
		end
		assert(false, "Unexpected type definition node: " .. inspect(p12))
	end
	
	for i_1, v_1 in ipairs(p1.types) do
		var4:set(v_1.name, extendNamedType(v_1))
	end
	for i_2, v_2 in ipairs(t) do
		local value = v_2.name.value
		var4:set(value, var1[value] or buildType(v_2))
	end
	local var12 = object.assign({}, {
		description = if not (var3 == nil or var3.description == nil) then var3.description.value else nil
	}, object.assign({}, {
		query = p1.query and replaceNamedType(p1.query),
		mutation = p1.mutation and replaceNamedType(p1.mutation),
		subscription = p1.subscription and replaceNamedType(p1.subscription)
	}, var3 and getOperationTypes({ var3 }) or {}, getOperationTypes(t_2)), {
		types = var4:values(),
		directives = array.concat(array.map(p1.directives, replaceDirective), array.map(t_1, buildDirective)),
		astNode = var3 or p1.astNode,
		extensionASTNodes = array.concat(p1.extensionASTNodes, t_2),
		assumeValid = not (p3 == nil or p3.assumeValid == nil) and p3.assumeValid
	})
	var12.extensions = nil
	
	return var12
end

var1 = keyMap(array.concat(specifiedScalarTypes, introspectionTypes), function(p12)
	return p12.name
end)

getDeprecationReason = function(p12)
	-- upvalues: getDirectiveValues (ref), graphQLDeprecatedDirective (ref)
	local var13 = getDirectiveValues(graphQLDeprecatedDirective, p12)
	
	return var13 and var13.reason
end

getSpecifiedByUrl = function(p12)
	-- upvalues: getDirectiveValues (ref), graphQLSpecifiedByDirective (ref)
	local var13 = getDirectiveValues(graphQLSpecifiedByDirective, p12)
	
	return var13 and var13.url
end

return {
	extendSchema = extendSchema,
	extendSchemaImpl = extendSchemaImpl
}