local parent = script.Parent.Parent
local jsutils = parent.jsutils
local language = parent.language
local luauPolyfillModule = require(parent.Parent.LuauPolyfill)
local array = luauPolyfillModule.Array
local map = luauPolyfillModule.Map
local object = luauPolyfillModule.Object
local isNotNillish = require(parent.luaUtils.isNillish).isNotNillish
local inspect = require(jsutils.inspect).inspect
local invariant = require(jsutils.invariant).invariant
local print = require(language.printer).print
local directiveLocation = require(language.directiveLocation).DirectiveLocation
local astFromValue = require(parent.utilities.astFromValue).astFromValue
local _ = require(parent.language.ast)
local scalarsModule = require(script.Parent.scalars)
local graphQLString = scalarsModule.GraphQLString
local graphQLBoolean = scalarsModule.GraphQLBoolean
local definitionModule = require(script.Parent.definition)
local graphQLList = definitionModule.GraphQLList
local graphQLNonNull = definitionModule.GraphQLNonNull
local graphQLObjectType = definitionModule.GraphQLObjectType
local graphQLEnumType = definitionModule.GraphQLEnumType
local isScalarType = definitionModule.isScalarType
local isObjectType = definitionModule.isObjectType
local isInterfaceType = definitionModule.isInterfaceType
local isUnionType = definitionModule.isUnionType
local isEnumType = definitionModule.isEnumType
local isInputObjectType = definitionModule.isInputObjectType
local isListType = definitionModule.isListType
local isNonNullType = definitionModule.isNonNullType
local isAbstractType = definitionModule.isAbstractType
local var3 = nil
local var4 = nil
local var5 = nil
local var6 = nil
local var7 = nil
local var8 = nil
local var9 = nil
local var10 = nil
local var11 = graphQLObjectType.new({
	name = "__Schema",
	description = "A GraphQL Schema defines the capabilities of a GraphQL server. It exposes all available types and directives on the server, as well as the entry points for query, mutation, and subscription operations.",
	fields = function() --[[ line: 74 ]]
		-- upvalues: map (ref), graphQLString (ref), graphQLNonNull (ref), graphQLList (ref), var7 (write), var5 (write)
		return map.new({
			{
				"description",
				{
					type = graphQLString,
					resolve = function(p0) --[[ line: 80 ]]
						return p0.description
					end
				}
			},
			{
				"types",
				{
					description = "A list of all types supported by this server.",
					type = graphQLNonNull.new(graphQLList.new(graphQLNonNull.new(var7))),
					resolve = function(p1) --[[ line: 90 ]]
						return p1:getTypeMap():values()
					end
				}
			},
			{
				"queryType",
				{
					description = "The type that query operations will be rooted at.",
					type = graphQLNonNull.new(var7),
					resolve = function(p2) --[[ line: 101 ]]
						return p2:getQueryType()
					end
				}
			},
			{
				"mutationType",
				{
					description = "If this server supports mutation, the type that mutation operations will be rooted at.",
					type = var7,
					resolve = function(p3) --[[ line: 111 ]]
						return p3:getMutationType()
					end
				}
			},
			{
				"subscriptionType",
				{
					description = "If this server support subscription, the type that subscription operations will be rooted at.",
					type = var7,
					resolve = function(p4) --[[ line: 121 ]]
						return p4:getSubscriptionType()
					end
				}
			},
			{
				"directives",
				{
					description = "A list of all directives supported by this server.",
					type = graphQLNonNull.new(graphQLList.new(graphQLNonNull.new(var5))),
					resolve = function(p5) --[[ line: 131 ]]
						return p5:getDirectives()
					end
				}
			}
		})
	end
})
var5 = graphQLObjectType.new({
	name = "__Directive",
	description = "A Directive provides a way to describe alternate runtime execution and type validation behavior in a GraphQL document.\n\nIn some cases, you need to provide options to alter GraphQL's execution behavior in ways field arguments will not suffice, such as conditionally including or skipping a field. Directives provide this by describing additional information to the executor.",
	fields = function() --[[ line: 143 ]]
		-- upvalues: map (ref), graphQLNonNull (ref), graphQLString (ref), graphQLBoolean (ref), graphQLList (ref), var6 (write), var9 (write)
		return map.new({
			{
				"name",
				{
					type = graphQLNonNull.new(graphQLString),
					resolve = function(p6) --[[ line: 149 ]]
						return p6.name
					end
				}
			},
			{
				"description",
				{
					type = graphQLString,
					resolve = function(p7) --[[ line: 158 ]]
						return p7.description
					end
				}
			},
			{
				"isRepeatable",
				{
					type = graphQLNonNull.new(graphQLBoolean),
					resolve = function(p8) --[[ line: 167 ]]
						return p8.isRepeatable
					end
				}
			},
			{
				"locations",
				{
					type = graphQLNonNull.new(graphQLList.new(graphQLNonNull.new(var6))),
					resolve = function(p9) --[[ line: 178 ]]
						return p9.locations
					end
				}
			},
			{
				"args",
				{
					type = graphQLNonNull.new(graphQLList.new(graphQLNonNull.new(var9))),
					resolve = function(p10) --[[ line: 187 ]]
						return p10.args
					end
				}
			}
		})
	end
})
var6 = graphQLEnumType.new({
	name = "__DirectiveLocation",
	description = "A Directive can be adjacent to many parts of the GraphQL language, a __DirectiveLocation describes one such possible adjacencies.",
	values = map.new({
		{
			"QUERY",
			{
				description = "Location adjacent to a query operation.",
				value = directiveLocation.QUERY
			}
		},
		{
			"MUTATION",
			{
				description = "Location adjacent to a mutation operation.",
				value = directiveLocation.MUTATION
			}
		},
		{
			"SUBSCRIPTION",
			{
				description = "Location adjacent to a subscription operation.",
				value = directiveLocation.SUBSCRIPTION
			}
		},
		{
			"FIELD",
			{
				description = "Location adjacent to a field.",
				value = directiveLocation.FIELD
			}
		},
		{
			"FRAGMENT_DEFINITION",
			{
				description = "Location adjacent to a fragment definition.",
				value = directiveLocation.FRAGMENT_DEFINITION
			}
		},
		{
			"FRAGMENT_SPREAD",
			{
				description = "Location adjacent to a fragment spread.",
				value = directiveLocation.FRAGMENT_SPREAD
			}
		},
		{
			"INLINE_FRAGMENT",
			{
				description = "Location adjacent to an inline fragment.",
				value = directiveLocation.INLINE_FRAGMENT
			}
		},
		{
			"VARIABLE_DEFINITION",
			{
				description = "Location adjacent to a variable definition.",
				value = directiveLocation.VARIABLE_DEFINITION
			}
		},
		{
			"SCHEMA",
			{
				description = "Location adjacent to a schema definition.",
				value = directiveLocation.SCHEMA
			}
		},
		{
			"SCALAR",
			{
				description = "Location adjacent to a scalar definition.",
				value = directiveLocation.SCALAR
			}
		},
		{
			"OBJECT",
			{
				description = "Location adjacent to an object type definition.",
				value = directiveLocation.OBJECT
			}
		},
		{
			"FIELD_DEFINITION",
			{
				description = "Location adjacent to a field definition.",
				value = directiveLocation.FIELD_DEFINITION
			}
		},
		{
			"ARGUMENT_DEFINITION",
			{
				description = "Location adjacent to an argument definition.",
				value = directiveLocation.ARGUMENT_DEFINITION
			}
		},
		{
			"INTERFACE",
			{
				description = "Location adjacent to an interface definition.",
				value = directiveLocation.INTERFACE
			}
		},
		{
			"UNION",
			{
				description = "Location adjacent to a union definition.",
				value = directiveLocation.UNION
			}
		},
		{
			"ENUM",
			{
				description = "Location adjacent to an enum definition.",
				value = directiveLocation.ENUM
			}
		},
		{
			"ENUM_VALUE",
			{
				description = "Location adjacent to an enum value definition.",
				value = directiveLocation.ENUM_VALUE
			}
		},
		{
			"INPUT_OBJECT",
			{
				description = "Location adjacent to an input object type definition.",
				value = directiveLocation.INPUT_OBJECT
			}
		},
		{
			"INPUT_FIELD_DEFINITION",
			{
				description = "Location adjacent to an input object field definition.",
				value = directiveLocation.INPUT_FIELD_DEFINITION
			}
		}
	})
})
var7 = graphQLObjectType.new({
	name = "__Type",
	description = "The fundamental unit of any GraphQL Schema is the type. There are many kinds of types in GraphQL as represented by the `__TypeKind` enum.\n\nDepending on the kind of a type, certain fields describe information about that type. Scalar types provide no information beyond a name, description and optional `specifiedByUrl`, while Enum types provide their values. Object and Interface types provide the fields they describe. Abstract types, Union and Interface, provide the Object types possible at runtime. List and NonNull types compose other types.",
	fields = function() --[[ line: 339 ]]
		-- upvalues: map (ref), graphQLNonNull (ref), var4 (write), isScalarType (ref), var3 (write), isObjectType (ref), isInterfaceType (ref), isUnionType (ref), isEnumType (ref), isInputObjectType (ref), isListType (ref), isNonNullType (ref), invariant (ref), inspect (ref), graphQLString (ref), graphQLList (ref), var8 (write), graphQLBoolean (ref), array (ref), var7 (write), isAbstractType (ref), var10 (write), var9 (write)
		return map.new({
			{
				"kind",
				{
					type = graphQLNonNull.new(var4),
					resolve = function(p11) --[[ line: 345 ]]
						-- upvalues: isScalarType (copy), var3 (copy), isObjectType (copy), isInterfaceType (copy), isUnionType (copy), isEnumType (copy), isInputObjectType (copy), isListType (copy), isNonNullType (copy), invariant (copy), inspect (copy)
						if isScalarType(p11) then
							return var3.SCALAR
						elseif isObjectType(p11) then
							return var3.OBJECT
						elseif isInterfaceType(p11) then
							return var3.INTERFACE
						elseif isUnionType(p11) then
							return var3.UNION
						elseif isEnumType(p11) then
							return var3.ENUM
						elseif isInputObjectType(p11) then
							return var3.INPUT_OBJECT
						elseif isListType(p11) then
							return var3.LIST
						elseif isNonNullType(p11) then
							return var3.NON_NULL
						end
						invariant(false, ("Unexpected type: \"%s\"."):format(inspect(p11)))
						assert(false)
					end
				}
			},
			{
				"name",
				{
					type = graphQLString,
					resolve = function(p12) --[[ line: 382 ]]
						return if p12.name == nil then nil else p12.name
					end
				}
			},
			{
				"description",
				{
					type = graphQLString,
					resolve = function(p13) --[[ line: 391 ]]
						return if p13.description == nil then nil else p13.description
					end
				}
			},
			{
				"specifiedByUrl",
				{
					type = graphQLString,
					resolve = function(p14) --[[ line: 400 ]]
						return if p14.specifiedByUrl == nil then nil else p14.specifiedByUrl
					end
				}
			},
			{
				"fields",
				{
					type = graphQLList.new(graphQLNonNull.new(var8)),
					args = {
						includeDeprecated = { defaultValue = false, type = graphQLBoolean }
					},
					resolve = function(p15, p16) --[[ line: 415 ]]
						-- upvalues: isObjectType (copy), isInterfaceType (copy), array (copy)
						local includeDeprecated = p16.includeDeprecated
						
						if isObjectType(p15) or isInterfaceType(p15) then
							local var13 = p15:getFields():values()
							
							return if includeDeprecated then var13 else array.filter(var13, function(p17) --[[ line: 421 ]]
								return p17.deprecationReason == nil
							end)
						end
					end
				}
			},
			{
				"interfaces",
				{
					type = graphQLList.new(graphQLNonNull.new(var7)),
					resolve = function(p18) --[[ line: 433 ]]
						-- upvalues: isObjectType (copy), isInterfaceType (copy)
						if isObjectType(p18) or isInterfaceType(p18) then
							return p18:getInterfaces()
						end
					end
				}
			},
			{
				"possibleTypes",
				{
					type = graphQLList.new(graphQLNonNull.new(var7)),
					resolve = function(p19, _, _, p20) --[[ line: 445 ]]
						-- upvalues: isAbstractType (copy)
						return if isAbstractType(p19) then p20.schema:getPossibleTypes(p19) else nil
					end
				}
			},
			{
				"enumValues",
				{
					type = graphQLList.new(graphQLNonNull.new(var10)),
					args = {
						includeDeprecated = { defaultValue = false, type = graphQLBoolean }
					},
					resolve = function(p21, p22) --[[ line: 465 ]]
						-- upvalues: isEnumType (copy), array (copy)
						local includeDeprecated = p22.includeDeprecated
						
						if isEnumType(p21) then
							local values = p21:getValues()
							
							return if includeDeprecated then values else array.filter(values, function(p23) --[[ line: 472 ]]
								return p23.deprecationReason == nil
							end)
						end
					end
				}
			},
			{
				"inputFields",
				{
					type = graphQLList.new(graphQLNonNull.new(var9)),
					args = {
						includeDeprecated = { defaultValue = false, type = graphQLBoolean }
					},
					resolve = function(p24, p25) --[[ line: 490 ]]
						-- upvalues: isInputObjectType (copy), array (copy)
						local includeDeprecated = p25.includeDeprecated
						
						if isInputObjectType(p24) then
							local var15 = p24:getFields():values()
							
							return if includeDeprecated then var15 else array.filter(var15, function(p26) --[[ line: 498 ]]
								return p26.deprecationReason == nil
							end)
						end
					end
				}
			},
			{
				"ofType",
				{
					type = var7,
					resolve = function(p27) --[[ line: 510 ]]
						return if p27.ofType == nil then nil else p27.ofType
					end
				}
			}
		})
	end
})
var8 = graphQLObjectType.new({
	name = "__Field",
	description = "Object and Interface types are described by a list of Fields, each of which has a name, potentially a list of arguments, and a return type.",
	fields = function() --[[ line: 522 ]]
		-- upvalues: map (ref), graphQLNonNull (ref), graphQLString (ref), graphQLList (ref), var9 (write), graphQLBoolean (ref), array (ref), var7 (write), isNotNillish (ref)
		return map.new({
			{
				"name",
				{
					type = graphQLNonNull.new(graphQLString),
					resolve = function(p28) --[[ line: 528 ]]
						return p28.name
					end
				}
			},
			{
				"description",
				{
					type = graphQLString,
					resolve = function(p29) --[[ line: 537 ]]
						return p29.description
					end
				}
			},
			{
				"args",
				{
					type = graphQLNonNull.new(graphQLList.new(graphQLNonNull.new(var9))),
					args = {
						includeDeprecated = { defaultValue = false, type = graphQLBoolean }
					},
					resolve = function(p30, p31) --[[ line: 552 ]]
						-- upvalues: array (copy)
						return if p31.includeDeprecated then p30.args else array.filter(p30.args, function(p32) --[[ line: 557 ]]
							return p32.deprecationReason == nil
						end)
					end
				}
			},
			{
				"type",
				{
					type = graphQLNonNull.new(var7),
					resolve = function(p33) --[[ line: 567 ]]
						return p33.type
					end
				}
			},
			{
				"isDeprecated",
				{
					type = graphQLNonNull.new(graphQLBoolean),
					resolve = function(p34) --[[ line: 576 ]]
						-- upvalues: isNotNillish (copy)
						return isNotNillish(p34.deprecationReason)
					end
				}
			},
			{
				"deprecationReason",
				{
					type = graphQLString,
					resolve = function(p35) --[[ line: 585 ]]
						return p35.deprecationReason
					end
				}
			}
		})
	end
})
var9 = graphQLObjectType.new({
	name = "__InputValue",
	description = "Arguments provided to Fields or Directives and the input fields of an InputObject are represented as Input Values which describe their type and optionally a default value.",
	fields = function() --[[ line: 597 ]]
		-- upvalues: map (ref), graphQLNonNull (ref), graphQLString (ref), var7 (write), astFromValue (ref), print (ref), graphQLBoolean (ref), isNotNillish (ref)
		return map.new({
			{
				"name",
				{
					type = graphQLNonNull.new(graphQLString),
					resolve = function(p36) --[[ line: 603 ]]
						return p36.name
					end
				}
			},
			{
				"description",
				{
					type = graphQLString,
					resolve = function(p37) --[[ line: 612 ]]
						return p37.description
					end
				}
			},
			{
				"type",
				{
					type = graphQLNonNull.new(var7),
					resolve = function(p38) --[[ line: 621 ]]
						return p38.type
					end
				}
			},
			{
				"defaultValue",
				{
					description = "A GraphQL-formatted string representing the default value for this input value.",
					type = graphQLString,
					resolve = function(p39) --[[ line: 631 ]]
						-- upvalues: astFromValue (copy), print (copy)
						local var16 = astFromValue(p39.defaultValue, p39.type)
						
						return if var16 then print(var16) else nil
					end
				}
			},
			{
				"isDeprecated",
				{
					type = graphQLNonNull.new(graphQLBoolean),
					resolve = function(p40) --[[ line: 643 ]]
						-- upvalues: isNotNillish (copy)
						return isNotNillish(p40.deprecationReason)
					end
				}
			},
			{
				"deprecationReason",
				{
					type = graphQLString,
					resolve = function(p41) --[[ line: 652 ]]
						return p41.deprecationReason
					end
				}
			}
		})
	end
})
var10 = graphQLObjectType.new({
	name = "__EnumValue",
	description = "One possible value for a given Enum. Enum values are unique values, not a placeholder for a string or numeric value. However an Enum value is returned in a JSON response as a string.",
	fields = function() --[[ line: 664 ]]
		-- upvalues: map (ref), graphQLNonNull (ref), graphQLString (ref), graphQLBoolean (ref), isNotNillish (ref)
		return map.new({
			{
				"name",
				{
					type = graphQLNonNull.new(graphQLString),
					resolve = function(p42) --[[ line: 670 ]]
						return p42.name
					end
				}
			},
			{
				"description",
				{
					type = graphQLString,
					resolve = function(p43) --[[ line: 679 ]]
						return p43.description
					end
				}
			},
			{
				"isDeprecated",
				{
					type = graphQLNonNull.new(graphQLBoolean),
					resolve = function(p44) --[[ line: 688 ]]
						-- upvalues: isNotNillish (copy)
						return isNotNillish(p44.deprecationReason)
					end
				}
			},
			{
				"deprecationReason",
				{
					type = graphQLString,
					resolve = function(p45) --[[ line: 697 ]]
						return p45.deprecationReason
					end
				}
			}
		})
	end
})
var3 = object.freeze({
	SCALAR = "SCALAR",
	OBJECT = "OBJECT",
	INTERFACE = "INTERFACE",
	UNION = "UNION",
	ENUM = "ENUM",
	INPUT_OBJECT = "INPUT_OBJECT",
	LIST = "LIST",
	NON_NULL = "NON_NULL"
})
var4 = graphQLEnumType.new({
	name = "__TypeKind",
	description = "An enum describing what kind of type a given `__Type` is.",
	values = map.new({
		{
			"SCALAR",
			{
				description = "Indicates this type is a scalar.",
				value = var3.SCALAR
			}
		},
		{
			"OBJECT",
			{
				description = "Indicates this type is an object. `fields` and `interfaces` are valid fields.",
				value = var3.OBJECT
			}
		},
		{
			"INTERFACE",
			{
				description = "Indicates this type is an interface. `fields`, `interfaces`, and `possibleTypes` are valid fields.",
				value = var3.INTERFACE
			}
		},
		{
			"UNION",
			{
				description = "Indicates this type is a union. `possibleTypes` is a valid field.",
				value = var3.UNION
			}
		},
		{
			"ENUM",
			{
				description = "Indicates this type is an enum. `enumValues` is a valid field.",
				value = var3.ENUM
			}
		},
		{
			"INPUT_OBJECT",
			{
				description = "Indicates this type is an input object. `inputFields` is a valid field.",
				value = var3.INPUT_OBJECT
			}
		},
		{
			"LIST",
			{
				description = "Indicates this type is a list. `ofType` is a valid field.",
				value = var3.LIST
			}
		},
		{
			"NON_NULL",
			{
				description = "Indicates this type is a non-null. `ofType` is a valid field.",
				value = var3.NON_NULL
			}
		}
	})
})
local var12 = object.freeze({
	var11, var5, var6, var7, var8, var9, var10, var4
})

