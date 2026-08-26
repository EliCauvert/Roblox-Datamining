local parent = script.Parent.Parent
local luaUtils = parent.luaUtils
local luauPolyfillModule = require(parent.Parent.LuauPolyfill)
local array = luauPolyfillModule.Array
local error = luauPolyfillModule.Error
local nullModule = require(luaUtils.null)
local isNillishModule = require(luaUtils.isNillish)
local isNillish = isNillishModule.isNillish
local isNotNillish = isNillishModule.isNotNillish
local inspect = require(parent.jsutils.inspect).inspect
local devAssert = require(parent.jsutils.devAssert).devAssert
local keyValMap = require(parent.jsutils.keyValMap).keyValMap
local isObjectLike = require(parent.jsutils.isObjectLike).isObjectLike
local parseValue = require(parent.language.parser).parseValue
local definitionModule = require(parent.type.definition)
local graphQLSchema = require(parent.type.schema).GraphQLSchema
local graphQLDirective = require(parent.type.directives).GraphQLDirective
local specifiedScalarTypes = require(parent.type.scalars).specifiedScalarTypes
local introspectionModule = require(parent.type.introspection)
local introspectionTypes = introspectionModule.introspectionTypes
local typeKind = introspectionModule.TypeKind
local isInputType = definitionModule.isInputType
local isOutputType = definitionModule.isOutputType
local graphQLList = definitionModule.GraphQLList
local graphQLNonNull = definitionModule.GraphQLNonNull
local graphQLScalarType = definitionModule.GraphQLScalarType
local graphQLObjectType = definitionModule.GraphQLObjectType
local graphQLInterfaceType = definitionModule.GraphQLInterfaceType
local graphQLUnionType = definitionModule.GraphQLUnionType
local graphQLEnumType = definitionModule.GraphQLEnumType
local graphQLInputObjectType = definitionModule.GraphQLInputObjectType
local assertNullableType = definitionModule.assertNullableType
local assertObjectType = definitionModule.assertObjectType
local assertInterfaceType = definitionModule.assertInterfaceType
local _ = require(script.Parent.getIntrospectionQuery)
local valueFromAST = require(script.Parent.valueFromAST).valueFromAST

