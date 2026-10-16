local Parent = script.Parent.Parent
local LuauPolyfillModule = require(Parent.Parent.LuauPolyfill)
local Array = LuauPolyfillModule.Array
local Error1 = LuauPolyfillModule.Error
local Map = LuauPolyfillModule.Map
local Object = LuauPolyfillModule.Object
local CoerceToMapFunction = LuauPolyfillModule.coerceToMap
local MapValueOrderedFunction = require(Parent.luaUtils.mapValueOrdered).mapValueOrdered
local _ = require(Parent.luaUtils.null)
local Jsutils = Parent.jsutils
local KeyMapFunction = require(Jsutils.keyMap).keyMap
local InspectFunction = require(Jsutils.inspect).inspect
local DevAssertFunction = require(Jsutils.devAssert).devAssert
local _ = require(Jsutils.ObjMap)
local _ = require(Parent.language.ast)
local Kind = require(Parent.language.kinds).Kind
local PredicatesModule = require(Parent.language.predicates)
local IsTypeDefinitionNodeFunction = PredicatesModule.isTypeDefinitionNode
local IsTypeExtensionNodeFunction = PredicatesModule.isTypeExtensionNode
local AssertValidSDLExtensionFunction = require(Parent.validation.validate).assertValidSDLExtension
local GetDirectiveValuesFunction = require(Parent.execution.values).getDirectiveValues
local Type = Parent.type
local SchemaModule = require(Type.schema)
local AssertSchemaFunction = SchemaModule.assertSchema
local GraphQLSchema = SchemaModule.GraphQLSchema
local ScalarsModule = require(Type.scalars)
local SpecifiedScalarTypes = ScalarsModule.specifiedScalarTypes
local IsSpecifiedScalarTypeFunction = ScalarsModule.isSpecifiedScalarType
local IntrospectionModule = require(Type.introspection)
local IntrospectionTypes = IntrospectionModule.introspectionTypes
local IsIntrospectionTypeFunction = IntrospectionModule.isIntrospectionType
local DirectivesModule = require(Type.directives)
local GraphQLDirective = DirectivesModule.GraphQLDirective
local GraphQLDeprecatedDirective = DirectivesModule.GraphQLDeprecatedDirective
local GraphQLSpecifiedByDirective = DirectivesModule.GraphQLSpecifiedByDirective
local DefinitionModule = require(Type.definition)
local IsScalarTypeFunction = DefinitionModule.isScalarType
local IsObjectTypeFunction = DefinitionModule.isObjectType
local IsInterfaceTypeFunction = DefinitionModule.isInterfaceType
local IsUnionTypeFunction = DefinitionModule.isUnionType
local IsListTypeFunction = DefinitionModule.isListType
local IsNonNullTypeFunction = DefinitionModule.isNonNullType
local IsEnumTypeFunction = DefinitionModule.isEnumType
local IsInputObjectTypeFunction = DefinitionModule.isInputObjectType
local GraphQLList = DefinitionModule.GraphQLList
local GraphQLNonNull = DefinitionModule.GraphQLNonNull
local GraphQLScalarType = DefinitionModule.GraphQLScalarType
local GraphQLObjectType = DefinitionModule.GraphQLObjectType
local GraphQLInterfaceType = DefinitionModule.GraphQLInterfaceType
local GraphQLUnionType = DefinitionModule.GraphQLUnionType
local GraphQLEnumType = DefinitionModule.GraphQLEnumType
local GraphQLInputObjectType = DefinitionModule.GraphQLInputObjectType
local ValueFromASTFunction = require(script.Parent.valueFromAST).valueFromAST
local v1 = nil
local Callback1 = nil
local Callback = nil

