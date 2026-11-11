local Parent = script.Parent.Parent
local LuaUtils = Parent.luaUtils
local LuauPolyfillModule = require(Parent.Parent.LuauPolyfill)
local Array = LuauPolyfillModule.Array
local Error1 = LuauPolyfillModule.Error
local NullModule = require(LuaUtils.null)
local IsNillishModule = require(LuaUtils.isNillish)
local IsNillishFunction = IsNillishModule.isNillish
local IsNotNillishFunction = IsNillishModule.isNotNillish
local InspectFunction = require(Parent.jsutils.inspect).inspect
local DevAssertFunction = require(Parent.jsutils.devAssert).devAssert
local KeyValMapFunction = require(Parent.jsutils.keyValMap).keyValMap
local IsObjectLikeFunction = require(Parent.jsutils.isObjectLike).isObjectLike
local ParseValueFunction = require(Parent.language.parser).parseValue
local DefinitionModule = require(Parent.type.definition)
local GraphQLSchema = require(Parent.type.schema).GraphQLSchema
local GraphQLDirective = require(Parent.type.directives).GraphQLDirective
local SpecifiedScalarTypes = require(Parent.type.scalars).specifiedScalarTypes
local IntrospectionModule = require(Parent.type.introspection)
local IntrospectionTypes = IntrospectionModule.introspectionTypes
local TypeKind = IntrospectionModule.TypeKind
local IsInputTypeFunction = DefinitionModule.isInputType
local IsOutputTypeFunction = DefinitionModule.isOutputType
local GraphQLList = DefinitionModule.GraphQLList
local GraphQLNonNull = DefinitionModule.GraphQLNonNull
local GraphQLScalarType = DefinitionModule.GraphQLScalarType
local GraphQLObjectType = DefinitionModule.GraphQLObjectType
local GraphQLInterfaceType = DefinitionModule.GraphQLInterfaceType
local GraphQLUnionType = DefinitionModule.GraphQLUnionType
local GraphQLEnumType = DefinitionModule.GraphQLEnumType
local GraphQLInputObjectType = DefinitionModule.GraphQLInputObjectType
local AssertNullableTypeFunction = DefinitionModule.assertNullableType
local AssertObjectTypeFunction = DefinitionModule.assertObjectType
local AssertInterfaceTypeFunction = DefinitionModule.assertInterfaceType
local _ = require(script.Parent.getIntrospectionQuery)
local ValueFromASTFunction = require(script.Parent.valueFromAST).valueFromAST