return {
	buildClientSchema = function(p1, p2)
		-- upvalues: typeKind (ref), error (ref), graphQLList (ref), graphQLNonNull (ref), assertNullableType (ref), isNillish (ref), inspect (ref), assertObjectType (ref), assertInterfaceType (ref), isNotNillish (ref), graphQLScalarType (ref), array (ref), graphQLObjectType (ref), graphQLInterfaceType (ref), graphQLUnionType (ref), graphQLEnumType (ref), keyValMap (ref), graphQLInputObjectType (ref), isOutputType (ref), isInputType (ref), valueFromAST (ref), parseValue (ref), graphQLDirective (ref), devAssert (ref), isObjectLike (ref), specifiedScalarTypes (ref), introspectionTypes (ref), nullModule (ref), graphQLSchema (ref)
		local _ = nil
		local getNamedType = nil
		local _ = nil
		local _ = nil
		local _ = nil
		local buildScalarDef = nil
		local _ = nil
		local buildObjectDef = nil
		local buildInterfaceDef = nil
		local buildUnionDef = nil
		local buildEnumDef = nil
		local buildInputObjectDef = nil
		local buildFieldDefMap = nil
		local buildField = nil
		local buildInputValueDefMap = nil
		local buildInputValue = nil
		local _ = nil
		local _ = nil
		local var1 = nil
		
		local function getType(p3)
			-- upvalues: typeKind (copy), error (copy), graphQLList (copy), getType (write), graphQLNonNull (copy), assertNullableType (copy), getNamedType (write)
			if p3.kind == typeKind.LIST then
				local ofType = p3.ofType
				
				if not ofType then
					error(error.new("Decorated type deeper than introspection query."))
				end
				return graphQLList.new(getType(ofType))
			elseif p3.kind ~= typeKind.NON_NULL then
				return getNamedType(p3)
			end
			local ofType = p3.ofType
			
			if not ofType then
				error(error.new("Decorated type deeper than introspection query."))
			end
			return graphQLNonNull.new(assertNullableType(getType(ofType)))
		end
		
		getNamedType = function(p3)
			-- upvalues: isNillish (copy), error (copy), inspect (copy), var1 (write)
			local name = p3.name
			
			if isNillish(name) then
				error(error.new(("Unknown type reference: %s."):format(inspect(p3))))
			end
			local var2 = var1:get(name)
			
			if isNillish(var2) then
				error(error.new(("Invalid or incomplete schema, unknown type: %s. Ensure that a full introspection query is used in order to build a client schema."):format(name)))
			end
			return var2
		end
		
		local function getObjectType(p3)
			-- upvalues: assertObjectType (copy), getNamedType (write)
			return assertObjectType(getNamedType(p3))
		end
		
		local function getInterfaceType(p3)
			-- upvalues: assertInterfaceType (copy), getNamedType (write)
			return assertInterfaceType(getNamedType(p3))
		end
		
		local function buildType(p3)
			-- upvalues: isNotNillish (copy), typeKind (copy), buildScalarDef (write), buildObjectDef (write), buildInterfaceDef (write), buildUnionDef (write), buildEnumDef (write), buildInputObjectDef (write), inspect (copy), error (copy)
			if isNotNillish(p3) and isNotNillish(p3.name) and isNotNillish(p3.kind) then
				if p3.kind == typeKind.SCALAR then
					return buildScalarDef(p3)
				elseif p3.kind == typeKind.OBJECT then
					return buildObjectDef(p3)
				elseif p3.kind == typeKind.INTERFACE then
					return buildInterfaceDef(p3)
				elseif p3.kind == typeKind.UNION then
					return buildUnionDef(p3)
				elseif p3.kind == typeKind.ENUM then
					return buildEnumDef(p3)
				elseif p3.kind == typeKind.INPUT_OBJECT then
					return buildInputObjectDef(p3)
				end
			end
			error(error.new(("Invalid or incomplete introspection result. Ensure that a full introspection query is used in order to build a client schema: %s."):format(inspect(p3))))
		end
		
		buildScalarDef = function(p3)
			-- upvalues: graphQLScalarType (copy)
			return graphQLScalarType.new({
				name = p3.name,
				description = p3.description,
				specifiedByUrl = p3.specifiedByUrl
			})
		end
		
		local function buildImplementationsList(p3)
			-- upvalues: typeKind (copy), inspect (copy), error (copy), array (copy), getInterfaceType (write)
			if p3.interfaces == nil and p3.kind == typeKind.INTERFACE then
				return {}
			elseif not p3.interfaces then
				error(error.new(("Introspection result missing interfaces: %s."):format(inspect(p3))))
			end
			return array.map(p3.interfaces, getInterfaceType)
		end
		
		buildObjectDef = function(p3)
			-- upvalues: graphQLObjectType (copy), buildImplementationsList (write), buildFieldDefMap (write)
			return graphQLObjectType.new({
				name = p3.name,
				description = p3.description,
				interfaces = function()
					-- upvalues: buildImplementationsList (copy), p3 (ref)
					return buildImplementationsList(p3)
				end,
				fields = function()
					-- upvalues: buildFieldDefMap (copy), p3 (ref)
					return buildFieldDefMap(p3)
				end
			})
		end
		
		buildInterfaceDef = function(p3)
			-- upvalues: graphQLInterfaceType (copy), buildImplementationsList (write), buildFieldDefMap (write)
			return graphQLInterfaceType.new({
				name = p3.name,
				description = p3.description,
				interfaces = function()
					-- upvalues: buildImplementationsList (copy), p3 (ref)
					return buildImplementationsList(p3)
				end,
				fields = function()
					-- upvalues: buildFieldDefMap (copy), p3 (ref)
					return buildFieldDefMap(p3)
				end
			})
		end
		
		buildUnionDef = function(p3)
			-- upvalues: inspect (copy), error (copy), graphQLUnionType (copy), array (copy), getObjectType (write)
			if not p3.possibleTypes then
				error(error.new(("Introspection result missing possibleTypes: %s."):format(inspect(p3))))
			end
			return graphQLUnionType.new({
				name = p3.name,
				description = p3.description,
				types = function()
					-- upvalues: array (copy), p3 (ref), getObjectType (copy)
					return array.map(p3.possibleTypes, getObjectType)
				end
			})
		end
		
		buildEnumDef = function(p3)
			-- upvalues: inspect (copy), error (copy), graphQLEnumType (copy), keyValMap (copy)
			if not p3.enumValues then
				error(error.new(("Introspection result missing enumValues: %s."):format(inspect(p3))))
			end
			return graphQLEnumType.new({
				name = p3.name,
				description = p3.description,
				values = keyValMap(p3.enumValues, function(p4)
					return p4.name
				end, function(p4)
					return {
						description = p4.description,
						deprecationReason = p4.deprecationReason
					}
				end)
			})
		end
		
		buildInputObjectDef = function(p3)
			-- upvalues: inspect (copy), error (copy), graphQLInputObjectType (copy), buildInputValueDefMap (write)
			if not p3.inputFields then
				error(error.new(("Introspection result missing inputFields: %s."):format(inspect(p3))))
			end
			return graphQLInputObjectType.new({
				name = p3.name,
				description = p3.description,
				fields = function()
					-- upvalues: buildInputValueDefMap (copy), p3 (ref)
					return buildInputValueDefMap(p3.inputFields)
				end
			})
		end
		
		buildFieldDefMap = function(p3)
			-- upvalues: error (copy), inspect (copy), keyValMap (copy), buildField (write)
			if not p3.fields then
				error(error.new(("Introspection result missing fields: %s."):format(inspect(p3))))
			end
			return keyValMap(p3.fields, function(p4)
				return p4.name
			end, buildField)
		end
		
		buildField = function(p3)
			-- upvalues: getType (write), isOutputType (copy), inspect (copy), error (copy), buildInputValueDefMap (write)
			local var2 = getType(p3.type)
			
			if not isOutputType(var2) then
				error(error.new(("Introspection must provide output type for fields, but received: %s."):format(inspect(var2))))
			end
			if not p3.args then
				error(error.new(("Introspection result missing field args: %s."):format(inspect(p3))))
			end
			return {
				description = p3.description,
				deprecationReason = p3.deprecationReason,
				type = var2,
				args = buildInputValueDefMap(p3.args)
			}
		end
		
		buildInputValueDefMap = function(p3)
			-- upvalues: keyValMap (copy), buildInputValue (write)
			return keyValMap(p3, function(p4)
				return p4.name
			end, buildInputValue)
		end
		
		buildInputValue = function(p3)
			-- upvalues: getType (write), isInputType (copy), inspect (copy), error (copy), isNotNillish (copy), valueFromAST (copy), parseValue (copy)
			local var2 = getType(p3.type)
			
			if not isInputType(var2) then
				error(error.new(("Introspection must provide input type for arguments, but received: %s."):format(inspect(var2))))
			end
			return {
				description = p3.description,
				type = var2,
				defaultValue = if isNotNillish(p3.defaultValue) then valueFromAST(parseValue(p3.defaultValue), var2) else nil,
				deprecationReason = p3.deprecationReason
			}
		end
		
		local function buildDirective(p3)
			-- upvalues: inspect (copy), error (copy), graphQLDirective (copy), array (copy), buildInputValueDefMap (write)
			if not p3.args then
				error(error.new(("Introspection result missing directive args: %s."):format(inspect(p3))))
			end
			if not p3.locations then
				error(error.new(("Introspection result missing directive locations: %s."):format(inspect(p3))))
			end
			return graphQLDirective.new({
				name = p3.name,
				description = p3.description,
				isRepeatable = p3.isRepeatable,
				locations = array.slice(p3.locations),
				args = buildInputValueDefMap(p3.args)
			})
		end
		
		devAssert(isObjectLike(p1) and isObjectLike(p1.__schema), ("Invalid or incomplete introspection result. Ensure that you are passing \"data\" property of introspection response and no \"errors\" was returned alongside: %s."):format(inspect(p1)))
		local schema = p1.__schema
		var1 = keyValMap(schema.types, function(p3)
			return p3.name
		end, function(p3)
			-- upvalues: buildType (write)
			return buildType(p3)
		end)
		
		for i, v in ipairs(array.concat(specifiedScalarTypes, introspectionTypes)) do
			if var1:get(v.name) then
				var1:set(v.name, v)
			end
		end
		return graphQLSchema.new({
			description = schema.description,
			query = if isNotNillish(schema.queryType) then getObjectType(schema.queryType) else nullModule,
			mutation = if isNotNillish(schema.mutationType) then getObjectType(schema.mutationType) else nullModule,
			subscription = if isNotNillish(schema.subscriptionType) then getObjectType(schema.subscriptionType) else nullModule,
			types = var1:values(),
			directives = if isNotNillish(schema.directives) then array.map(schema.directives, buildDirective) else {},
			assumeValid = if p2 then p2.assumeValid else nil
		})
	end
}