local function extendSchema(p1, p2, p3) --[[ Line: 152 ]]
	-- upvalues: AssertSchemaFunction (copy), DevAssertFunction (copy), Kind (copy), AssertValidSDLExtensionFunction (copy), GraphQLSchema (copy)
	AssertSchemaFunction(p1)
	DevAssertFunction(p2 ~= nil and p2.kind == Kind.DOCUMENT, "Must provide valid Document AST.")
	
	if (p3 and p3.assumeValid) ~= true and (p3 and p3.assumeValidSDL) ~= true then
		AssertValidSDLExtensionFunction(p2, p1)
	end
	local Config = p1:toConfig()
	local ExtendSchemaImplResult = extendSchemaImpl(Config, p2, p3)
	
	return if Config == ExtendSchemaImplResult then p1 else GraphQLSchema.new(ExtendSchemaImplResult)
end

function extendSchemaImpl(p1, p2, p3) --[[ Line: 175 ]]
	-- upvalues: Map (copy), Kind (copy), IsTypeDefinitionNodeFunction (copy), IsTypeExtensionNodeFunction (copy), Array (copy), IsListTypeFunction (copy), GraphQLList (copy), IsNonNullTypeFunction (copy), GraphQLNonNull (copy), GraphQLDirective (copy), Object (copy), MapValueOrderedFunction (copy), CoerceToMapFunction (copy), IsIntrospectionTypeFunction (copy), IsSpecifiedScalarTypeFunction (copy), IsScalarTypeFunction (copy), IsObjectTypeFunction (copy), IsInterfaceTypeFunction (copy), IsUnionTypeFunction (copy), IsEnumTypeFunction (copy), IsInputObjectTypeFunction (copy), InspectFunction (copy), GraphQLInputObjectType (copy), GraphQLEnumType (copy), Callback (ref), GraphQLScalarType (copy), GraphQLObjectType (copy), GraphQLInterfaceType (copy), GraphQLUnionType (copy), v1 (ref), Error1 (copy), Callback1 (ref), ValueFromASTFunction (copy)
	local List = {}
	local NewMap = Map.new()
	local List1 = {}
	local v2 = nil
	local List2 = {}
	
	for _, definition in ipairs(p2.definitions) do
		if definition.kind == Kind.SCHEMA_DEFINITION then
			v2 = definition
		elseif definition.kind == Kind.SCHEMA_EXTENSION then
			table.insert(List2, definition)
		elseif IsTypeDefinitionNodeFunction(definition) then
			table.insert(List, definition)
		elseif IsTypeExtensionNodeFunction(definition) then
			local Value = definition.name.value
			local GetResult = NewMap:get(Value)
			NewMap:set(Value, if GetResult then Array.concat(GetResult, { definition }) else { definition })
		elseif definition.kind == Kind.DIRECTIVE_DEFINITION then
			table.insert(List1, definition)
		end
	end
	if #NewMap:keys() == 0 and #List == 0 and #List1 == 0 and #List2 == 0 and v2 == nil then
		return p1
	end
	local NewMap1 = Map.new()
	local Callback5 = nil
	local ExtendArg = nil
	local ExtendField = nil
	local Callback6 = nil
	local Callback4 = nil
	local Callback7 = nil
	local Callback2 = nil
	local Callback8 = nil
	local Callback9 = nil
	local Callback10 = nil
	local Callback11 = nil
	local Callback3 = nil
	local Callback13 = nil
	local Callback14 = nil
	local Callback15 = nil
	local Callback12 = nil
	
	local function replaceType(Type) --[[ Line: 279 ]]
		-- upvalues: IsListTypeFunction (upval), GraphQLList (upval), replaceType (copy), IsNonNullTypeFunction (upval), GraphQLNonNull (upval), Callback5 (ref)
		return if IsListTypeFunction(Type) then GraphQLList.new(replaceType(Type.ofType)) elseif IsNonNullTypeFunction(Type) then GraphQLNonNull.new(replaceType(Type.ofType)) else Callback5(Type)
	end
	
	Callback5 = function(Mutation) --[[ Line: 291 | Named "replaceNamedType" ]]
		-- upvalues: NewMap1 (copy)
		return NewMap1:get(Mutation.name)
	end
	
	local function replaceDirective(p4) --[[ Line: 299 ]]
		-- upvalues: GraphQLDirective (upval), Object (upval), MapValueOrderedFunction (upval), CoerceToMapFunction (upval), ExtendArg (ref)
		local Config = p4:toConfig()
		
		return GraphQLDirective.new(Object.assign({}, Config, {
			args = MapValueOrderedFunction(CoerceToMapFunction(Config.args), ExtendArg)
		}))
	end
	
	local function extendNamedType(p4) --[[ Line: 310 ]]
		-- upvalues: IsIntrospectionTypeFunction (upval), IsSpecifiedScalarTypeFunction (upval), IsScalarTypeFunction (upval), Callback6 (ref), IsObjectTypeFunction (upval), Callback4 (ref), IsInterfaceTypeFunction (upval), Callback7 (ref), IsUnionTypeFunction (upval), Callback2 (ref), IsEnumTypeFunction (upval), Callback8 (ref), IsInputObjectTypeFunction (upval), Callback9 (ref), InspectFunction (upval)
		if IsIntrospectionTypeFunction(p4) or IsSpecifiedScalarTypeFunction(p4) then
			return p4
		elseif IsScalarTypeFunction(p4) then
			return Callback6(p4)
		elseif IsObjectTypeFunction(p4) then
			return Callback4(p4)
		elseif IsInterfaceTypeFunction(p4) then
			return Callback7(p4)
		elseif IsUnionTypeFunction(p4) then
			return Callback2(p4)
		elseif IsEnumTypeFunction(p4) then
			return Callback8(p4)
		elseif IsInputObjectTypeFunction(p4) then
			return Callback9(p4)
		else
			assert(false, "Unexpected type: " .. InspectFunction(p4))
		end
	end
	
	Callback9 = function(p4) --[[ Line: 341 | Named "extendInputObjectType" ]]
		-- upvalues: NewMap (copy), GraphQLInputObjectType (upval), Object (upval), Map (upval), Array (upval), MapValueOrderedFunction (upval), CoerceToMapFunction (upval), replaceType (copy), Callback10 (ref)
		local Config = p4:toConfig()
		local New = NewMap[Config.name] or {}
		
		return GraphQLInputObjectType.new(Object.assign({}, Config, {
			fields = function() --[[ Line: 347 ]]
				-- upvalues: Map (upval), Array (upval), MapValueOrderedFunction (upval), CoerceToMapFunction (upval), Config (copy), Object (upval), replaceType (upval), Callback10 (upval), New (copy)
				return Map.new(Array.concat(MapValueOrderedFunction(CoerceToMapFunction(Config.fields), function(p5) --[[ Line: 349 ]]
					-- upvalues: Object (upval), replaceType (upval)
					return Object.assign({}, p5, { type = replaceType(p5.type) })
				end):entries(), Callback10(New):entries()))
			end,
			extensionASTNodes = Array.concat(Config.extensionASTNodes, New)
		}))
	end
	
	Callback8 = function(p4) --[[ Line: 360 | Named "extendEnumType" ]]
		-- upvalues: NewMap (copy), GraphQLEnumType (upval), Object (upval), Map (upval), Array (upval), Callback11 (ref)
		local Config = p4:toConfig()
		local GetResult = NewMap:get(p4.name) or {}
		
		return GraphQLEnumType.new(Object.assign({}, Config, {
			values = Map.new(Array.concat(Config.values:entries(), Callback11(GetResult):entries())),
			extensionASTNodes = Array.concat(Config.extensionASTNodes, GetResult)
		}))
	end
	
	Callback6 = function(p4) --[[ Line: 378 | Named "extendScalarType" ]]
		-- upvalues: NewMap (copy), Callback (upval), GraphQLScalarType (upval), Object (upval), Array (upval)
		local Config = p4:toConfig()
		local GetResult = NewMap:get(Config.name) or {}
		local SpecifiedByUrl = Config.specifiedByUrl
		
		for _, value in ipairs(GetResult) do
			SpecifiedByUrl = Callback(value) or SpecifiedByUrl
		end
		return GraphQLScalarType.new(Object.assign({}, Config, {
			specifiedByUrl = SpecifiedByUrl,
			extensionASTNodes = Array.concat(Config.extensionASTNodes, GetResult)
		}))
	end
	
	Callback4 = function(p5) --[[ Line: 394 | Named "extendObjectType" ]]
		-- upvalues: NewMap (copy), GraphQLObjectType (upval), Object (upval), Array (upval), Callback5 (ref), Callback3 (ref), Map (upval), MapValueOrderedFunction (upval), CoerceToMapFunction (upval), ExtendField (ref), Callback12 (ref)
		local Config = p5:toConfig()
		local GetResult = NewMap:get(Config.name) or {}
		
		return GraphQLObjectType.new(Object.assign({}, Config, {
			interfaces = function() --[[ Line: 400 ]]
				-- upvalues: Array (upval), p5 (copy), Callback5 (upval), Callback3 (upval), GetResult (copy)
				return Array.concat(Array.map(p5:getInterfaces(), Callback5), Callback3(GetResult))
			end,
			fields = function() --[[ Line: 407 ]]
				-- upvalues: Map (upval), Array (upval), MapValueOrderedFunction (upval), CoerceToMapFunction (upval), Config (copy), ExtendField (upval), Callback12 (upval), GetResult (copy)
				return Map.new(Array.concat(MapValueOrderedFunction(CoerceToMapFunction(Config.fields), ExtendField):entries(), Callback12(GetResult):entries()))
			end,
			extensionASTNodes = Array.concat(Config.extensionASTNodes, GetResult)
		}))
	end
	
	Callback7 = function(p5) --[[ Line: 419 | Named "extendInterfaceType" ]]
		-- upvalues: NewMap (copy), GraphQLInterfaceType (upval), Object (upval), Array (upval), Callback5 (ref), Callback3 (ref), Map (upval), MapValueOrderedFunction (upval), CoerceToMapFunction (upval), ExtendField (ref), Callback12 (ref)
		local Config = p5:toConfig()
		local GetResult = NewMap:get(Config.name) or {}
		
		return GraphQLInterfaceType.new(Object.assign({}, Config, {
			interfaces = function() --[[ Line: 425 ]]
				-- upvalues: Array (upval), p5 (copy), Callback5 (upval), Callback3 (upval), GetResult (copy)
				return Array.concat(Array.map(p5:getInterfaces(), Callback5), Callback3(GetResult))
			end,
			fields = function() --[[ Line: 432 ]]
				-- upvalues: Map (upval), Array (upval), MapValueOrderedFunction (upval), CoerceToMapFunction (upval), Config (copy), ExtendField (upval), Callback12 (upval), GetResult (copy)
				return Map.new(Array.concat(MapValueOrderedFunction(CoerceToMapFunction(Config.fields), ExtendField):entries(), Callback12(GetResult):entries()))
			end,
			extensionASTNodes = Array.concat(Config.extensionASTNodes, GetResult)
		}))
	end
	
	Callback2 = function(p5) --[[ Line: 444 | Named "extendUnionType" ]]
		-- upvalues: NewMap (copy), GraphQLUnionType (upval), Object (upval), Array (upval), Callback5 (ref), Callback13 (ref)
		local Config = p5:toConfig()
		local GetResult = NewMap:get(Config.name) or {}
		
		return GraphQLUnionType.new(Object.assign({}, Config, {
			types = function() --[[ Line: 450 ]]
				-- upvalues: Array (upval), p5 (copy), Callback5 (upval), Callback13 (upval), GetResult (copy)
				return Array.concat(Array.map(p5:getTypes(), Callback5), Callback13(GetResult))
			end,
			extensionASTNodes = Array.concat(Config.extensionASTNodes, GetResult)
		}))
	end
	
	ExtendField = function(p5) --[[ Line: 461 | Named "extendField" ]]
		-- upvalues: Object (upval), replaceType (copy), MapValueOrderedFunction (upval), ExtendArg (ref)
		return Object.assign({}, p5, {
			type = replaceType(p5.type),
			args = if p5.args then MapValueOrderedFunction(p5.args, ExtendArg) else nil
		})
	end
	
	ExtendArg = function(p5) --[[ Line: 469 | Named "extendArg" ]]
		-- upvalues: Object (upval), replaceType (copy)
		return Object.assign({}, p5, { type = replaceType(p5.type) })
	end
	
	local function getOperationTypes(List) --[[ Line: 473 ]]
		-- upvalues: Callback14 (ref)
		local t = {}
		
		for _, value in ipairs(List) do
			local OperationTypes = value.operationTypes or {}
			for _, operationType in ipairs(OperationTypes) do
				t[operationType.operation] = Callback14(operationType.type)
			end
		end
		return t
	end
	
	Callback14 = function(Type) --[[ Line: 496 | Named "getNamedType" ]]
		-- upvalues: v1 (upval), NewMap1 (copy), Error1 (upval)
		local Value = Type.name.value
		local v3 = v1[Value] or NewMap1[Value]
		
		if v3 == nil then
			error(Error1.new(("Unknown type: \"%s\"."):format(Value)))
		end
		return v3
	end
	
	local function getWrappedType(Type) --[[ Line: 508 ]]
		-- upvalues: Kind (upval), GraphQLList (upval), getWrappedType (copy), GraphQLNonNull (upval), Callback14 (ref)
		return if Type.kind == Kind.LIST_TYPE then GraphQLList.new(getWrappedType(Type.type)) elseif Type.kind == Kind.NON_NULL_TYPE then GraphQLNonNull.new(getWrappedType(Type.type)) else Callback14(Type)
	end
	
	local function buildDirective(AstNode) --[[ Line: 519 ]]
		-- upvalues: Array (upval), GraphQLDirective (upval), Callback15 (ref)
		return GraphQLDirective.new({
			name = AstNode.name.value,
			description = if AstNode.description then AstNode.description.value else nil,
			locations = Array.map(AstNode.locations, function(p5) --[[ Line: 520 ]]
				return p5.value
			end),
			isRepeatable = AstNode.repeatable,
			args = Callback15(AstNode.arguments),
			astNode = AstNode
		})
	end
	
	Callback12 = function(ConcatResult) --[[ Line: 537 | Named "buildFieldMap" ]]
		-- upvalues: Map (upval), getWrappedType (copy), Callback15 (ref), Callback1 (upval)
		local NewMap = Map.new()
		
		for _, value in ipairs(ConcatResult) do
			local Fields = if value.fields then value.fields else {}
			for _, field in ipairs(Fields) do
				NewMap:set(field.name.value, {
					type = getWrappedType(field.type),
					description = if field.description then field.description.value else nil,
					args = Callback15(field.arguments),
					deprecationReason = Callback1(field),
					astNode = field
				})
			end
		end
		return NewMap
	end
	
	Callback15 = function(Arguments) --[[ Line: 565 | Named "buildArgumentMap" ]]
		-- upvalues: Map (upval), getWrappedType (copy), ValueFromASTFunction (upval), Callback1 (upval)
		local NewMap = Map.new()
		
		for _, AstNode in ipairs(if Arguments then Arguments else {}) do
			local WrappedType = getWrappedType(AstNode.type)
			NewMap:set(AstNode.name.value, {
				type = WrappedType,
				description = if AstNode.description then AstNode.description.value else nil,
				defaultValue = ValueFromASTFunction(AstNode.defaultValue, WrappedType),
				deprecationReason = Callback1(AstNode),
				astNode = AstNode
			})
		end
		return NewMap
	end
	
	Callback10 = function(ConcatResult) --[[ Line: 589 | Named "buildInputFieldMap" ]]
		-- upvalues: Map (upval), getWrappedType (copy), ValueFromASTFunction (upval), Callback1 (upval)
		local NewMap = Map.new()
		
		for _, value in ipairs(ConcatResult) do
			local Fields = if value.fields then value.fields else {}
			for _, field in ipairs(Fields) do
				local WrappedType = getWrappedType(field.type)
				NewMap:set(field.name.value, {
					type = WrappedType,
					description = if field.description then field.description.value else nil,
					defaultValue = ValueFromASTFunction(field.defaultValue, WrappedType),
					deprecationReason = Callback1(field),
					astNode = field
				})
			end
		end
		return NewMap
	end
	
	Callback11 = function(ConcatResult) --[[ Line: 621 | Named "buildEnumValueMap" ]]
		-- upvalues: Map (upval), Callback1 (upval)
		local NewMap = Map.new()
		
		for _, value in ipairs(ConcatResult) do
			local Values = if value.values then value.values else {}
			for _, value1 in ipairs(Values) do
				NewMap:set(value1.name.value, {
					description = if value1.description then value1.description.value else nil,
					deprecationReason = Callback1(value1),
					astNode = value1
				})
			end
		end
		return NewMap
	end
	
	Callback3 = function(ConcatResult) --[[ Line: 644 | Named "buildInterfaces" ]]
		-- upvalues: Callback14 (ref)
		local List = {}
		
		for _, value in ipairs(ConcatResult) do
			if value.interfaces then
				for _, interface in ipairs(value.interfaces) do
					table.insert(List, (Callback14(interface)))
				end
			end
		end
		return List
	end
	
	Callback13 = function(ConcatResult) --[[ Line: 670 | Named "buildUnionTypes" ]]
		-- upvalues: Callback14 (ref)
		local List = {}
		
		for _, value in ipairs(ConcatResult) do
			if value.types then
				for _, _type in ipairs(value.types) do
					table.insert(List, (Callback14(_type)))
				end
			end
		end
		return List
	end
	
	local function buildType(AstNode) --[[ Line: 691 ]]
		-- upvalues: NewMap (copy), Kind (upval), Array (upval), GraphQLObjectType (upval), Callback3 (ref), Callback12 (ref), GraphQLInterfaceType (upval), GraphQLEnumType (upval), Callback11 (ref), GraphQLUnionType (upval), Callback13 (ref), GraphQLScalarType (upval), Callback (upval), GraphQLInputObjectType (upval), Callback10 (ref), InspectFunction (upval)
		local Value = AstNode.name.value
		local New = NewMap[Value] or {}
		local Kind1 = AstNode.kind
		
		if Kind1 == Kind.OBJECT_TYPE_DEFINITION then
			local ConcatResult = Array.concat(AstNode, New)
			
			return GraphQLObjectType.new({
				name = Value,
				description = if AstNode.description then AstNode.description.value else nil,
				interfaces = function() --[[ Line: 704 ]]
					-- upvalues: Callback3 (upval), ConcatResult (copy)
					return Callback3(ConcatResult)
				end,
				fields = function() --[[ Line: 707 ]]
					-- upvalues: Callback12 (upval), ConcatResult (copy)
					return Callback12(ConcatResult)
				end,
				astNode = AstNode,
				extensionASTNodes = New
			})
		elseif Kind1 == Kind.INTERFACE_TYPE_DEFINITION then
			local ConcatResult1 = Array.concat(AstNode, New)
			
			return GraphQLInterfaceType.new({
				name = Value,
				description = if AstNode.description then AstNode.description.value else nil,
				interfaces = function() --[[ Line: 724 ]]
					-- upvalues: Callback3 (upval), ConcatResult1 (copy)
					return Callback3(ConcatResult1)
				end,
				fields = function() --[[ Line: 727 ]]
					-- upvalues: Callback12 (upval), ConcatResult1 (copy)
					return Callback12(ConcatResult1)
				end,
				astNode = AstNode,
				extensionASTNodes = New
			})
		elseif Kind1 == Kind.ENUM_TYPE_DEFINITION then
			return GraphQLEnumType.new({
				name = Value,
				description = if AstNode.description then AstNode.description.value else nil,
				values = Callback11((Array.concat(AstNode, New))),
				astNode = AstNode,
				extensionASTNodes = New
			})
		elseif Kind1 == Kind.UNION_TYPE_DEFINITION then
			local ConcatResult2 = Array.concat(AstNode, New)
			
			return GraphQLUnionType.new({
				name = Value,
				description = if AstNode.description then AstNode.description.value else nil,
				types = function() --[[ Line: 750 ]]
					-- upvalues: Callback13 (upval), ConcatResult2 (copy)
					return Callback13(ConcatResult2)
				end,
				astNode = AstNode,
				extensionASTNodes = New
			})
		elseif Kind1 == Kind.SCALAR_TYPE_DEFINITION then
			return GraphQLScalarType.new({
				name = Value,
				description = if AstNode.description then AstNode.description.value else nil,
				specifiedByUrl = Callback(AstNode),
				astNode = AstNode,
				extensionASTNodes = New
			})
		elseif Kind1 ~= Kind.INPUT_OBJECT_TYPE_DEFINITION then
			assert(false, "Unexpected type definition node: " .. InspectFunction(AstNode))
			
			return
		else
			local ConcatResult3 = Array.concat(AstNode, New)
			
			return GraphQLInputObjectType.new({
				name = Value,
				description = if AstNode.description then AstNode.description.value else nil,
				fields = function() --[[ Line: 773 ]]
					-- upvalues: Callback10 (upval), ConcatResult3 (copy)
					return Callback10(ConcatResult3)
				end,
				astNode = AstNode,
				extensionASTNodes = New
			})
		end
	end
	
	for _, _type in ipairs(p1.types) do
		NewMap1:set(_type.name, extendNamedType(_type))
	end
	for _, value in ipairs(List) do
		local Value = value.name.value
		NewMap1:set(Value, v1[Value] or buildType(value))
	end
	local AssignResult = Object.assign({}, {
		description = if v2 == nil or v2.description == nil then nil else v2.description.value
	}, Object.assign({}, {
		query = p1.query and Callback5(p1.query),
		mutation = p1.mutation and Callback5(p1.mutation),
		subscription = p1.subscription and Callback5(p1.subscription)
	}, v2 and getOperationTypes({ v2 }) or {}, (getOperationTypes(List2))), {
		types = NewMap1:values(),
		directives = Array.concat(Array.map(p1.directives, replaceDirective), Array.map(List1, buildDirective)),
		astNode = v2 or p1.astNode,
		extensionASTNodes = Array.concat(p1.extensionASTNodes, List2),
		assumeValid = p3 ~= nil and p3.assumeValid ~= nil and p3.assumeValid
	})
	AssignResult.extensions = nil
	
	return AssignResult
end

v1 = KeyMapFunction(Array.concat(SpecifiedScalarTypes, IntrospectionTypes), function(p5) --[[ Line: 846 ]]
	return p5.name
end)

Callback1 = function(AstNode) --[[ Line: 854 | Named "getDeprecationReason" ]]
	-- upvalues: GetDirectiveValuesFunction (copy), GraphQLDeprecatedDirective (copy)
	local DirectiveValues = GetDirectiveValuesFunction(GraphQLDeprecatedDirective, AstNode)
	
	return DirectiveValues and DirectiveValues.reason
end

Callback = function(AstNode) --[[ Line: 864 | Named "getSpecifiedByUrl" ]]
	-- upvalues: GetDirectiveValuesFunction (copy), GraphQLSpecifiedByDirective (copy)
	local DirectiveValues = GetDirectiveValuesFunction(GraphQLSpecifiedByDirective, AstNode)
	
	return DirectiveValues and DirectiveValues.url
end

return {
	extendSchema = extendSchema,
	extendSchemaImpl = extendSchemaImpl
}