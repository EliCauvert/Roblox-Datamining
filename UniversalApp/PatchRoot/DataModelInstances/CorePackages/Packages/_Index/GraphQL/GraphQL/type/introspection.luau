local Parent = script.Parent.Parent
local Jsutils = Parent.jsutils
local Language = Parent.language
local LuauPolyfillModule = require(Parent.Parent.LuauPolyfill)
local Array = LuauPolyfillModule.Array
local Map = LuauPolyfillModule.Map
local Object = LuauPolyfillModule.Object
local IsNotNillishFunction = require(Parent.luaUtils.isNillish).isNotNillish
local InspectFunction = require(Jsutils.inspect).inspect
local InvariantFunction = require(Jsutils.invariant).invariant
local PrintFunction = require(Language.printer).print
local DirectiveLocation = require(Language.directiveLocation).DirectiveLocation
local AstFromValueFunction = require(Parent.utilities.astFromValue).astFromValue
local _ = require(Parent.language.ast)
local ScalarsModule = require(script.Parent.scalars)
local GraphQLString = ScalarsModule.GraphQLString
local GraphQLBoolean = ScalarsModule.GraphQLBoolean
local DefinitionModule = require(script.Parent.definition)
local GraphQLList = DefinitionModule.GraphQLList
local GraphQLNonNull = DefinitionModule.GraphQLNonNull
local GraphQLObjectType = DefinitionModule.GraphQLObjectType
local GraphQLEnumType = DefinitionModule.GraphQLEnumType
local IsScalarTypeFunction = DefinitionModule.isScalarType
local IsObjectTypeFunction = DefinitionModule.isObjectType
local IsInterfaceTypeFunction = DefinitionModule.isInterfaceType
local IsUnionTypeFunction = DefinitionModule.isUnionType
local IsEnumTypeFunction = DefinitionModule.isEnumType
local IsInputObjectTypeFunction = DefinitionModule.isInputObjectType
local IsListTypeFunction = DefinitionModule.isListType
local IsNonNullTypeFunction = DefinitionModule.isNonNullType
local IsAbstractTypeFunction = DefinitionModule.isAbstractType
local FreezeResult = nil
local TypeKind = nil
local Directive = nil
local DirectiveLocation1 = nil
local Type = nil
local Field = nil
local InputValue = nil
local EnumValue = nil
local Schema = GraphQLObjectType.new({
	name = "__Schema",
	description = "A GraphQL Schema defines the capabilities of a GraphQL server. It exposes all available types and directives on the server, as well as the entry points for query, mutation, and subscription operations.",
	fields = function() --[[ Line: 74 ]]
		-- upvalues: Map (copy), GraphQLString (copy), GraphQLNonNull (copy), GraphQLList (copy), Type (ref), Directive (ref)
		return Map.new({
			{
				"description",
				{
					type = GraphQLString,
					resolve = function(p1) --[[ Line: 80 ]]
						return p1.description
					end
				}
			},
			{
				"types",
				{
					description = "A list of all types supported by this server.",
					type = GraphQLNonNull.new(GraphQLList.new(GraphQLNonNull.new(Type))),
					resolve = function(p1) --[[ Line: 90 ]]
						return p1:getTypeMap():values()
					end
				}
			},
			{
				"queryType",
				{
					description = "The type that query operations will be rooted at.",
					type = GraphQLNonNull.new(Type),
					resolve = function(p1) --[[ Line: 101 ]]
						return p1:getQueryType()
					end
				}
			},
			{
				"mutationType",
				{
					description = "If this server supports mutation, the type that mutation operations will be rooted at.",
					type = Type,
					resolve = function(p1) --[[ Line: 111 ]]
						return p1:getMutationType()
					end
				}
			},
			{
				"subscriptionType",
				{
					description = "If this server support subscription, the type that subscription operations will be rooted at.",
					type = Type,
					resolve = function(p1) --[[ Line: 121 ]]
						return p1:getSubscriptionType()
					end
				}
			},
			{
				"directives",
				{
					description = "A list of all directives supported by this server.",
					type = GraphQLNonNull.new(GraphQLList.new(GraphQLNonNull.new(Directive))),
					resolve = function(p1) --[[ Line: 131 ]]
						return p1:getDirectives()
					end
				}
			}
		})
	end
})
Directive = GraphQLObjectType.new({
	name = "__Directive",
	description = "A Directive provides a way to describe alternate runtime execution and type validation behavior in a GraphQL document.\n\nIn some cases, you need to provide options to alter GraphQL's execution behavior in ways field arguments will not suffice, such as conditionally including or skipping a field. Directives provide this by describing additional information to the executor.",
	fields = function() --[[ Line: 143 ]]
		-- upvalues: Map (copy), GraphQLNonNull (copy), GraphQLString (copy), GraphQLBoolean (copy), GraphQLList (copy), DirectiveLocation1 (ref), InputValue (ref)
		return Map.new({
			{
				"name",
				{
					type = GraphQLNonNull.new(GraphQLString),
					resolve = function(p1) --[[ Line: 149 ]]
						return p1.name
					end
				}
			},
			{
				"description",
				{
					type = GraphQLString,
					resolve = function(p1) --[[ Line: 158 ]]
						return p1.description
					end
				}
			},
			{
				"isRepeatable",
				{
					type = GraphQLNonNull.new(GraphQLBoolean),
					resolve = function(p1) --[[ Line: 167 ]]
						return p1.isRepeatable
					end
				}
			},
			{
				"locations",
				{
					type = GraphQLNonNull.new(GraphQLList.new(GraphQLNonNull.new(DirectiveLocation1))),
					resolve = function(p1) --[[ Line: 178 ]]
						return p1.locations
					end
				}
			},
			{
				"args",
				{
					type = GraphQLNonNull.new(GraphQLList.new(GraphQLNonNull.new(InputValue))),
					resolve = function(p1) --[[ Line: 187 ]]
						return p1.args
					end
				}
			}
		})
	end
})
DirectiveLocation1 = GraphQLEnumType.new({
	name = "__DirectiveLocation",
	description = "A Directive can be adjacent to many parts of the GraphQL language, a __DirectiveLocation describes one such possible adjacencies.",
	values = Map.new({
		{
			"QUERY",
			{
				description = "Location adjacent to a query operation.",
				value = DirectiveLocation.QUERY
			}
		},
		{
			"MUTATION",
			{
				description = "Location adjacent to a mutation operation.",
				value = DirectiveLocation.MUTATION
			}
		},
		{
			"SUBSCRIPTION",
			{
				description = "Location adjacent to a subscription operation.",
				value = DirectiveLocation.SUBSCRIPTION
			}
		},
		{
			"FIELD",
			{
				description = "Location adjacent to a field.",
				value = DirectiveLocation.FIELD
			}
		},
		{
			"FRAGMENT_DEFINITION",
			{
				description = "Location adjacent to a fragment definition.",
				value = DirectiveLocation.FRAGMENT_DEFINITION
			}
		},
		{
			"FRAGMENT_SPREAD",
			{
				description = "Location adjacent to a fragment spread.",
				value = DirectiveLocation.FRAGMENT_SPREAD
			}
		},
		{
			"INLINE_FRAGMENT",
			{
				description = "Location adjacent to an inline fragment.",
				value = DirectiveLocation.INLINE_FRAGMENT
			}
		},
		{
			"VARIABLE_DEFINITION",
			{
				description = "Location adjacent to a variable definition.",
				value = DirectiveLocation.VARIABLE_DEFINITION
			}
		},
		{
			"SCHEMA",
			{
				description = "Location adjacent to a schema definition.",
				value = DirectiveLocation.SCHEMA
			}
		},
		{
			"SCALAR",
			{
				description = "Location adjacent to a scalar definition.",
				value = DirectiveLocation.SCALAR
			}
		},
		{
			"OBJECT",
			{
				description = "Location adjacent to an object type definition.",
				value = DirectiveLocation.OBJECT
			}
		},
		{
			"FIELD_DEFINITION",
			{
				description = "Location adjacent to a field definition.",
				value = DirectiveLocation.FIELD_DEFINITION
			}
		},
		{
			"ARGUMENT_DEFINITION",
			{
				description = "Location adjacent to an argument definition.",
				value = DirectiveLocation.ARGUMENT_DEFINITION
			}
		},
		{
			"INTERFACE",
			{
				description = "Location adjacent to an interface definition.",
				value = DirectiveLocation.INTERFACE
			}
		},
		{
			"UNION",
			{
				description = "Location adjacent to a union definition.",
				value = DirectiveLocation.UNION
			}
		},
		{
			"ENUM",
			{
				description = "Location adjacent to an enum definition.",
				value = DirectiveLocation.ENUM
			}
		},
		{
			"ENUM_VALUE",
			{
				description = "Location adjacent to an enum value definition.",
				value = DirectiveLocation.ENUM_VALUE
			}
		},
		{
			"INPUT_OBJECT",
			{
				description = "Location adjacent to an input object type definition.",
				value = DirectiveLocation.INPUT_OBJECT
			}
		},
		{
			"INPUT_FIELD_DEFINITION",
			{
				description = "Location adjacent to an input object field definition.",
				value = DirectiveLocation.INPUT_FIELD_DEFINITION
			}
		}
	})
})
Type = GraphQLObjectType.new({
	name = "__Type",
	description = "The fundamental unit of any GraphQL Schema is the type. There are many kinds of types in GraphQL as represented by the `__TypeKind` enum.\n\nDepending on the kind of a type, certain fields describe information about that type. Scalar types provide no information beyond a name, description and optional `specifiedByUrl`, while Enum types provide their values. Object and Interface types provide the fields they describe. Abstract types, Union and Interface, provide the Object types possible at runtime. List and NonNull types compose other types.",
	fields = function() --[[ Line: 339 ]]
		-- upvalues: Map (copy), GraphQLNonNull (copy), TypeKind (ref), IsScalarTypeFunction (copy), FreezeResult (ref), IsObjectTypeFunction (copy), IsInterfaceTypeFunction (copy), IsUnionTypeFunction (copy), IsEnumTypeFunction (copy), IsInputObjectTypeFunction (copy), IsListTypeFunction (copy), IsNonNullTypeFunction (copy), InvariantFunction (copy), InspectFunction (copy), GraphQLString (copy), GraphQLList (copy), Field (ref), GraphQLBoolean (copy), Array (copy), Type (ref), IsAbstractTypeFunction (copy), EnumValue (ref), InputValue (ref)
		return Map.new({
			{
				"kind",
				{
					type = GraphQLNonNull.new(TypeKind),
					resolve = function(p1) --[[ Line: 345 ]]
						-- upvalues: IsScalarTypeFunction (upval), FreezeResult (upval), IsObjectTypeFunction (upval), IsInterfaceTypeFunction (upval), IsUnionTypeFunction (upval), IsEnumTypeFunction (upval), IsInputObjectTypeFunction (upval), IsListTypeFunction (upval), IsNonNullTypeFunction (upval), InvariantFunction (upval), InspectFunction (upval)
						if IsScalarTypeFunction(p1) then
							return FreezeResult.SCALAR
						elseif IsObjectTypeFunction(p1) then
							return FreezeResult.OBJECT
						elseif IsInterfaceTypeFunction(p1) then
							return FreezeResult.INTERFACE
						elseif IsUnionTypeFunction(p1) then
							return FreezeResult.UNION
						elseif IsEnumTypeFunction(p1) then
							return FreezeResult.ENUM
						elseif IsInputObjectTypeFunction(p1) then
							return FreezeResult.INPUT_OBJECT
						elseif IsListTypeFunction(p1) then
							return FreezeResult.LIST
						elseif IsNonNullTypeFunction(p1) then
							return FreezeResult.NON_NULL
						else
							InvariantFunction(false, ("Unexpected type: \"%s\"."):format(InspectFunction(p1)))
							assert(false)
						end
					end
				}
			},
			{
				"name",
				{
					type = GraphQLString,
					resolve = function(p1) --[[ Line: 382 ]]
						return if p1.name == nil then nil else p1.name
					end
				}
			},
			{
				"description",
				{
					type = GraphQLString,
					resolve = function(p1) --[[ Line: 391 ]]
						return if p1.description == nil then nil else p1.description
					end
				}
			},
			{
				"specifiedByUrl",
				{
					type = GraphQLString,
					resolve = function(p1) --[[ Line: 400 ]]
						return if p1.specifiedByUrl == nil then nil else p1.specifiedByUrl
					end
				}
			},
			{
				"fields",
				{
					type = GraphQLList.new(GraphQLNonNull.new(Field)),
					args = {
						includeDeprecated = { defaultValue = false, type = GraphQLBoolean }
					},
					resolve = function(p1, p2) --[[ Line: 415 ]]
						-- upvalues: IsObjectTypeFunction (upval), IsInterfaceTypeFunction (upval), Array (upval)
						local IncludeDeprecated = p2.includeDeprecated
						
						if not IsObjectTypeFunction(p1) and not IsInterfaceTypeFunction(p1) then return end
						local ValuesResult = p1:getFields():values()
						
						return IncludeDeprecated and ValuesResult or Array.filter(ValuesResult, function(p3): boolean --[[ Line: 421 ]]
							return p3.deprecationReason == nil
						end)
					end
				}
			},
			{
				"interfaces",
				{
					type = GraphQLList.new(GraphQLNonNull.new(Type)),
					resolve = function(p1) --[[ Line: 433 ]]
						-- upvalues: IsObjectTypeFunction (upval), IsInterfaceTypeFunction (upval)
						if not IsObjectTypeFunction(p1) and not IsInterfaceTypeFunction(p1) then return end
						return p1:getInterfaces()
					end
				}
			},
			{
				"possibleTypes",
				{
					type = GraphQLList.new(GraphQLNonNull.new(Type)),
					resolve = function(p1, _, _, p2) --[[ Line: 445 ]]
						-- upvalues: IsAbstractTypeFunction (upval)
						local Schema = p2.schema
						
						return if IsAbstractTypeFunction(p1) then Schema:getPossibleTypes(p1) else nil
					end
				}
			},
			{
				"enumValues",
				{
					type = GraphQLList.new(GraphQLNonNull.new(EnumValue)),
					args = {
						includeDeprecated = { defaultValue = false, type = GraphQLBoolean }
					},
					resolve = function(p1, p2) --[[ Line: 465 ]]
						-- upvalues: IsEnumTypeFunction (upval), Array (upval)
						local IncludeDeprecated = p2.includeDeprecated
						
						if not IsEnumTypeFunction(p1) then return end
						local Values = p1:getValues()
						
						return IncludeDeprecated and Values or Array.filter(Values, function(p3): boolean --[[ Line: 472 ]]
							return p3.deprecationReason == nil
						end)
					end
				}
			},
			{
				"inputFields",
				{
					type = GraphQLList.new(GraphQLNonNull.new(InputValue)),
					args = {
						includeDeprecated = { defaultValue = false, type = GraphQLBoolean }
					},
					resolve = function(p1, p2) --[[ Line: 490 ]]
						-- upvalues: IsInputObjectTypeFunction (upval), Array (upval)
						local IncludeDeprecated = p2.includeDeprecated
						
						if not IsInputObjectTypeFunction(p1) then return end
						local ValuesResult = p1:getFields():values()
						
						return IncludeDeprecated and ValuesResult or Array.filter(ValuesResult, function(p3): boolean --[[ Line: 498 ]]
							return p3.deprecationReason == nil
						end)
					end
				}
			},
			{
				"ofType",
				{
					type = Type,
					resolve = function(p1) --[[ Line: 510 ]]
						return if p1.ofType == nil then nil else p1.ofType
					end
				}
			}
		})
	end
})
Field = GraphQLObjectType.new({
	name = "__Field",
	description = "Object and Interface types are described by a list of Fields, each of which has a name, potentially a list of arguments, and a return type.",
	fields = function() --[[ Line: 522 ]]
		-- upvalues: Map (copy), GraphQLNonNull (copy), GraphQLString (copy), GraphQLList (copy), InputValue (ref), GraphQLBoolean (copy), Array (copy), Type (ref), IsNotNillishFunction (copy)
		return Map.new({
			{
				"name",
				{
					type = GraphQLNonNull.new(GraphQLString),
					resolve = function(p1) --[[ Line: 528 ]]
						return p1.name
					end
				}
			},
			{
				"description",
				{
					type = GraphQLString,
					resolve = function(p1) --[[ Line: 537 ]]
						return p1.description
					end
				}
			},
			{
				"args",
				{
					type = GraphQLNonNull.new(GraphQLList.new(GraphQLNonNull.new(InputValue))),
					args = {
						includeDeprecated = { defaultValue = false, type = GraphQLBoolean }
					},
					resolve = function(p1, p2) --[[ Line: 552 ]]
						-- upvalues: Array (upval)
						return if p2.includeDeprecated then p1.args else Array.filter(p1.args, function(p3): boolean --[[ Line: 557 ]]
							return p3.deprecationReason == nil
						end)
					end
				}
			},
			{
				"type",
				{
					type = GraphQLNonNull.new(Type),
					resolve = function(p1) --[[ Line: 567 ]]
						return p1.type
					end
				}
			},
			{
				"isDeprecated",
				{
					type = GraphQLNonNull.new(GraphQLBoolean),
					resolve = function(p1) --[[ Line: 576 ]]
						-- upvalues: IsNotNillishFunction (upval)
						return IsNotNillishFunction(p1.deprecationReason)
					end
				}
			},
			{
				"deprecationReason",
				{
					type = GraphQLString,
					resolve = function(p1) --[[ Line: 585 ]]
						return p1.deprecationReason
					end
				}
			}
		})
	end
})
InputValue = GraphQLObjectType.new({
	name = "__InputValue",
	description = "Arguments provided to Fields or Directives and the input fields of an InputObject are represented as Input Values which describe their type and optionally a default value.",
	fields = function() --[[ Line: 597 ]]
		-- upvalues: Map (copy), GraphQLNonNull (copy), GraphQLString (copy), Type (ref), AstFromValueFunction (copy), PrintFunction (copy), GraphQLBoolean (copy), IsNotNillishFunction (copy)
		return Map.new({
			{
				"name",
				{
					type = GraphQLNonNull.new(GraphQLString),
					resolve = function(p1) --[[ Line: 603 ]]
						return p1.name
					end
				}
			},
			{
				"description",
				{
					type = GraphQLString,
					resolve = function(p1) --[[ Line: 612 ]]
						return p1.description
					end
				}
			},
			{
				"type",
				{
					type = GraphQLNonNull.new(Type),
					resolve = function(p1) --[[ Line: 621 ]]
						return p1.type
					end
				}
			},
			{
				"defaultValue",
				{
					description = "A GraphQL-formatted string representing the default value for this input value.",
					type = GraphQLString,
					resolve = function(p1) --[[ Line: 631 ]]
						-- upvalues: AstFromValueFunction (upval), PrintFunction (upval)
						local AstFromValueResult = AstFromValueFunction(p1.defaultValue, p1.type)
						
						return if AstFromValueResult then PrintFunction(AstFromValueResult) else nil
					end
				}
			},
			{
				"isDeprecated",
				{
					type = GraphQLNonNull.new(GraphQLBoolean),
					resolve = function(p1) --[[ Line: 643 ]]
						-- upvalues: IsNotNillishFunction (upval)
						return IsNotNillishFunction(p1.deprecationReason)
					end
				}
			},
			{
				"deprecationReason",
				{
					type = GraphQLString,
					resolve = function(p1) --[[ Line: 652 ]]
						return p1.deprecationReason
					end
				}
			}
		})
	end
})
EnumValue = GraphQLObjectType.new({
	name = "__EnumValue",
	description = "One possible value for a given Enum. Enum values are unique values, not a placeholder for a string or numeric value. However an Enum value is returned in a JSON response as a string.",
	fields = function() --[[ Line: 664 ]]
		-- upvalues: Map (copy), GraphQLNonNull (copy), GraphQLString (copy), GraphQLBoolean (copy), IsNotNillishFunction (copy)
		return Map.new({
			{
				"name",
				{
					type = GraphQLNonNull.new(GraphQLString),
					resolve = function(p1) --[[ Line: 670 ]]
						return p1.name
					end
				}
			},
			{
				"description",
				{
					type = GraphQLString,
					resolve = function(p1) --[[ Line: 679 ]]
						return p1.description
					end
				}
			},
			{
				"isDeprecated",
				{
					type = GraphQLNonNull.new(GraphQLBoolean),
					resolve = function(p1) --[[ Line: 688 ]]
						-- upvalues: IsNotNillishFunction (upval)
						return IsNotNillishFunction(p1.deprecationReason)
					end
				}
			},
			{
				"deprecationReason",
				{
					type = GraphQLString,
					resolve = function(p1) --[[ Line: 697 ]]
						return p1.deprecationReason
					end
				}
			}
		})
	end
})
FreezeResult = Object.freeze({
	SCALAR = "SCALAR",
	OBJECT = "OBJECT",
	INTERFACE = "INTERFACE",
	UNION = "UNION",
	ENUM = "ENUM",
	INPUT_OBJECT = "INPUT_OBJECT",
	LIST = "LIST",
	NON_NULL = "NON_NULL"
})
TypeKind = GraphQLEnumType.new({
	name = "__TypeKind",
	description = "An enum describing what kind of type a given `__Type` is.",
	values = Map.new({
		{
			"SCALAR",
			{
				description = "Indicates this type is a scalar.",
				value = FreezeResult.SCALAR
			}
		},
		{
			"OBJECT",
			{
				description = "Indicates this type is an object. `fields` and `interfaces` are valid fields.",
				value = FreezeResult.OBJECT
			}
		},
		{
			"INTERFACE",
			{
				description = "Indicates this type is an interface. `fields`, `interfaces`, and `possibleTypes` are valid fields.",
				value = FreezeResult.INTERFACE
			}
		},
		{
			"UNION",
			{
				description = "Indicates this type is a union. `possibleTypes` is a valid field.",
				value = FreezeResult.UNION
			}
		},
		{
			"ENUM",
			{
				description = "Indicates this type is an enum. `enumValues` is a valid field.",
				value = FreezeResult.ENUM
			}
		},
		{
			"INPUT_OBJECT",
			{
				description = "Indicates this type is an input object. `inputFields` is a valid field.",
				value = FreezeResult.INPUT_OBJECT
			}
		},
		{
			"LIST",
			{
				description = "Indicates this type is a list. `ofType` is a valid field.",
				value = FreezeResult.LIST
			}
		},
		{
			"NON_NULL",
			{
				description = "Indicates this type is a non-null. `ofType` is a valid field.",
				value = FreezeResult.NON_NULL
			}
		}
	})
})
local FreezeResult1 = Object.freeze({
	Schema, Directive, DirectiveLocation1, Type, Field, InputValue, EnumValue,
	TypeKind
})

