local Parent = script.Parent.Parent
local LuauPolyfillModule = require(Parent.LuauPolyfill)
local Array = LuauPolyfillModule.Array
local Error1 = LuauPolyfillModule.Error
local Object = LuauPolyfillModule.Object
local Console = LuauPolyfillModule.console
local GraphQLModule = require(Parent.GraphQL)
local GraphQLDirective = GraphQLModule.GraphQLDirective
local GraphQLEnumType = GraphQLModule.GraphQLEnumType
local GraphQLInputObjectType = GraphQLModule.GraphQLInputObjectType
local GraphQLInterfaceType = GraphQLModule.GraphQLInterfaceType
local GraphQLList = GraphQLModule.GraphQLList
local GraphQLObjectType = GraphQLModule.GraphQLObjectType
local GraphQLNonNull = GraphQLModule.GraphQLNonNull
local GraphQLScalarType = GraphQLModule.GraphQLScalarType
local GraphQLUnionType = GraphQLModule.GraphQLUnionType
local IsInterfaceTypeFunction = GraphQLModule.isInterfaceType
local IsEnumTypeFunction = GraphQLModule.isEnumType
local IsInputObjectTypeFunction = GraphQLModule.isInputObjectType
local IsListTypeFunction = GraphQLModule.isListType
local IsNamedTypeFunction = GraphQLModule.isNamedType
local IsNonNullTypeFunction = GraphQLModule.isNonNullType
local IsObjectTypeFunction = GraphQLModule.isObjectType
local IsScalarTypeFunction = GraphQLModule.isScalarType
local IsUnionTypeFunction = GraphQLModule.isUnionType
local IsSpecifiedScalarTypeFunction = GraphQLModule.isSpecifiedScalarType
local IsSpecifiedDirectiveFunction = GraphQLModule.isSpecifiedDirective
local StubModule = require(script.Parent.stub)
local GetBuiltInForStubFunction = StubModule.getBuiltInForStub
local IsNamedStubFunction = StubModule.isNamedStub
local Map = LuauPolyfillModule.Map
local String = LuauPolyfillModule.String