return {
	introspectionTypes = var12,
	isIntrospectionType = function(p46) --[[ line: 852 ]]
		-- upvalues: array (ref), var12 (ref)
		return array.some(var12, function(p47) --[[ line: 853 ]]
			-- upvalues: p46 (ref)
			return p46.name == p47.name
		end)
	end,
	TypeNameMetaFieldDef = {
		name = "__typename",
		description = "The name of the current Object type at runtime.",
		deprecationReason = nil,
		extensions = nil,
		astNode = nil,
		type = graphQLNonNull.new(graphQLString),
		args = {},
		resolve = function(_, _, _, p48) --[[ line: 831 ]]
			return p48.parentType.name
		end
	},
	TypeMetaFieldDef = {
		name = "__type",
		description = "Request the type information of a single type.",
		deprecationReason = nil,
		extensions = nil,
		astNode = nil,
		type = var7,
		args = {
			{
				name = "name",
				description = nil,
				defaultValue = nil,
				deprecationReason = nil,
				extensions = nil,
				astNode = nil,
				type = graphQLNonNull.new(graphQLString)
			}
		},
		resolve = function(_, p49, _, p50) --[[ line: 815 ]]
			return p50.schema:getType(p49.name)
		end
	},
	SchemaMetaFieldDef = {
		name = "__schema",
		description = "Access the current type schema of this server.",
		deprecationReason = nil,
		extensions = nil,
		astNode = nil,
		type = graphQLNonNull.new(var11),
		args = {},
		resolve = function(_, _, _, p51) --[[ line: 790 ]]
			return p51.schema
		end
	},
	TypeKind = var3,
	__TypeKind = var4,
	__Schema = var11,
	__Directive = var5,
	__DirectiveLocation = var6,
	__Type = var7,
	__Field = var8,
	__InputValue = var9,
	__EnumValue = var10
}