return {
	introspectionTypes = FreezeResult1,
	isIntrospectionType = function(p1) --[[ Line: 852 ]]
		-- upvalues: Array (copy), FreezeResult1 (copy)
		return Array.some(FreezeResult1, function(p2): boolean --[[ Line: 853 ]]
			-- upvalues: p1 (copy)
			return p1.name == p2.name
		end)
	end,
	TypeNameMetaFieldDef = {
		name = "__typename",
		description = "The name of the current Object type at runtime.",
		deprecationReason = nil,
		extensions = nil,
		astNode = nil,
		type = GraphQLNonNull.new(GraphQLString),
		args = {},
		resolve = function(_, _, _, p1) --[[ Line: 831 ]]
			return p1.parentType.name
		end
	},
	TypeMetaFieldDef = {
		name = "__type",
		description = "Request the type information of a single type.",
		deprecationReason = nil,
		extensions = nil,
		astNode = nil,
		type = Type,
		args = {
			{
				name = "name",
				description = nil,
				defaultValue = nil,
				deprecationReason = nil,
				extensions = nil,
				astNode = nil,
				type = GraphQLNonNull.new(GraphQLString)
			}
		},
		resolve = function(_, p1, _, p2) --[[ Line: 815 ]]
			return p2.schema:getType(p1.name)
		end
	},
	SchemaMetaFieldDef = {
		name = "__schema",
		description = "Access the current type schema of this server.",
		deprecationReason = nil,
		extensions = nil,
		astNode = nil,
		type = GraphQLNonNull.new(Schema),
		args = {},
		resolve = function(_, _, _, p1) --[[ Line: 790 ]]
			return p1.schema
		end
	},
	TypeKind = FreezeResult,
	__TypeKind = TypeKind,
	__Schema = Schema,
	__Directive = Directive,
	__DirectiveLocation = DirectiveLocation1,
	__Type = Type,
	__Field = Field,
	__InputValue = InputValue,
	__EnumValue = EnumValue
}