return {
	rewireTypes = function(List, p1)
		-- upvalues: IsSpecifiedDirectiveFunction (copy), GraphQLDirective (copy), Map (copy), IsObjectTypeFunction (copy), Object (copy), GraphQLObjectType (copy), IsInterfaceTypeFunction (copy), Array (copy), GraphQLInterfaceType (copy), IsUnionTypeFunction (copy), GraphQLUnionType (copy), IsInputObjectTypeFunction (copy), GraphQLInputObjectType (copy), IsEnumTypeFunction (copy), GraphQLEnumType (copy), IsScalarTypeFunction (copy), IsSpecifiedScalarTypeFunction (copy), GraphQLScalarType (copy), Error1 (copy), IsListTypeFunction (copy), GraphQLList (copy), IsNonNullTypeFunction (copy), GraphQLNonNull (copy), IsNamedTypeFunction (copy), IsNamedStubFunction (copy), GetBuiltInForStubFunction (copy), String (copy), Console (copy)
		local NewResult = nil
		local NewResult1 = nil
		local rewireDirective = nil
		local Callback = nil
		local rewireNamedType = nil
		local Callback2 = nil
		local Callback4 = nil
		local Callback3 = nil
		local Callback1 = nil
		
		rewireDirective = function(p2)
			-- upvalues: IsSpecifiedDirectiveFunction (upval), Callback (ref), GraphQLDirective (upval)
			if IsSpecifiedDirectiveFunction(p2) then
				return p2
			else
				local Config = p2:toConfig()
				Config.args = Callback(Config.args)
				
				return GraphQLDirective.new(Config)
			end
		end
		
		Callback = function(Args)
			-- upvalues: Map (upval), Callback1 (ref)
			local NewMap = Map.new()
			
			for _, arg in Args do
				local v1 = arg[1]
				local GetResult = Args:get(v1)
				local CallbackResult = Callback1(GetResult.type)
				
				if CallbackResult ~= nil then
					GetResult.type = CallbackResult
					NewMap:set(v1, GetResult)
				end
			end
			return NewMap
		end
		
		rewireNamedType = function(GetResult)
			-- upvalues: IsObjectTypeFunction (upval), Object (upval), Callback2 (ref), Callback3 (ref), GraphQLObjectType (upval), IsInterfaceTypeFunction (upval), Array (upval), GraphQLInterfaceType (upval), IsUnionTypeFunction (upval), GraphQLUnionType (upval), IsInputObjectTypeFunction (upval), Callback4 (ref), GraphQLInputObjectType (upval), IsEnumTypeFunction (upval), GraphQLEnumType (upval), IsScalarTypeFunction (upval), IsSpecifiedScalarTypeFunction (upval), GraphQLScalarType (upval), Error1 (upval)
			if IsObjectTypeFunction(GetResult) then
				local Config = GetResult:toConfig()
				
				return GraphQLObjectType.new((Object.assign({}, Config, {
					fields = function()
						-- upvalues: Callback2 (upval), Config (copy)
						return Callback2(Config.fields)
					end,
					interfaces = function()
						-- upvalues: Callback3 (upval), Config (copy)
						return Callback3(Config.interfaces)
					end
				})))
			end
			if IsInterfaceTypeFunction(GetResult) then
				local Config1 = GetResult:toConfig()
				local AssignResult = Object.assign({}, Config1, {
					fields = function()
						-- upvalues: Callback2 (upval), Config1 (copy)
						return Callback2(Config1.fields)
					end
				})
				
				if Array.indexOf(Object.keys(AssignResult), "interfaces") ~= -1 then
					function AssignResult:interfaces()
						-- upvalues: Callback3 (upval), Config1 (copy)
						return Callback3(Config1.interfaces)
					end
				end
				return GraphQLInterfaceType.new(AssignResult)
			else
				if IsUnionTypeFunction(GetResult) then
					local Config2 = GetResult:toConfig()
					
					return GraphQLUnionType.new((Object.assign({}, Config2, {
						types = function()
							-- upvalues: Callback3 (upval), Config2 (copy)
							return Callback3(Config2.types)
						end
					})))
				end
				if IsInputObjectTypeFunction(GetResult) then
					local Config3 = GetResult:toConfig()
					
					return GraphQLInputObjectType.new((Object.assign({}, Config3, {
						fields = function()
							-- upvalues: Callback4 (upval), Config3 (copy)
							return Callback4(Config3.fields)
						end
					})))
				end
				if IsEnumTypeFunction(GetResult) then
					return GraphQLEnumType.new((GetResult:toConfig()))
				end
				if not IsScalarTypeFunction(GetResult) then
					error(Error1.new(("Unexpected schema type: %s"):format((tostring(GetResult)))))
					
					return
				end
				if IsSpecifiedScalarTypeFunction(GetResult) then
					return GetResult
				end
				local Config4 = GetResult:toConfig()
				local SerializeFunction = Config4.serialize
				local ParseValueFunction = Config4.parseValue
				local ParseLiteralFunction = Config4.parseLiteral
				
				if SerializeFunction then
					function Config4.serialize(...)
						-- upvalues: SerializeFunction (copy), Config4 (copy)
						return SerializeFunction(Config4, ...)
					end
				end
				if ParseValueFunction then
					function Config4.parseValue(...)
						-- upvalues: ParseValueFunction (copy), Config4 (copy)
						return ParseValueFunction(Config4, ...)
					end
				end
				if ParseLiteralFunction then
					function Config4.parseLiteral(...)
						-- upvalues: ParseLiteralFunction (copy), Config4 (copy)
						return ParseLiteralFunction(Config4, ...)
					end
				end
				return GraphQLScalarType.new(Config4)
			end
		end
		
		Callback2 = function(Fields)
			-- upvalues: Map (upval), Callback1 (ref), Callback (ref)
			local NewMap = Map.new()
			
			for _, field in Fields do
				local v2 = field[1]
				local GetResult = Fields:get(v2)
				local CallbackResult = Callback1(GetResult.type)
				
				if CallbackResult ~= nil and GetResult.args then
					GetResult.type = CallbackResult
					GetResult.args = Callback(GetResult.args)
					NewMap:set(v2, GetResult)
				end
			end
			return NewMap
		end
		
		Callback4 = function(Fields)
			-- upvalues: Map (upval), Callback1 (ref)
			local NewMap = Map.new()
			
			for _, field in Fields do
				local v3 = field[1]
				local GetResult = Fields:get(v3)
				local CallbackResult = Callback1(GetResult.type)
				
				if CallbackResult ~= nil then
					GetResult.type = CallbackResult
					NewMap:set(v3, GetResult)
				end
			end
			return NewMap
		end
		
		Callback3 = function(Interfaces)
			-- upvalues: Callback1 (ref), Object (upval)
			local List = {}
			
			for _, interface in Interfaces do
				local CallbackResult = Callback1(interface)
				
				if CallbackResult ~= nil and CallbackResult ~= Object.None then
					table.insert(List, CallbackResult)
				end
			end
			return List
		end
		
		Callback1 = function(Type)
			-- upvalues: IsListTypeFunction (upval), Callback1 (ref), Object (upval), GraphQLList (upval), IsNonNullTypeFunction (upval), GraphQLNonNull (upval), IsNamedTypeFunction (upval), NewResult (ref), IsNamedStubFunction (upval), GetBuiltInForStubFunction (upval), rewireNamedType (ref), NewResult1 (ref)
			if IsListTypeFunction(Type) then
				local CallbackResult = Callback1(Type.ofType)
				
				return if CallbackResult == nil or CallbackResult == Object.None then nil else GraphQLList.new(CallbackResult)
			end
			if IsNonNullTypeFunction(Type) then
				local CallbackResult = Callback1(Type.ofType)
				
				return if CallbackResult == nil or CallbackResult == Object.None then nil else GraphQLNonNull.new(CallbackResult)
			end
			if not IsNamedTypeFunction(Type) then
				return nil
			end
			local GetResult = NewResult:get(Type.name)
			
			if GetResult == nil then
				GetResult = if IsNamedStubFunction(Type) then GetBuiltInForStubFunction(Type) else rewireNamedType(Type)
				NewResult:set(Type.name, GetResult)
				NewResult1:set(GetResult.name, (NewResult:get(Type.name)))
			end
			return if GetResult == nil or GetResult == Object.None then nil else NewResult1:get(GetResult.name)
		end
		
		NewResult = Map.new()
		
		for _, value in List do
			local v4 = value[1]
			NewResult:set(v4, (List:get(v4)))
		end
		NewResult1 = Map.new()
		
		for _, value1 in NewResult do
			local v5 = value1[1]
			local GetResult = NewResult:get(v5)
			local NoGetResult = GetResult == nil or GetResult == Object.None or String.startsWith(v5, "__")
			local Name = nil
			
			if not NoGetResult then
				Name = GetResult.name
				NoGetResult = String.startsWith(Name, "__")
			end
			if not NoGetResult then
				if NewResult1:get(Name) == nil then
					NewResult1:set(Name, GetResult)
				else
					Console.warn(("Duplicate schema type name %s found; keeping the existing one found in the schema"):format((tostring(Name))))
				end
			end
		end
		for _, value2 in NewResult1 do
			local v6 = value2[1]
			NewResult1:set(v6, rewireNamedType(NewResult1:get(v6)))
		end
		return {
			typeMap = NewResult1,
			directives = Array.map(p1, function(p2)
				-- upvalues: rewireDirective (ref)
				return rewireDirective(p2)
			end)
		}
	end
}