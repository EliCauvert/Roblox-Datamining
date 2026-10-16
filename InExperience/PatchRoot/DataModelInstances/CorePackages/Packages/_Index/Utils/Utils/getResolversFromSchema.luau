local Parent = script.Parent.Parent
local LuauPolyfillModule = require(Parent.LuauPolyfill)
local Boolean = LuauPolyfillModule.Boolean
local GraphQLModule = require(Parent.GraphQL)
local GraphQLScalarType = GraphQLModule.GraphQLScalarType
local IsScalarTypeFunction = GraphQLModule.isScalarType
local IsEnumTypeFunction = GraphQLModule.isEnumType
local IsInterfaceTypeFunction = GraphQLModule.isInterfaceType
local IsUnionTypeFunction = GraphQLModule.isUnionType
local IsObjectTypeFunction = GraphQLModule.isObjectType
local IsSpecifiedScalarTypeFunction = GraphQLModule.isSpecifiedScalarType
local _ = require(script.Parent.Interfaces)
local String = LuauPolyfillModule.String

return {
	getResolversFromSchema = function(p1, p2) --[[ Line: 37 ]]
		-- upvalues: String (copy), Boolean (copy), IsScalarTypeFunction (copy), IsSpecifiedScalarTypeFunction (copy), GraphQLScalarType (copy), IsEnumTypeFunction (copy), IsInterfaceTypeFunction (copy), IsUnionTypeFunction (copy), IsObjectTypeFunction (copy)
		local NewResults = {}
		local TypeMap = p1:getTypeMap()
		
		for _, value in TypeMap do
			local v1 = value[1]
			
			if not String.startsWith(v1, "__") then
				local GetResult = TypeMap:get(v1)
				
				if Boolean.toJSBoolean(IsScalarTypeFunction(GetResult)) then
					if not Boolean.toJSBoolean(IsSpecifiedScalarTypeFunction(GetResult)) then
						local Config = GetResult:toConfig()
						Config.astNode = nil
						local SerializeFunction = Config.serialize
						local ParseValueFunction = Config.parseValue
						local ParseLiteralFunction = Config.parseLiteral
						
						if SerializeFunction then
							function Config.serialize(...) --[[ Line: 73 ]]
								-- upvalues: SerializeFunction (copy), Config (copy)
								return SerializeFunction(Config, ...)
							end
						end
						if ParseValueFunction then
							function Config.parseValue(...) --[[ Line: 79 ]]
								-- upvalues: ParseValueFunction (copy), Config (copy)
								return ParseValueFunction(Config, ...)
							end
						end
						if ParseLiteralFunction then
							function Config.parseLiteral(...) --[[ Line: 85 ]]
								-- upvalues: ParseLiteralFunction (copy), Config (copy)
								return ParseLiteralFunction(Config, ...)
							end
						end
						NewResults[tostring(v1)] = GraphQLScalarType.new(Config)
					end
				elseif Boolean.toJSBoolean(IsEnumTypeFunction(GetResult)) then
					NewResults[tostring(v1)] = {}
					
					for _, value1 in GetResult:getValues() do
						NewResults[tostring(v1)][tostring(value1.name)] = value1.value
					end
				elseif Boolean.toJSBoolean(IsInterfaceTypeFunction(GetResult)) then
					if GetResult.resolveType ~= nil then
						NewResults[v1] = { __resolveType = GetResult.resolveType }
					end
				elseif not Boolean.toJSBoolean(IsUnionTypeFunction(GetResult)) then
					if Boolean.toJSBoolean(IsObjectTypeFunction(GetResult)) then
						NewResults[tostring(v1)] = {}
						
						if GetResult.isTypeOf ~= nil then
							NewResults[v1].__isTypeOf = GetResult.isTypeOf
						end
						local Fields = GetResult:getFields()
						
						for _, value2 in Fields do
							local Entry = value2[1]
							local GetResult1 = Fields:get(Entry)
							
							if GetResult1.subscribe ~= nil then
								NewResults[tostring(v1)][tostring(Entry)] = Boolean.toJSBoolean(NewResults[tostring(v1)][tostring(Entry)]) and NewResults[tostring(v1)][tostring(Entry)] or {}
								NewResults[tostring(v1)][tostring(Entry)].subscribe = GetResult1.subscribe
							end
							if GetResult1.resolve ~= nil and (if typeof(GetResult1.resolve) == "table" then GetResult1.resolve.name else nil) ~= "defaultFieldResolver" then
								local Name = if typeof(GetResult1.resolve) == "table" then GetResult1.resolve.name else nil
								
								if Name == "defaultMergedResolver" then
									if not Boolean.toJSBoolean(p2) then
										continue
									end
								elseif Name == "defaultFieldResolver" then
									continue
								end
								NewResults[tostring(v1)][tostring(Entry)] = Boolean.toJSBoolean(NewResults[tostring(v1)][tostring(Entry)]) and NewResults[tostring(v1)][tostring(Entry)] or {}
								NewResults[tostring(v1)][tostring(Entry)].resolve = GetResult1.resolve
							end
						end
					end
				elseif GetResult.resolveType ~= nil then
					NewResults[v1] = { __resolveType = GetResult.resolveType }
				end
			end
		end
		return NewResults
	end
}