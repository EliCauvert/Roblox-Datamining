-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:38 2026 Pacific Standard Time.

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
local var7 = nil
local getDeprecationReason = nil
local getSpecifiedByUrl = nil

local function extendSchema(p0, p1, p2) --[[ line: 152 ]]
	-- upvalues: assertSchema (ref), devAssert (ref), kind (ref), assertValidSDLExtension (ref), graphQLSchema (ref)
	assertSchema(p0)
	devAssert(p1 ~= nil and p1.kind == kind.DOCUMENT, "Must provide valid Document AST.")
	
	if (p2 and p2.assumeValid) ~= true and (p2 and p2.assumeValidSDL) ~= true then
		assertValidSDLExtension(p1, p0)
	end
	local var11 = p0:toConfig()
	local var12 = extendSchemaImpl(var11, p1, p2)
	
	return if var11 == var12 then p0 else graphQLSchema.new(var12)
end

function extendSchemaImpl(p3, p4, p5) --[[ line: 175 ]]
	-- upvalues: map (ref), kind (ref), isTypeDefinitionNode (ref), isTypeExtensionNode (ref), array (ref), isListType (ref), graphQLList (ref), isNonNullType (ref), graphQLNonNull (ref), graphQLDirective (ref), object (ref), mapValueOrdered (ref), coerceToMap (ref), isIntrospectionType (ref), isSpecifiedScalarType (ref), isScalarType (ref), isObjectType (ref), isInterfaceType (ref), isUnionType (ref), isEnumType (ref), isInputObjectType (ref), inspect (ref), graphQLInputObjectType (ref), graphQLEnumType (ref), getSpecifiedByUrl (write), graphQLScalarType (ref), graphQLObjectType (ref), graphQLInterfaceType (ref), graphQLUnionType (ref), var7 (write), error (ref), getDeprecationReason (write), valueFromAST (ref)
	local t = {}
	local var14 = map.new()
	local t_1 = {}
	local var16 = nil
	local t_2 = {}
	
	for i, v in ipairs(p4.definitions) do
		if v.kind == kind.SCHEMA_DEFINITION then
			var16 = v
		elseif v.kind == kind.SCHEMA_EXTENSION then
			table.insert(t_2, v)
		elseif isTypeDefinitionNode(v) then
			table.insert(t, v)
		elseif isTypeExtensionNode(v) then
			local extendObjectType = v.name.value
			local extendInterfaceType = var14:get(extendObjectType)
			var14:set(extendObjectType, if extendInterfaceType then array.concat(extendInterfaceType, { v }) else { v })
		elseif v.kind == kind.DIRECTIVE_DEFINITION then
			table.insert(t_1, v)
		end
	end
	if #var14:keys() == 0 and #t == 0 and (#t_1 == 0 and #t_2 == 0) and var16 == nil then
		return p3
	end
	local var18 = map.new()
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
	
	local function replaceType(p6) --[[ line: 279 ]]
		-- upvalues: isListType (copy), graphQLList (copy), replaceType (ref), isNonNullType (copy), graphQLNonNull (copy), replaceNamedType (write)
		return if isListType(p6) then graphQLList.new(replaceType(p6.ofType)) elseif isNonNullType(p6) then graphQLNonNull.new(replaceType(p6.ofType)) else replaceNamedType(p6)
	end
	
	replaceNamedType = function(p7) --[[ line: 291 | named "replaceNamedType" ]]
		-- upvalues: var18 (ref)
		return var18:get(p7.name)
	end
	
	local function replaceDirective(p8) --[[ line: 299 ]]
		-- upvalues: graphQLDirective (copy), object (copy), mapValueOrdered (copy), coerceToMap (copy), extendArg (write)
		local var43 = p8:toConfig()
		
		return graphQLDirective.new(object.assign({}, var43, {
			args = mapValueOrdered(coerceToMap(var43.args), extendArg)
		}))
	end
	
	local function extendNamedType(p9) --[[ line: 310 ]]
		-- upvalues: isIntrospectionType (copy), isSpecifiedScalarType (copy), isScalarType (copy), extendScalarType (write), isObjectType (copy), extendObjectType (write), isInterfaceType (copy), extendInterfaceType (write), isUnionType (copy), extendUnionType (write), isEnumType (copy), extendEnumType (write), isInputObjectType (copy), extendInputObjectType (write), inspect (copy)
		if isIntrospectionType(p9) or isSpecifiedScalarType(p9) then
			return p9
		elseif isScalarType(p9) then
			return extendScalarType(p9)
		elseif isObjectType(p9) then
			return extendObjectType(p9)
		elseif isInterfaceType(p9) then
			return extendInterfaceType(p9)
		elseif isUnionType(p9) then
			return extendUnionType(p9)
		elseif isEnumType(p9) then
			return extendEnumType(p9)
		elseif isInputObjectType(p9) then
			return extendInputObjectType(p9)
		end
		assert(false, "Unexpected type: " .. inspect(p9))
	end
	
	extendInputObjectType = function(p10) --[[ line: 341 | named "extendInputObjectType" ]]
		-- upvalues: var14 (ref), graphQLInputObjectType (copy), object (copy), map (copy), array (copy), mapValueOrdered (copy), coerceToMap (copy), replaceType (ref), buildInputFieldMap (write)
		local var44 = p10:toConfig()
		local name = var14[var44.name] or {}
		
		return graphQLInputObjectType.new(object.assign({}, var44, {
			fields = function() --[[ line: 347 ]]
				-- upvalues: map (copy), array (copy), mapValueOrdered (copy), coerceToMap (copy), var44 (ref), object (copy), replaceType (copy), buildInputFieldMap (copy), name (ref)
				return map.new(array.concat(mapValueOrdered(coerceToMap(var44.fields), function(p11) --[[ line: 349 ]]
					-- upvalues: object (copy), replaceType (copy)
					return object.assign({}, p11, { type = replaceType(p11.type) })
				end):entries(), buildInputFieldMap(name):entries()))
			end,
			extensionASTNodes = array.concat(var44.extensionASTNodes, name)
		}))
	end
	
	extendEnumType = function(p12) --[[ line: 360 | named "extendEnumType" ]]
		-- upvalues: var14 (ref), graphQLEnumType (copy), object (copy), map (copy), array (copy), buildEnumValueMap (write)
		local var46 = p12:toConfig()
		local name = var14:get(p12.name) or {}
		
		return graphQLEnumType.new(object.assign({}, var46, {
			values = map.new(array.concat(var46.values:entries(), buildEnumValueMap(name):entries())),
			extensionASTNodes = array.concat(var46.extensionASTNodes, name)
		}))
	end
	
	extendScalarType = function(p13) --[[ line: 378 | named "extendScalarType" ]]
		-- upvalues: var14 (ref), getSpecifiedByUrl (copy), graphQLScalarType (copy), object (copy), array (copy)
		local var48 = p13:toConfig()
		local name = var14:get(var48.name) or {}
		local specifiedByUrl = var48.specifiedByUrl
		
		for i, v in ipairs(name) do
			specifiedByUrl = getSpecifiedByUrl(v) or specifiedByUrl
		end
		return graphQLScalarType.new(object.assign({}, var48, {
			specifiedByUrl = specifiedByUrl,
			extensionASTNodes = array.concat(var48.extensionASTNodes, name)
		}))
	end
	
	extendObjectType = function(p14) --[[ line: 394 | named "extendObjectType" ]]
		-- upvalues: var14 (ref), graphQLObjectType (copy), object (copy), array (copy), replaceNamedType (write), buildInterfaces (write), map (copy), mapValueOrdered (copy), coerceToMap (copy), extendField (write), buildFieldMap (write)
		local var50 = p14:toConfig()
		local name = var14:get(var50.name) or {}
		
		return graphQLObjectType.new(object.assign({}, var50, {
			interfaces = function() --[[ line: 400 ]]
				-- upvalues: array (copy), p14 (ref), replaceNamedType (copy), buildInterfaces (copy), name (ref)
				return array.concat(array.map(p14:getInterfaces(), replaceNamedType), buildInterfaces(name))
			end,
			fields = function() --[[ line: 407 ]]
				-- upvalues: map (copy), array (copy), mapValueOrdered (copy), coerceToMap (copy), var50 (ref), extendField (copy), buildFieldMap (copy), name (ref)
				return map.new(array.concat(mapValueOrdered(coerceToMap(var50.fields), extendField):entries(), buildFieldMap(name):entries()))
			end,
			extensionASTNodes = array.concat(var50.extensionASTNodes, name)
		}))
	end
	
	extendInterfaceType = function(p15) --[[ line: 419 | named "extendInterfaceType" ]]
		-- upvalues: var14 (ref), graphQLInterfaceType (copy), object (copy), array (copy), replaceNamedType (write), buildInterfaces (write), map (copy), mapValueOrdered (copy), coerceToMap (copy), extendField (write), buildFieldMap (write)
		local var52 = p15:toConfig()
		local name = var14:get(var52.name) or {}
		
		return graphQLInterfaceType.new(object.assign({}, var52, {
			interfaces = function() --[[ line: 425 ]]
				-- upvalues: array (copy), p15 (ref), replaceNamedType (copy), buildInterfaces (copy), name (ref)
				return array.concat(array.map(p15:getInterfaces(), replaceNamedType), buildInterfaces(name))
			end,
			fields = function() --[[ line: 432 ]]
				-- upvalues: map (copy), array (copy), mapValueOrdered (copy), coerceToMap (copy), var52 (ref), extendField (copy), buildFieldMap (copy), name (ref)
				return map.new(array.concat(mapValueOrdered(coerceToMap(var52.fields), extendField):entries(), buildFieldMap(name):entries()))
			end,
			extensionASTNodes = array.concat(var52.extensionASTNodes, name)
		}))
	end
	
	extendUnionType = function(p16) --[[ line: 444 | named "extendUnionType" ]]
		-- upvalues: var14 (ref), graphQLUnionType (copy), object (copy), array (copy), replaceNamedType (write), buildUnionTypes (write)
		local var54 = p16:toConfig()
		local name = var14:get(var54.name) or {}
		
		return graphQLUnionType.new(object.assign({}, var54, {
			types = function() --[[ line: 450 ]]
				-- upvalues: array (copy), p16 (ref), replaceNamedType (copy), buildUnionTypes (copy), name (ref)
				return array.concat(array.map(p16:getTypes(), replaceNamedType), buildUnionTypes(name))
			end,
			extensionASTNodes = array.concat(var54.extensionASTNodes, name)
		}))
	end
	
	extendField = function(p17) --[[ line: 461 | named "extendField" ]]
		-- upvalues: object (copy), replaceType (ref), mapValueOrdered (copy), extendArg (write)
		return object.assign({}, p17, {
			type = replaceType(p17.type),
			args = if p17.args then mapValueOrdered(p17.args, extendArg) else nil
		})
	end
	
	extendArg = function(p18) --[[ line: 469 | named "extendArg" ]]
		-- upvalues: object (copy), replaceType (ref)
		return object.assign({}, p18, { type = replaceType(p18.type) })
	end
	
	local function getOperationTypes(p19) --[[ line: 473 ]]
		-- upvalues: getNamedType (write)
		local t = {}
		
		for i, v in ipairs(p19) do
			for i_1, v_1 in ipairs(v.operationTypes or {}) do
				t[v_1.operation] = getNamedType(v_1.type)
			end
		end
		return t
	end
	
	getNamedType = function(p20) --[[ line: 496 | named "getNamedType" ]]
		-- upvalues: var7 (copy), var18 (ref), error (copy)
		local value = p20.name.value
		local var57 = var7[value] or var18[value]
		
		if var57 == nil then
			error(error.new(("Unknown type: \"%s\"."):format(value)))
		end
		return var57
	end
	
	local function getWrappedType(p21) --[[ line: 508 ]]
		-- upvalues: kind (copy), graphQLList (copy), getWrappedType (ref), graphQLNonNull (copy), getNamedType (write)
		return if p21.kind == kind.LIST_TYPE then graphQLList.new(getWrappedType(p21.type)) elseif p21.kind == kind.NON_NULL_TYPE then graphQLNonNull.new(getWrappedType(p21.type)) else getNamedType(p21)
	end
	
	local function buildDirective(p22) --[[ line: 519 ]]
		-- upvalues: array (copy), graphQLDirective (copy), buildArgumentMap (write)
		return graphQLDirective.new({
			name = p22.name.value,
			description = if p22.description then p22.description.value else nil,
			locations = array.map(p22.locations, function(p23) --[[ line: 520 ]]
				return p23.value
			end),
			isRepeatable = p22.repeatable,
			args = buildArgumentMap(p22.arguments),
			astNode = p22
		})
	end
	
	buildFieldMap = function(p24) --[[ line: 537 | named "buildFieldMap" ]]
		-- upvalues: map (copy), getWrappedType (ref), buildArgumentMap (write), getDeprecationReason (copy)
		local var58 = map.new()
		
		for i, v in ipairs(p24) do
			for i_1, v_1 in ipairs(if v.fields then v.fields else {}) do
				var58:set(v_1.name.value, {
					type = getWrappedType(v_1.type),
					description = if v_1.description then v_1.description.value else nil,
					args = buildArgumentMap(v_1.arguments),
					deprecationReason = getDeprecationReason(v_1),
					astNode = v_1
				})
			end
		end
		return var58
	end
	
	buildArgumentMap = function(p25) --[[ line: 565 | named "buildArgumentMap" ]]
		-- upvalues: map (copy), getWrappedType (ref), valueFromAST (copy), getDeprecationReason (copy)
		local var59 = map.new()
		
		for i, v in ipairs(p25 or {}) do
			local var60 = getWrappedType(v.type)
			var59:set(v.name.value, {
				type = var60,
				description = if v.description then v.description.value else nil,
				defaultValue = valueFromAST(v.defaultValue, var60),
				deprecationReason = getDeprecationReason(v),
				astNode = v
			})
		end
		return var59
	end
	
	buildInputFieldMap = function(p26) --[[ line: 589 | named "buildInputFieldMap" ]]
		-- upvalues: map (copy), getWrappedType (ref), valueFromAST (copy), getDeprecationReason (copy)
		local var61 = map.new()
		
		for i, v in ipairs(p26) do
			for i_1, v_1 in ipairs(if v.fields then v.fields else {}) do
				local var62 = getWrappedType(v_1.type)
				var61:set(v_1.name.value, {
					type = var62,
					description = if v_1.description then v_1.description.value else nil,
					defaultValue = valueFromAST(v_1.defaultValue, var62),
					deprecationReason = getDeprecationReason(v_1),
					astNode = v_1
				})
			end
		end
		return var61
	end
	
	buildEnumValueMap = function(p27) --[[ line: 621 | named "buildEnumValueMap" ]]
		-- upvalues: map (copy), getDeprecationReason (copy)
		local var63 = map.new()
		
		for i, v in ipairs(p27) do
			for i_1, v_1 in ipairs(if v.values then v.values else {}) do
				var63:set(v_1.name.value, {
					description = if v_1.description then v_1.description.value else nil,
					deprecationReason = getDeprecationReason(v_1),
					astNode = v_1
				})
			end
		end
		return var63
	end
	
	buildInterfaces = function(p28) --[[ line: 644 | named "buildInterfaces" ]]
		-- upvalues: getNamedType (write)
		local t = {}
		
		for i, v in ipairs(p28) do
			if v.interfaces then
				for i_1, v_1 in ipairs(v.interfaces) do
					table.insert(t, getNamedType(v_1))
				end
			end
		end
		return t
	end
	
	buildUnionTypes = function(p29) --[[ line: 670 | named "buildUnionTypes" ]]
		-- upvalues: getNamedType (write)
		local t = {}
		
		for i, v in ipairs(p29) do
			if v.types then
				for i_1, v_1 in ipairs(v.types) do
					table.insert(t, getNamedType(v_1))
				end
			end
		end
		return t
	end
	
	local function buildType(p30) --[[ line: 691 ]]
		-- upvalues: var14 (ref), kind (copy), array (copy), graphQLObjectType (copy), buildInterfaces (write), buildFieldMap (write), graphQLInterfaceType (copy), graphQLEnumType (copy), buildEnumValueMap (write), graphQLUnionType (copy), buildUnionTypes (write), graphQLScalarType (copy), getSpecifiedByUrl (copy), graphQLInputObjectType (copy), buildInputFieldMap (write), inspect (copy)
		local value = p30.name.value
		local var66 = var14[value] or {}
		local kind_1 = p30.kind
		
		if kind_1 == kind.OBJECT_TYPE_DEFINITION then
			local var67 = array.concat(p30, var66)
			
			return graphQLObjectType.new({
				name = value,
				description = if p30.description then p30.description.value else nil,
				interfaces = function() --[[ line: 704 ]]
					-- upvalues: buildInterfaces (copy), var67 (ref)
					return buildInterfaces(var67)
				end,
				fields = function() --[[ line: 707 ]]
					-- upvalues: buildFieldMap (copy), var67 (ref)
					return buildFieldMap(var67)
				end,
				astNode = p30,
				extensionASTNodes = var66
			})
		elseif kind_1 == kind.INTERFACE_TYPE_DEFINITION then
			local var68 = array.concat(p30, var66)
			
			return graphQLInterfaceType.new({
				name = value,
				description = if p30.description then p30.description.value else nil,
				interfaces = function() --[[ line: 724 ]]
					-- upvalues: buildInterfaces (copy), var68 (ref)
					return buildInterfaces(var68)
				end,
				fields = function() --[[ line: 727 ]]
					-- upvalues: buildFieldMap (copy), var68 (ref)
					return buildFieldMap(var68)
				end,
				astNode = p30,
				extensionASTNodes = var66
			})
		elseif kind_1 == kind.ENUM_TYPE_DEFINITION then
			return graphQLEnumType.new({
				name = value,
				description = if p30.description then p30.description.value else nil,
				values = buildEnumValueMap(array.concat(p30, var66)),
				astNode = p30,
				extensionASTNodes = var66
			})
		elseif kind_1 == kind.UNION_TYPE_DEFINITION then
			local var69 = array.concat(p30, var66)
			
			return graphQLUnionType.new({
				name = value,
				description = if p30.description then p30.description.value else nil,
				types = function() --[[ line: 750 ]]
					-- upvalues: buildUnionTypes (copy), var69 (ref)
					return buildUnionTypes(var69)
				end,
				astNode = p30,
				extensionASTNodes = var66
			})
		elseif kind_1 == kind.SCALAR_TYPE_DEFINITION then
			return graphQLScalarType.new({
				name = value,
				description = if p30.description then p30.description.value else nil,
				specifiedByUrl = getSpecifiedByUrl(p30),
				astNode = p30,
				extensionASTNodes = var66
			})
		elseif kind_1 == kind.INPUT_OBJECT_TYPE_DEFINITION then
			local var70 = array.concat(p30, var66)
			
			return graphQLInputObjectType.new({
				name = value,
				description = if p30.description then p30.description.value else nil,
				fields = function() --[[ line: 773 ]]
					-- upvalues: buildInputFieldMap (copy), var70 (ref)
					return buildInputFieldMap(var70)
				end,
				astNode = p30,
				extensionASTNodes = var66
			})
		end
		assert(false, "Unexpected type definition node: " .. inspect(p30))
	end
	
	for i_1, v_1 in ipairs(p3.types) do
		var18:set(v_1.name, extendNamedType(v_1))
	end
	for i_2, v_2 in ipairs(t) do
		local value = v_2.name.value
		var18:set(value, var7[value] or buildType(v_2))
	end
	local var42 = object.assign({}, {
		description = if not (var16 == nil or var16.description == nil) then var16.description.value else nil
	}, object.assign({}, {
		query = p3.query and replaceNamedType(p3.query),
		mutation = p3.mutation and replaceNamedType(p3.mutation),
		subscription = p3.subscription and replaceNamedType(p3.subscription)
	}, var16 and getOperationTypes({ var16 }) or {}, getOperationTypes(t_2)), {
		types = var18:values(),
		directives = array.concat(array.map(p3.directives, replaceDirective), array.map(t_1, buildDirective)),
		astNode = var16 or p3.astNode,
		extensionASTNodes = array.concat(p3.extensionASTNodes, t_2),
		assumeValid = not (p5 == nil or p5.assumeValid == nil) and p5.assumeValid
	})
	var42.extensions = nil
	
	return var42
end

var7 = keyMap(array.concat(specifiedScalarTypes, introspectionTypes), function(p31) --[[ line: 846 ]]
	return p31.name
end)

getDeprecationReason = function(p32) --[[ line: 854 | named "getDeprecationReason" ]]
	-- upvalues: getDirectiveValues (ref), graphQLDeprecatedDirective (ref)
	local var71 = getDirectiveValues(graphQLDeprecatedDirective, p32)
	
	return var71 and var71.reason
end

getSpecifiedByUrl = function(p33) --[[ line: 864 | named "getSpecifiedByUrl" ]]
	-- upvalues: getDirectiveValues (ref), graphQLSpecifiedByDirective (ref)
	local var72 = getDirectiveValues(graphQLSpecifiedByDirective, p33)
	
	return var72 and var72.url
end

return {
	extendSchema = extendSchema,
	extendSchemaImpl = extendSchemaImpl
}