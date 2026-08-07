-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:37 2026 Pacific Standard Time.

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
	buildClientSchema = function(p0, p1) --[[ line: 100 ]]
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
		local var16 = nil
		
		local function getType(p2) --[[ line: 132 ]]
			-- upvalues: typeKind (copy), error (copy), graphQLList (copy), getType (write), graphQLNonNull (copy), assertNullableType (copy), getNamedType (write)
			if p2.kind == typeKind.LIST then
				local ofType = p2.ofType
				
				if not ofType then
					error(error.new("Decorated type deeper than introspection query."))
				end
				return graphQLList.new(getType(ofType))
			elseif p2.kind ~= typeKind.NON_NULL then
				return getNamedType(p2)
			end
			local ofType = p2.ofType
			
			if not ofType then
				error(error.new("Decorated type deeper than introspection query."))
			end
			return graphQLNonNull.new(assertNullableType(getType(ofType)))
		end
		
		getNamedType = function(p3) --[[ line: 155 | named "getNamedType" ]]
			-- upvalues: isNillish (copy), error (copy), inspect (copy), var16 (write)
			local name = p3.name
			
			if isNillish(name) then
				error(error.new(("Unknown type reference: %s."):format(inspect(p3))))
			end
			local var23 = var16:get(name)
			
			if isNillish(var23) then
				error(error.new(("Invalid or incomplete schema, unknown type: %s. Ensure that a full introspection query is used in order to build a client schema."):format(name)))
			end
			return var23
		end
		
		local function getObjectType(p4) --[[ line: 176 ]]
			-- upvalues: assertObjectType (copy), getNamedType (write)
			return assertObjectType(getNamedType(p4))
		end
		
		local function getInterfaceType(p5) --[[ line: 182 ]]
			-- upvalues: assertInterfaceType (copy), getNamedType (write)
			return assertInterfaceType(getNamedType(p5))
		end
		
		local function buildType(p6) --[[ line: 190 ]]
			-- upvalues: isNotNillish (copy), typeKind (copy), buildScalarDef (write), buildObjectDef (write), buildInterfaceDef (write), buildUnionDef (write), buildEnumDef (write), buildInputObjectDef (write), inspect (copy), error (copy)
			if isNotNillish(p6) and isNotNillish(p6.name) and isNotNillish(p6.kind) then
				if p6.kind == typeKind.SCALAR then
					return buildScalarDef(p6)
				elseif p6.kind == typeKind.OBJECT then
					return buildObjectDef(p6)
				elseif p6.kind == typeKind.INTERFACE then
					return buildInterfaceDef(p6)
				elseif p6.kind == typeKind.UNION then
					return buildUnionDef(p6)
				elseif p6.kind == typeKind.ENUM then
					return buildEnumDef(p6)
				elseif p6.kind == typeKind.INPUT_OBJECT then
					return buildInputObjectDef(p6)
				end
			end
			error(error.new(("Invalid or incomplete introspection result. Ensure that a full introspection query is used in order to build a client schema: %s."):format(inspect(p6))))
		end
		
		buildScalarDef = function(p7) --[[ line: 217 | named "buildScalarDef" ]]
			-- upvalues: graphQLScalarType (copy)
			return graphQLScalarType.new({
				name = p7.name,
				description = p7.description,
				specifiedByUrl = p7.specifiedByUrl
			})
		end
		
		local function buildImplementationsList(p8) --[[ line: 225 ]]
			-- upvalues: typeKind (copy), inspect (copy), error (copy), array (copy), getInterfaceType (write)
			if p8.interfaces == nil and p8.kind == typeKind.INTERFACE then
				return {}
			elseif not p8.interfaces then
				error(error.new(("Introspection result missing interfaces: %s."):format(inspect(p8))))
			end
			return array.map(p8.interfaces, getInterfaceType)
		end
		
		buildObjectDef = function(p9) --[[ line: 251 | named "buildObjectDef" ]]
			-- upvalues: graphQLObjectType (copy), buildImplementationsList (write), buildFieldDefMap (write)
			return graphQLObjectType.new({
				name = p9.name,
				description = p9.description,
				interfaces = function() --[[ line: 255 ]]
					-- upvalues: buildImplementationsList (copy), p9 (ref)
					return buildImplementationsList(p9)
				end,
				fields = function() --[[ line: 258 ]]
					-- upvalues: buildFieldDefMap (copy), p9 (ref)
					return buildFieldDefMap(p9)
				end
			})
		end
		
		buildInterfaceDef = function(p10) --[[ line: 264 | named "buildInterfaceDef" ]]
			-- upvalues: graphQLInterfaceType (copy), buildImplementationsList (write), buildFieldDefMap (write)
			return graphQLInterfaceType.new({
				name = p10.name,
				description = p10.description,
				interfaces = function() --[[ line: 270 ]]
					-- upvalues: buildImplementationsList (copy), p10 (ref)
					return buildImplementationsList(p10)
				end,
				fields = function() --[[ line: 273 ]]
					-- upvalues: buildFieldDefMap (copy), p10 (ref)
					return buildFieldDefMap(p10)
				end
			})
		end
		
		buildUnionDef = function(p11) --[[ line: 279 | named "buildUnionDef" ]]
			-- upvalues: inspect (copy), error (copy), graphQLUnionType (copy), array (copy), getObjectType (write)
			if not p11.possibleTypes then
				error(error.new(("Introspection result missing possibleTypes: %s."):format(inspect(p11))))
			end
			return graphQLUnionType.new({
				name = p11.name,
				description = p11.description,
				types = function() --[[ line: 294 ]]
					-- upvalues: array (copy), p11 (ref), getObjectType (copy)
					return array.map(p11.possibleTypes, getObjectType)
				end
			})
		end
		
		buildEnumDef = function(p12) --[[ line: 300 | named "buildEnumDef" ]]
			-- upvalues: inspect (copy), error (copy), graphQLEnumType (copy), keyValMap (copy)
			if not p12.enumValues then
				error(error.new(("Introspection result missing enumValues: %s."):format(inspect(p12))))
			end
			return graphQLEnumType.new({
				name = p12.name,
				description = p12.description,
				values = keyValMap(p12.enumValues, function(p13) --[[ line: 312 ]]
					return p13.name
				end, function(p14) --[[ line: 314 ]]
					return {
						description = p14.description,
						deprecationReason = p14.deprecationReason
					}
				end)
			})
		end
		
		buildInputObjectDef = function(p15) --[[ line: 324 | named "buildInputObjectDef" ]]
			-- upvalues: inspect (copy), error (copy), graphQLInputObjectType (copy), buildInputValueDefMap (write)
			if not p15.inputFields then
				error(error.new(("Introspection result missing inputFields: %s."):format(inspect(p15))))
			end
			return graphQLInputObjectType.new({
				name = p15.name,
				description = p15.description,
				fields = function() --[[ line: 340 ]]
					-- upvalues: buildInputValueDefMap (copy), p15 (ref)
					return buildInputValueDefMap(p15.inputFields)
				end
			})
		end
		
		buildFieldDefMap = function(p16) --[[ line: 346 | named "buildFieldDefMap" ]]
			-- upvalues: error (copy), inspect (copy), keyValMap (copy), buildField (write)
			if not p16.fields then
				error(error.new(("Introspection result missing fields: %s."):format(inspect(p16))))
			end
			return keyValMap(p16.fields, function(p17) --[[ line: 358 ]]
				return p17.name
			end, buildField)
		end
		
		buildField = function(p18) --[[ line: 363 | named "buildField" ]]
			-- upvalues: getType (write), isOutputType (copy), inspect (copy), error (copy), buildInputValueDefMap (write)
			local var24 = getType(p18.type)
			
			if not isOutputType(var24) then
				error(error.new(("Introspection must provide output type for fields, but received: %s."):format(inspect(var24))))
			end
			if not p18.args then
				error(error.new(("Introspection result missing field args: %s."):format(inspect(p18))))
			end
			return {
				description = p18.description,
				deprecationReason = p18.deprecationReason,
				type = var24,
				args = buildInputValueDefMap(p18.args)
			}
		end
		
		buildInputValueDefMap = function(p19) --[[ line: 394 | named "buildInputValueDefMap" ]]
			-- upvalues: keyValMap (copy), buildInputValue (write)
			return keyValMap(p19, function(p20) --[[ line: 395 ]]
				return p20.name
			end, buildInputValue)
		end
		
		buildInputValue = function(p21) --[[ line: 400 | named "buildInputValue" ]]
			-- upvalues: getType (write), isInputType (copy), inspect (copy), error (copy), isNotNillish (copy), valueFromAST (copy), parseValue (copy)
			local var25 = getType(p21.type)
			
			if not isInputType(var25) then
				error(error.new(("Introspection must provide input type for arguments, but received: %s."):format(inspect(var25))))
			end
			return {
				description = p21.description,
				type = var25,
				defaultValue = if isNotNillish(p21.defaultValue) then valueFromAST(parseValue(p21.defaultValue), var25) else nil,
				deprecationReason = p21.deprecationReason
			}
		end
		
		local function buildDirective(p22) --[[ line: 429 ]]
			-- upvalues: inspect (copy), error (copy), graphQLDirective (copy), array (copy), buildInputValueDefMap (write)
			if not p22.args then
				error(error.new(("Introspection result missing directive args: %s."):format(inspect(p22))))
			end
			if not p22.locations then
				error(error.new(("Introspection result missing directive locations: %s."):format(inspect(p22))))
			end
			return graphQLDirective.new({
				name = p22.name,
				description = p22.description,
				isRepeatable = p22.isRepeatable,
				locations = array.slice(p22.locations),
				args = buildInputValueDefMap(p22.args)
			})
		end
		
		devAssert(isObjectLike(p0) and isObjectLike(p0.__schema), ("Invalid or incomplete introspection result. Ensure that you are passing \"data\" property of introspection response and no \"errors\" was returned alongside: %s."):format(inspect(p0)))
		local schema = p0.__schema
		var16 = keyValMap(schema.types, function(p23) --[[ line: 471 ]]
			return p23.name
		end, function(p24) --[[ line: 473 ]]
			-- upvalues: buildType (write)
			return buildType(p24)
		end)
		
		for i, v in ipairs(array.concat(specifiedScalarTypes, introspectionTypes)) do
			if var16:get(v.name) then
				var16:set(v.name, v)
			end
		end
		return graphQLSchema.new({
			description = schema.description,
			query = if isNotNillish(schema.queryType) then getObjectType(schema.queryType) else nullModule,
			mutation = if isNotNillish(schema.mutationType) then getObjectType(schema.mutationType) else nullModule,
			subscription = if isNotNillish(schema.subscriptionType) then getObjectType(schema.subscriptionType) else nullModule,
			types = var16:values(),
			directives = if isNotNillish(schema.directives) then array.map(schema.directives, buildDirective) else {},
			assumeValid = if p1 then p1.assumeValid else nil
		})
	end
}