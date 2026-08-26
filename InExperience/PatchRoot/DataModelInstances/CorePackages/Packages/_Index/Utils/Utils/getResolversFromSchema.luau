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

function t.getResolversFromSchema(p1, p2)
	-- upvalues: string (ref), boolean (ref), isScalarType (ref), isSpecifiedScalarType (ref), graphQLScalarType (ref), isEnumType (ref), isInterfaceType (ref), isUnionType (ref), isObjectType (ref)
	local t = {}
	local typeMap = p1:getTypeMap()
	
	for i, v in typeMap do
		local var1 = v[1]
		
		if not string.startsWith(var1, "__") then
			local var2 = typeMap:get(var1)
			
			if boolean.toJSBoolean(isScalarType(var2)) then
				if not boolean.toJSBoolean(isSpecifiedScalarType(var2)) then
					local var3 = var2:toConfig()
					var3.astNode = nil
					local serialize = var3.serialize
					local parseValue = var3.parseValue
					local parseLiteral = var3.parseLiteral
					
					if serialize then
						function var7.serialize(...)
							-- upvalues: serialize (ref), var3 (ref)
							return serialize(var3, ...)
						end
					end
					if parseValue then
						function var7.parseValue(...)
							-- upvalues: parseValue (ref), var3 (ref)
							return parseValue(var3, ...)
						end
					end
					if parseLiteral then
						function var7.parseLiteral(...)
							-- upvalues: parseLiteral (ref), var3 (ref)
							return parseLiteral(var3, ...)
						end
					end
					t[tostring(var1)] = graphQLScalarType.new(var3)
				end
			elseif boolean.toJSBoolean(isEnumType(var2)) then
				t[tostring(var1)] = {}
				
				for i_1, v_1 in var2:getValues() do
					t[tostring(var1)][tostring(v_1.name)] = v_1.value
				end
			elseif boolean.toJSBoolean(isInterfaceType(var2)) then
				if var2.resolveType ~= nil then
					t[var1] = { __resolveType = var2.resolveType }
				end
			elseif boolean.toJSBoolean(isUnionType(var2)) then
				if var2.resolveType ~= nil then
					t[var1] = { __resolveType = var2.resolveType }
				end
			elseif boolean.toJSBoolean(isObjectType(var2)) then
				t[tostring(var1)] = {}
				
				if var2.isTypeOf ~= nil then
					t[var1].__isTypeOf = var2.isTypeOf
				end
				local fields = var2:getFields()
				
				for i_1, v_1 in fields do
					local var4 = v_1[1]
					local var5 = fields:get(var4)
					
					if var5.subscribe ~= nil then
						t[tostring(var1)][tostring(var4)] = if boolean.toJSBoolean(t[tostring(var1)][tostring(var4)]) then t[tostring(var1)][tostring(var4)] else {}
						t[tostring(var1)][tostring(var4)].subscribe = var5.subscribe
					end
					if var5.resolve ~= nil and (if typeof(var5.resolve) == "table" then var5.resolve.name else nil) ~= "defaultFieldResolver" then
						local var6 = if typeof(var5.resolve) == "table" then var5.resolve.name else nil
						
						if var6 == "defaultMergedResolver" then
							if boolean.toJSBoolean(p2) then
								t[tostring(var1)][tostring(var4)] = if boolean.toJSBoolean(t[tostring(var1)][tostring(var4)]) then t[tostring(var1)][tostring(var4)] else {}
								t[tostring(var1)][tostring(var4)].resolve = var5.resolve
							end
						elseif var6 ~= "defaultFieldResolver" then
						end
					end
				end
			end
		end
	end
	return t
end

return t