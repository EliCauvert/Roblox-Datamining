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
local var1 = nil
local var2 = nil
local var3 = nil
local var4 = nil
local var5 = nil
local var6 = nil
local var7 = nil
local var8 = nil
local var9 = graphQLObjectType.new({
	name = "__Schema",
	description = "A GraphQL Schema defines the capabilities of a GraphQL server. It exposes all available types and directives on the server, as well as the entry points for query, mutation, and subscription operations.",
	fields = function()
		-- upvalues: map (ref), graphQLString (ref), graphQLNonNull (ref), graphQLList (ref), var5 (write), var3 (write)
		return map.new({
			{
				"description",
				{
					type = graphQLString,
					resolve = function(p1)
						return p1.description
					end
				}
			},
			{
				"types",
				{
					description = "A list of all types supported by this server.",
					type = graphQLNonNull.new(graphQLList.new(graphQLNonNull.new(var5))),
					resolve = function(p1)
						return p1:getTypeMap():values()
					end
				}
			},
			{
				"queryType",
				{
					description = "The type that query operations will be rooted at.",
					type = graphQLNonNull.new(var5),
					resolve = function(p1)
						return p1:getQueryType()
					end
				}
			},
			{
				"mutationType",
				{
					description = "If this server supports mutation, the type that mutation operations will be rooted at.",
					type = var5,
					resolve = function(p1)
						return p1:getMutationType()
					end
				}
			},
			{
				"subscriptionType",
				{
					description = "If this server support subscription, the type that subscription operations will be rooted at.",
					type = var5,
					resolve = function(p1)
						return p1:getSubscriptionType()
					end
				}
			},
			{
				"directives",
				{
					description = "A list of all directives supported by this server.",
					type = graphQLNonNull.new(graphQLList.new(graphQLNonNull.new(var3))),
					resolve = function(p1)
						return p1:getDirectives()
					end
				}
			}
		})
	end
})
var3 = graphQLObjectType.new({
	name = "__Directive",
	description = "A Directive provides a way to describe alternate runtime execution and type validation behavior in a GraphQL document.\n\nIn some cases, you need to provide options to alter GraphQL's execution behavior in ways field arguments will not suffice, such as conditionally including or skipping a field. Directives provide this by describing additional information to the executor.",
	fields = function()
		-- upvalues: map (ref), graphQLNonNull (ref), graphQLString (ref), graphQLBoolean (ref), graphQLList (ref), var4 (write), var7 (write)
		return map.new({
			{
				"name",
				{
					type = graphQLNonNull.new(graphQLString),
					resolve = function(p1)
						return p1.name
					end
				}
			},
			{
				"description",
				{
					type = graphQLString,
					resolve = function(p1)
						return p1.description
					end
				}
			},
			{
				"isRepeatable",
				{
					type = graphQLNonNull.new(graphQLBoolean),
					resolve = function(p1)
						return p1.isRepeatable
					end
				}
			},
			{
				"locations",
				{
					type = graphQLNonNull.new(graphQLList.new(graphQLNonNull.new(var4))),
					resolve = function(p1)
						return p1.locations
					end
				}
			},
			{
				"args",
				{
					type = graphQLNonNull.new(graphQLList.new(graphQLNonNull.new(var7))),
					resolve = function(p1)
						return p1.args
					end
				}
			}
		})
	end
})
var4 = graphQLEnumType.new({
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
var5 = graphQLObjectType.new({
	name = "__Type",
	description = "The fundamental unit of any GraphQL Schema is the type. There are many kinds of types in GraphQL as represented by the `__TypeKind` enum.\n\nDepending on the kind of a type, certain fields describe information about that type. Scalar types provide no information beyond a name, description and optional `specifiedByUrl`, while Enum types provide their values. Object and Interface types provide the fields they describe. Abstract types, Union and Interface, provide the Object types possible at runtime. List and NonNull types compose other types.",
	fields = function()
		-- upvalues: map (ref), graphQLNonNull (ref), var2 (write), isScalarType (ref), var1 (write), isObjectType (ref), isInterfaceType (ref), isUnionType (ref), isEnumType (ref), isInputObjectType (ref), isListType (ref), isNonNullType (ref), invariant (ref), inspect (ref), graphQLString (ref), graphQLList (ref), var6 (write), graphQLBoolean (ref), array (ref), var5 (write), isAbstractType (ref), var8 (write), var7 (write)
		return map.new({
			{
				"kind",
				{
					type = graphQLNonNull.new(var2),
					resolve = function(p1)
						-- upvalues: isScalarType (copy), var1 (copy), isObjectType (copy), isInterfaceType (copy), isUnionType (copy), isEnumType (copy), isInputObjectType (copy), isListType (copy), isNonNullType (copy), invariant (copy), inspect (copy)
						if isScalarType(p1) then
							return var1.SCALAR
						elseif isObjectType(p1) then
							return var1.OBJECT
						elseif isInterfaceType(p1) then
							return var1.INTERFACE
						elseif isUnionType(p1) then
							return var1.UNION
						elseif isEnumType(p1) then
							return var1.ENUM
						elseif isInputObjectType(p1) then
							return var1.INPUT_OBJECT
						elseif isListType(p1) then
							return var1.LIST
						elseif isNonNullType(p1) then
							return var1.NON_NULL
						end
						invariant(false, ("Unexpected type: \"%s\"."):format(inspect(p1)))
						assert(false)
					end
				}
			},
			{
				"name",
				{
					type = graphQLString,
					resolve = function(p1)
						return if p1.name == nil then nil else p1.name
					end
				}
			},
			{
				"description",
				{
					type = graphQLString,
					resolve = function(p1)
						return if p1.description == nil then nil else p1.description
					end
				}
			},
			{
				"specifiedByUrl",
				{
					type = graphQLString,
					resolve = function(p1)
						return if p1.specifiedByUrl == nil then nil else p1.specifiedByUrl
					end
				}
			},
			{
				"fields",
				{
					type = graphQLList.new(graphQLNonNull.new(var6)),
					args = {
						includeDeprecated = { defaultValue = false, type = graphQLBoolean }
					},
					resolve = function(p1, p2)
						-- upvalues: isObjectType (copy), isInterfaceType (copy), array (copy)
						local includeDeprecated = p2.includeDeprecated
						
						if isObjectType(p1) or isInterfaceType(p1) then
							local var10 = p1:getFields():values()
							
							return if includeDeprecated then var10 else array.filter(var10, function(p3)
								return p3.deprecationReason == nil
							end)
						end
					end
				}
			},
			{
				"interfaces",
				{
					type = graphQLList.new(graphQLNonNull.new(var5)),
					resolve = function(p1)
						-- upvalues: isObjectType (copy), isInterfaceType (copy)
						if isObjectType(p1) or isInterfaceType(p1) then
							return p1:getInterfaces()
						end
					end
				}
			},
			{
				"possibleTypes",
				{
					type = graphQLList.new(graphQLNonNull.new(var5)),
					resolve = function(p1, _, _, p2)
						-- upvalues: isAbstractType (copy)
						return if isAbstractType(p1) then p2.schema:getPossibleTypes(p1) else nil
					end
				}
			},
			{
				"enumValues",
				{
					type = graphQLList.new(graphQLNonNull.new(var8)),
					args = {
						includeDeprecated = { defaultValue = false, type = graphQLBoolean }
					},
					resolve = function(p1, p2)
						-- upvalues: isEnumType (copy), array (copy)
						local includeDeprecated = p2.includeDeprecated
						
						if isEnumType(p1) then
							local values = p1:getValues()
							
							return if includeDeprecated then values else array.filter(values, function(p3)
								return p3.deprecationReason == nil
							end)
						end
					end
				}
			},
			{
				"inputFields",
				{
					type = graphQLList.new(graphQLNonNull.new(var7)),
					args = {
						includeDeprecated = { defaultValue = false, type = graphQLBoolean }
					},
					resolve = function(p1, p2)
						-- upvalues: isInputObjectType (copy), array (copy)
						local includeDeprecated = p2.includeDeprecated
						
						if isInputObjectType(p1) then
							local var10 = p1:getFields():values()
							
							return if includeDeprecated then var10 else array.filter(var10, function(p3)
								return p3.deprecationReason == nil
							end)
						end
					end
				}
			},
			{
				"ofType",
				{
					type = var5,
					resolve = function(p1)
						return if p1.ofType == nil then nil else p1.ofType
					end
				}
			}
		})
	end
})
var6 = graphQLObjectType.new({
	name = "__Field",
	description = "Object and Interface types are described by a list of Fields, each of which has a name, potentially a list of arguments, and a return type.",
	fields = function()
		-- upvalues: map (ref), graphQLNonNull (ref), graphQLString (ref), graphQLList (ref), var7 (write), graphQLBoolean (ref), array (ref), var5 (write), isNotNillish (ref)
		return map.new({
			{
				"name",
				{
					type = graphQLNonNull.new(graphQLString),
					resolve = function(p1)
						return p1.name
					end
				}
			},
			{
				"description",
				{
					type = graphQLString,
					resolve = function(p1)
						return p1.description
					end
				}
			},
			{
				"args",
				{
					type = graphQLNonNull.new(graphQLList.new(graphQLNonNull.new(var7))),
					args = {
						includeDeprecated = { defaultValue = false, type = graphQLBoolean }
					},
					resolve = function(p1, p2)
						-- upvalues: array (copy)
						return if p2.includeDeprecated then p1.args else array.filter(p1.args, function(p3)
							return p3.deprecationReason == nil
						end)
					end
				}
			},
			{
				"type",
				{
					type = graphQLNonNull.new(var5),
					resolve = function(p1)
						return p1.type
					end
				}
			},
			{
				"isDeprecated",
				{
					type = graphQLNonNull.new(graphQLBoolean),
					resolve = function(p1)
						-- upvalues: isNotNillish (copy)
						return isNotNillish(p1.deprecationReason)
					end
				}
			},
			{
				"deprecationReason",
				{
					type = graphQLString,
					resolve = function(p1)
						return p1.deprecationReason
					end
				}
			}
		})
	end
})
var7 = graphQLObjectType.new({
	name = "__InputValue",
	description = "Arguments provided to Fields or Directives and the input fields of an InputObject are represented as Input Values which describe their type and optionally a default value.",
	fields = function()
		-- upvalues: map (ref), graphQLNonNull (ref), graphQLString (ref), var5 (write), astFromValue (ref), print (ref), graphQLBoolean (ref), isNotNillish (ref)
		return map.new({
			{
				"name",
				{
					type = graphQLNonNull.new(graphQLString),
					resolve = function(p1)
						return p1.name
					end
				}
			},
			{
				"description",
				{
					type = graphQLString,
					resolve = function(p1)
						return p1.description
					end
				}
			},
			{
				"type",
				{
					type = graphQLNonNull.new(var5),
					resolve = function(p1)
						return p1.type
					end
				}
			},
			{
				"defaultValue",
				{
					description = "A GraphQL-formatted string representing the default value for this input value.",
					type = graphQLString,
					resolve = function(p1)
						-- upvalues: astFromValue (copy), print (copy)
						local var10 = astFromValue(p1.defaultValue, p1.type)
						
						return if var10 then print(var10) else nil
					end
				}
			},
			{
				"isDeprecated",
				{
					type = graphQLNonNull.new(graphQLBoolean),
					resolve = function(p1)
						-- upvalues: isNotNillish (copy)
						return isNotNillish(p1.deprecationReason)
					end
				}
			},
			{
				"deprecationReason",
				{
					type = graphQLString,
					resolve = function(p1)
						return p1.deprecationReason
					end
				}
			}
		})
	end
})
var8 = graphQLObjectType.new({
	name = "__EnumValue",
	description = "One possible value for a given Enum. Enum values are unique values, not a placeholder for a string or numeric value. However an Enum value is returned in a JSON response as a string.",
	fields = function()
		-- upvalues: map (ref), graphQLNonNull (ref), graphQLString (ref), graphQLBoolean (ref), isNotNillish (ref)
		return map.new({
			{
				"name",
				{
					type = graphQLNonNull.new(graphQLString),
					resolve = function(p1)
						return p1.name
					end
				}
			},
			{
				"description",
				{
					type = graphQLString,
					resolve = function(p1)
						return p1.description
					end
				}
			},
			{
				"isDeprecated",
				{
					type = graphQLNonNull.new(graphQLBoolean),
					resolve = function(p1)
						-- upvalues: isNotNillish (copy)
						return isNotNillish(p1.deprecationReason)
					end
				}
			},
			{
				"deprecationReason",
				{
					type = graphQLString,
					resolve = function(p1)
						return p1.deprecationReason
					end
				}
			}
		})
	end
})
var1 = object.freeze({
	SCALAR = "SCALAR",
	OBJECT = "OBJECT",
	INTERFACE = "INTERFACE",
	UNION = "UNION",
	ENUM = "ENUM",
	INPUT_OBJECT = "INPUT_OBJECT",
	LIST = "LIST",
	NON_NULL = "NON_NULL"
})
var2 = graphQLEnumType.new({
	name = "__TypeKind",
	description = "An enum describing what kind of type a given `__Type` is.",
	values = map.new({
		{
			"SCALAR",
			{
				description = "Indicates this type is a scalar.",
				value = var1.SCALAR
			}
		},
		{
			"OBJECT",
			{
				description = "Indicates this type is an object. `fields` and `interfaces` are valid fields.",
				value = var1.OBJECT
			}
		},
		{
			"INTERFACE",
			{
				description = "Indicates this type is an interface. `fields`, `interfaces`, and `possibleTypes` are valid fields.",
				value = var1.INTERFACE
			}
		},
		{
			"UNION",
			{
				description = "Indicates this type is a union. `possibleTypes` is a valid field.",
				value = var1.UNION
			}
		},
		{
			"ENUM",
			{
				description = "Indicates this type is an enum. `enumValues` is a valid field.",
				value = var1.ENUM
			}
		},
		{
			"INPUT_OBJECT",
			{
				description = "Indicates this type is an input object. `inputFields` is a valid field.",
				value = var1.INPUT_OBJECT
			}
		},
		{
			"LIST",
			{
				description = "Indicates this type is a list. `ofType` is a valid field.",
				value = var1.LIST
			}
		},
		{
			"NON_NULL",
			{
				description = "Indicates this type is a non-null. `ofType` is a valid field.",
				value = var1.NON_NULL
			}
		}
	})
})
local var10 = object.freeze({
	var9, var3, var4, var5, var6, var7, var8, var2
})

return {
	introspectionTypes = var10,
	isIntrospectionType = function(p1)
		-- upvalues: array (ref), var10 (ref)
		return array.some(var10, function(p2)
			-- upvalues: p1 (ref)
			return p1.name == p2.name
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
		resolve = function(_, _, _, p1)
			return p1.parentType.name
		end
	},
	TypeMetaFieldDef = {
		name = "__type",
		description = "Request the type information of a single type.",
		deprecationReason = nil,
		extensions = nil,
		astNode = nil,
		type = var5,
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
		resolve = function(_, p1, _, p2)
			return p2.schema:getType(p1.name)
		end
	},
	SchemaMetaFieldDef = {
		name = "__schema",
		description = "Access the current type schema of this server.",
		deprecationReason = nil,
		extensions = nil,
		astNode = nil,
		type = graphQLNonNull.new(var9),
		args = {},
		resolve = function(_, _, _, p1)
			return p1.schema
		end
	},
	TypeKind = var1,
	__TypeKind = var2,
	__Schema = var9,
	__Directive = var3,
	__DirectiveLocation = var4,
	__Type = var5,
	__Field = var6,
	__InputValue = var7,
	__EnumValue = var8
}