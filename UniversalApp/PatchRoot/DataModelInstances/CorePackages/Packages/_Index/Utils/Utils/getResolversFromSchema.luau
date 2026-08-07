local parent = script.Parent.Parent
local luauPolyfillModule = require(parent.LuauPolyfill)
local boolean = luauPolyfillModule.Boolean
local t = {}
local graphQLModule = require(parent.GraphQL)
local graphQLScalarType = graphQLModule.GraphQLScalarType
local isScalarType = graphQLModule.isScalarType
local isEnumType = graphQLModule.isEnumType
local isInterfaceType = graphQLModule.isInterfaceType
local isUnionType = graphQLModule.isUnionType
local isObjectType = graphQLModule.isObjectType
local isSpecifiedScalarType = graphQLModule.isSpecifiedScalarType
local _ = require(script.Parent.Interfaces)
local string = luauPolyfillModule.String

function t.getResolversFromSchema(p0, p1) --[[ line: 37 ]]
	-- upvalues: string (ref), boolean (ref), isScalarType (ref), isSpecifiedScalarType (ref), graphQLScalarType (ref), isEnumType (ref), isInterfaceType (ref), isUnionType (ref), isObjectType (ref)
	local t = {}
	local typeMap = p0:getTypeMap()
	
	for i, v in typeMap do
		local var5 = v[1]
		
		if not string.startsWith(var5, "__") then
			local var6 = typeMap:get(var5)
			
			if boolean.toJSBoolean(isScalarType(var6)) then
				if not boolean.toJSBoolean(isSpecifiedScalarType(var6)) then
					local var7 = var6:toConfig()
					var7.astNode = nil
					local serialize = var7.serialize
					local parseValue = var7.parseValue
					local parseLiteral = var7.parseLiteral
					
					if serialize then
						function var7.serialize(...) --[[ line: 73 ]]
							-- upvalues: serialize (ref), var7 (ref)
							return serialize(var7, ...)
						end
					end
					if parseValue then
						function var7.parseValue(...) --[[ line: 79 ]]
							-- upvalues: parseValue (ref), var7 (ref)
							return parseValue(var7, ...)
						end
					end
					if parseLiteral then
						function var7.parseLiteral(...) --[[ line: 85 ]]
							-- upvalues: parseLiteral (ref), var7 (ref)
							return parseLiteral(var7, ...)
						end
					end
					t[tostring(var5)] = graphQLScalarType.new(var7)
				end
			elseif boolean.toJSBoolean(isEnumType(var6)) then
				t[tostring(var5)] = {}
				
				for i_1, v_1 in var6:getValues() do
					t[tostring(var5)][tostring(v_1.name)] = v_1.value
				end
			elseif boolean.toJSBoolean(isInterfaceType(var6)) then
				if var6.resolveType ~= nil then
					t[var5] = { __resolveType = var6.resolveType }
				end
			elseif boolean.toJSBoolean(isUnionType(var6)) then
				if var6.resolveType ~= nil then
					t[var5] = { __resolveType = var6.resolveType }
				end
			elseif boolean.toJSBoolean(isObjectType(var6)) then
				t[tostring(var5)] = {}
				
				if var6.isTypeOf ~= nil then
					t[var5].__isTypeOf = var6.isTypeOf
				end
				local fields = var6:getFields()
				
				for i_1, v_1 in fields do
					local var9 = v_1[1]
					local var10 = fields:get(var9)
					
					if var10.subscribe ~= nil then
						t[tostring(var5)][tostring(var9)] = if boolean.toJSBoolean(t[tostring(var5)][tostring(var9)]) then t[tostring(var5)][tostring(var9)] else {}
						t[tostring(var5)][tostring(var9)].subscribe = var10.subscribe
					end
					if var10.resolve ~= nil and (if typeof(var10.resolve) == "table" then var10.resolve.name else nil) ~= "defaultFieldResolver" then
						local var11 = if typeof(var10.resolve) == "table" then var10.resolve.name else nil
						
						if var11 == "defaultMergedResolver" then
							if boolean.toJSBoolean(p1) then
								t[tostring(var5)][tostring(var9)] = if boolean.toJSBoolean(t[tostring(var5)][tostring(var9)]) then t[tostring(var5)][tostring(var9)] else {}
								t[tostring(var5)][tostring(var9)].resolve = var10.resolve
							end
						elseif var11 ~= "defaultFieldResolver" then
						end
					end
				end
			end
		end
	end
	return t
end

return t