return {
	buildClientSchema = function(p1, p2)
		-- upvalues: TypeKind (copy), Error1 (copy), GraphQLList (copy), GraphQLNonNull (copy), AssertNullableTypeFunction (copy), IsNillishFunction (copy), InspectFunction (copy), AssertObjectTypeFunction (copy), AssertInterfaceTypeFunction (copy), IsNotNillishFunction (copy), GraphQLScalarType (copy), Array (copy), GraphQLObjectType (copy), GraphQLInterfaceType (copy), GraphQLUnionType (copy), GraphQLEnumType (copy), KeyValMapFunction (copy), GraphQLInputObjectType (copy), IsOutputTypeFunction (copy), IsInputTypeFunction (copy), ValueFromASTFunction (copy), ParseValueFunction (copy), GraphQLDirective (copy), DevAssertFunction (copy), IsObjectLikeFunction (copy), SpecifiedScalarTypes (copy), IntrospectionTypes (copy), NullModule (copy), GraphQLSchema (copy)
		local _ = nil
		local Callback = nil
		local getObjectType = nil
		local getInterfaceType = nil
		local buildType = nil
		local Callback3 = nil
		local buildImplementationsList = nil
		local Callback4 = nil
		local Callback5 = nil
		local Callback1 = nil
		local Callback6 = nil
		local Callback7 = nil
		local Callback8 = nil
		local BuildField = nil
		local Callback2 = nil
		local BuildInputValue = nil
		local v1 = nil
		
		local function getType(OfType)
			-- upvalues: TypeKind (upval), Error1 (upval), GraphQLList (upval), getType (ref), GraphQLNonNull (upval), AssertNullableTypeFunction (upval), Callback (ref)
			if OfType.kind == TypeKind.LIST then
				local OfType1 = OfType.ofType
				
				if not OfType1 then
					error(Error1.new("Decorated type deeper than introspection query."))
				end
				return GraphQLList.new(getType(OfType1))
			else
				if OfType.kind ~= TypeKind.NON_NULL then
					return Callback(OfType)
				end
				local OfType2 = OfType.ofType
				
				if not OfType2 then
					error(Error1.new("Decorated type deeper than introspection query."))
				end
				return GraphQLNonNull.new(AssertNullableTypeFunction((getType(OfType2))))
			end
		end
		
		Callback = function(p3)
			-- upvalues: IsNillishFunction (upval), Error1 (upval), InspectFunction (upval), v1 (ref)
			local Name = p3.name
			
			if IsNillishFunction(Name) then
				error(Error1.new(("Unknown type reference: %s."):format(InspectFunction(p3))))
			end
			local GetResult = v1:get(Name)
			
			if IsNillishFunction(GetResult) then
				error(Error1.new(("Invalid or incomplete schema, unknown type: %s. Ensure that a full introspection query is used in order to build a client schema."):format(Name)))
			end
			return GetResult
		end
		
		getObjectType = function(MutationType)
			-- upvalues: AssertObjectTypeFunction (upval), Callback (ref)
			return AssertObjectTypeFunction(Callback(MutationType))
		end
		
		getInterfaceType = function(p3)
			-- upvalues: AssertInterfaceTypeFunction (upval), Callback (ref)
			return AssertInterfaceTypeFunction(Callback(p3))
		end
		
		buildType = function(p3)
			-- upvalues: IsNotNillishFunction (upval), TypeKind (upval), Callback3 (ref), Callback4 (ref), Callback5 (ref), Callback1 (ref), Callback6 (ref), Callback7 (ref), InspectFunction (upval), Error1 (upval)
			if IsNotNillishFunction(p3) and IsNotNillishFunction(p3.name) and IsNotNillishFunction(p3.kind) then
				if p3.kind == TypeKind.SCALAR then
					return Callback3(p3)
				elseif p3.kind == TypeKind.OBJECT then
					return Callback4(p3)
				elseif p3.kind == TypeKind.INTERFACE then
					return Callback5(p3)
				elseif p3.kind == TypeKind.UNION then
					return Callback1(p3)
				elseif p3.kind == TypeKind.ENUM then
					return Callback6(p3)
				elseif p3.kind == TypeKind.INPUT_OBJECT then
					return Callback7(p3)
				end
			end
			error(Error1.new(("Invalid or incomplete introspection result. Ensure that a full introspection query is used in order to build a client schema: %s."):format((InspectFunction(p3)))))
		end
		
		Callback3 = function(p3)
			-- upvalues: GraphQLScalarType (upval)
			return GraphQLScalarType.new({
				name = p3.name,
				description = p3.description,
				specifiedByUrl = p3.specifiedByUrl
			})
		end
		
		buildImplementationsList = function(p3)
			-- upvalues: TypeKind (upval), InspectFunction (upval), Error1 (upval), Array (upval), getInterfaceType (ref)
			if p3.interfaces == nil and p3.kind == TypeKind.INTERFACE then
				return {}
			end
			if not p3.interfaces then
				error(Error1.new(("Introspection result missing interfaces: %s."):format((InspectFunction(p3)))))
			end
			return Array.map(p3.interfaces, getInterfaceType)
		end
		
		Callback4 = function(p3)
			-- upvalues: GraphQLObjectType (upval), buildImplementationsList (ref), Callback8 (ref)
			return GraphQLObjectType.new({
				name = p3.name,
				description = p3.description,
				interfaces = function()
					-- upvalues: buildImplementationsList (upval), p3 (copy)
					return buildImplementationsList(p3)
				end,
				fields = function()
					-- upvalues: Callback8 (upval), p3 (copy)
					return Callback8(p3)
				end
			})
		end
		
		Callback5 = function(p3)
			-- upvalues: GraphQLInterfaceType (upval), buildImplementationsList (ref), Callback8 (ref)
			return GraphQLInterfaceType.new({
				name = p3.name,
				description = p3.description,
				interfaces = function()
					-- upvalues: buildImplementationsList (upval), p3 (copy)
					return buildImplementationsList(p3)
				end,
				fields = function()
					-- upvalues: Callback8 (upval), p3 (copy)
					return Callback8(p3)
				end
			})
		end
		
		Callback1 = function(p3)
			-- upvalues: InspectFunction (upval), Error1 (upval), GraphQLUnionType (upval), Array (upval), getObjectType (ref)
			if not p3.possibleTypes then
				error(Error1.new(("Introspection result missing possibleTypes: %s."):format((InspectFunction(p3)))))
			end
			return GraphQLUnionType.new({
				name = p3.name,
				description = p3.description,
				types = function()
					-- upvalues: Array (upval), p3 (copy), getObjectType (upval)
					return Array.map(p3.possibleTypes, getObjectType)
				end
			})
		end
		
		Callback6 = function(p3)
			-- upvalues: InspectFunction (upval), Error1 (upval), GraphQLEnumType (upval), KeyValMapFunction (upval)
			if not p3.enumValues then
				error(Error1.new(("Introspection result missing enumValues: %s."):format((InspectFunction(p3)))))
			end
			return GraphQLEnumType.new({
				name = p3.name,
				description = p3.description,
				values = KeyValMapFunction(p3.enumValues, function(p4)
					return p4.name
				end, function(Field)
					return {
						description = Field.description,
						deprecationReason = Field.deprecationReason
					}
				end)
			})
		end
		
		Callback7 = function(p3)
			-- upvalues: InspectFunction (upval), Error1 (upval), GraphQLInputObjectType (upval), Callback2 (ref)
			if not p3.inputFields then
				error(Error1.new(("Introspection result missing inputFields: %s."):format((InspectFunction(p3)))))
			end
			return GraphQLInputObjectType.new({
				name = p3.name,
				description = p3.description,
				fields = function()
					-- upvalues: Callback2 (upval), p3 (copy)
					return Callback2(p3.inputFields)
				end
			})
		end
		
		Callback8 = function(p3)
			-- upvalues: Error1 (upval), InspectFunction (upval), KeyValMapFunction (upval), BuildField (ref)
			if not p3.fields then
				error(Error1.new(("Introspection result missing fields: %s."):format(InspectFunction(p3))))
			end
			return KeyValMapFunction(p3.fields, function(p4)
				return p4.name
			end, BuildField)
		end
		
		BuildField = function(Field)
			-- upvalues: getType (ref), IsOutputTypeFunction (upval), InspectFunction (upval), Error1 (upval), Callback2 (ref)
			local Type = getType(Field.type)
			
			if not IsOutputTypeFunction(Type) then
				error(Error1.new(("Introspection must provide output type for fields, but received: %s."):format((InspectFunction(Type)))))
			end
			if not Field.args then
				error(Error1.new(("Introspection result missing field args: %s."):format((InspectFunction(Field)))))
			end
			return {
				description = Field.description,
				deprecationReason = Field.deprecationReason,
				type = Type,
				args = Callback2(Field.args)
			}
		end
		
		Callback2 = function(Args)
			-- upvalues: KeyValMapFunction (upval), BuildInputValue (ref)
			return KeyValMapFunction(Args, function(p3)
				return p3.name
			end, BuildInputValue)
		end
		
		BuildInputValue = function(InputValue)
			-- upvalues: getType (ref), IsInputTypeFunction (upval), InspectFunction (upval), Error1 (upval), IsNotNillishFunction (upval), ValueFromASTFunction (upval), ParseValueFunction (upval)
			local Type = getType(InputValue.type)
			
			if not IsInputTypeFunction(Type) then
				error(Error1.new(("Introspection must provide input type for arguments, but received: %s."):format((InspectFunction(Type)))))
			end
			return {
				description = InputValue.description,
				type = Type,
				defaultValue = if IsNotNillishFunction(InputValue.defaultValue) then ValueFromASTFunction(ParseValueFunction(InputValue.defaultValue), Type) else nil,
				deprecationReason = InputValue.deprecationReason
			}
		end
		
		local function buildDirective(p3)
			-- upvalues: InspectFunction (upval), Error1 (upval), GraphQLDirective (upval), Array (upval), Callback2 (ref)
			if not p3.args then
				error(Error1.new(("Introspection result missing directive args: %s."):format((InspectFunction(p3)))))
			end
			if not p3.locations then
				error(Error1.new(("Introspection result missing directive locations: %s."):format((InspectFunction(p3)))))
			end
			return GraphQLDirective.new({
				name = p3.name,
				description = p3.description,
				isRepeatable = p3.isRepeatable,
				locations = Array.slice(p3.locations),
				args = Callback2(p3.args)
			})
		end
		
		DevAssertFunction(IsObjectLikeFunction(p1) and IsObjectLikeFunction(p1.__schema), ("Invalid or incomplete introspection result. Ensure that you are passing \"data\" property of introspection response and no \"errors\" was returned alongside: %s."):format(InspectFunction(p1)))
		local Schema = p1.__schema
		v1 = KeyValMapFunction(Schema.types, function(p3)
			return p3.name
		end, function(p3)
			-- upvalues: buildType (ref)
			return buildType(p3)
		end)
		
		for _, value in ipairs(Array.concat(SpecifiedScalarTypes, IntrospectionTypes)) do
			if v1:get(value.name) then
				v1:set(value.name, value)
			end
		end
		return GraphQLSchema.new({
			description = Schema.description,
			query = if IsNotNillishFunction(Schema.queryType) then getObjectType(Schema.queryType) else NullModule,
			mutation = if IsNotNillishFunction(Schema.mutationType) then getObjectType(Schema.mutationType) else NullModule,
			subscription = if IsNotNillishFunction(Schema.subscriptionType) then getObjectType(Schema.subscriptionType) else NullModule,
			types = v1:values(),
			directives = if IsNotNillishFunction(Schema.directives) then Array.map(Schema.directives, buildDirective) else {},
			assumeValid = if p2 then p2.assumeValid else nil
		})
	end
}