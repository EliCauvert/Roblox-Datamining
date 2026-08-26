local parent = script.Parent.Parent
local luauPolyfillModule = require(parent.LuauPolyfill)
local array = luauPolyfillModule.Array
local error = luauPolyfillModule.Error
local object = luauPolyfillModule.Object
local console = luauPolyfillModule.console
local t = {}
local graphQLModule = require(parent.GraphQL)
local graphQLDirective = graphQLModule.GraphQLDirective
local graphQLEnumType = graphQLModule.GraphQLEnumType
local graphQLInputObjectType = graphQLModule.GraphQLInputObjectType
local graphQLInterfaceType = graphQLModule.GraphQLInterfaceType
local graphQLList = graphQLModule.GraphQLList
local graphQLObjectType = graphQLModule.GraphQLObjectType
local graphQLNonNull = graphQLModule.GraphQLNonNull
local graphQLScalarType = graphQLModule.GraphQLScalarType
local graphQLUnionType = graphQLModule.GraphQLUnionType
local isInterfaceType = graphQLModule.isInterfaceType
local isEnumType = graphQLModule.isEnumType
local isInputObjectType = graphQLModule.isInputObjectType
local isListType = graphQLModule.isListType
local isNamedType = graphQLModule.isNamedType
local isNonNullType = graphQLModule.isNonNullType
local isObjectType = graphQLModule.isObjectType
local isScalarType = graphQLModule.isScalarType
local isUnionType = graphQLModule.isUnionType
local isSpecifiedScalarType = graphQLModule.isSpecifiedScalarType
local isSpecifiedDirective = graphQLModule.isSpecifiedDirective
local stubModule = require(script.Parent.stub)
local getBuiltInForStub = stubModule.getBuiltInForStub
local isNamedStub = stubModule.isNamedStub
local map = luauPolyfillModule.Map
local string = luauPolyfillModule.String

function t.rewireTypes(p1, p2)
	-- upvalues: isSpecifiedDirective (ref), graphQLDirective (ref), map (ref), isObjectType (ref), object (ref), graphQLObjectType (ref), isInterfaceType (ref), array (ref), graphQLInterfaceType (ref), isUnionType (ref), graphQLUnionType (ref), isInputObjectType (ref), graphQLInputObjectType (ref), isEnumType (ref), graphQLEnumType (ref), isScalarType (ref), isSpecifiedScalarType (ref), graphQLScalarType (ref), error (ref), isListType (ref), graphQLList (ref), isNonNullType (ref), graphQLNonNull (ref), isNamedType (ref), isNamedStub (ref), getBuiltInForStub (ref), string (ref), console (ref)
	local var1 = nil
	local var2 = nil
	local _ = nil
	local rewireArgs = nil
	local _ = nil
	local rewireFields = nil
	local rewireInputFields = nil
	local rewireNamedTypes = nil
	local rewireType = nil
	
	local function rewireDirective(p3)
		-- upvalues: isSpecifiedDirective (copy), rewireArgs (write), graphQLDirective (copy)
		if isSpecifiedDirective(p3) then
			return p3
		end
		local var3 = p3:toConfig()
		var3.args = rewireArgs(var3.args)
		
		return graphQLDirective.new(var3)
	end
	
	rewireArgs = function(p3)
		-- upvalues: map (copy), rewireType (write)
		local var3 = map.new()
		
		for i, v in p3 do
			local var4 = v[1]
			local var5 = p3:get(var4)
			local var6 = rewireType(var5.type)
			
			if var6 ~= nil then
				var5.type = var6
				var3:set(var4, var5)
			end
		end
		return var3
	end
	
	local function rewireNamedType(p4)
		-- upvalues: isObjectType (copy), object (copy), rewireFields (write), rewireNamedTypes (write), graphQLObjectType (copy), isInterfaceType (copy), array (copy), graphQLInterfaceType (copy), isUnionType (copy), graphQLUnionType (copy), isInputObjectType (copy), rewireInputFields (write), graphQLInputObjectType (copy), isEnumType (copy), graphQLEnumType (copy), isScalarType (copy), isSpecifiedScalarType (copy), graphQLScalarType (copy), error (copy)
		if isObjectType(p4) then
			local var7 = p4:toConfig()
			
			return graphQLObjectType.new(object.assign({}, var7, {
				fields = function()
					-- upvalues: rewireFields (copy), var7 (ref)
					return rewireFields(var7.fields)
				end,
				interfaces = function()
					-- upvalues: rewireNamedTypes (copy), var7 (ref)
					return rewireNamedTypes(var7.interfaces)
				end
			}))
		elseif isInterfaceType(p4) then
			local var8 = p4:toConfig()
			local var9 = object.assign({}, var8, {
				fields = function()
					-- upvalues: rewireFields (copy), var8 (ref)
					return rewireFields(var8.fields)
				end
			})
			
			if array.indexOf(object.keys(var9), "interfaces") ~= -1 then
				function var24.interfaces(_)
					-- upvalues: rewireNamedTypes (copy), var8 (ref)
					return rewireNamedTypes(var8.interfaces)
				end
			end
			return graphQLInterfaceType.new(var9)
		elseif isUnionType(p4) then
			local var10 = p4:toConfig()
			
			return graphQLUnionType.new(object.assign({}, var10, {
				types = function()
					-- upvalues: rewireNamedTypes (copy), var10 (ref)
					return rewireNamedTypes(var10.types)
				end
			}))
		elseif isInputObjectType(p4) then
			local var11 = p4:toConfig()
			
			return graphQLInputObjectType.new(object.assign({}, var11, {
				fields = function()
					-- upvalues: rewireInputFields (copy), var11 (ref)
					return rewireInputFields(var11.fields)
				end
			}))
		elseif isEnumType(p4) then
			return graphQLEnumType.new(p4:toConfig())
		elseif not isScalarType(p4) then
			error(error.new(("Unexpected schema type: %s"):format(tostring(p4))))
			
			return
		elseif isSpecifiedScalarType(p4) then
			return p4
		end
		local var12 = p4:toConfig()
		local serialize = var12.serialize
		local parseValue = var12.parseValue
		local parseLiteral = var12.parseLiteral
		
		if serialize then
			function var27.serialize(...)
				-- upvalues: serialize (ref), var12 (ref)
				return serialize(var12, ...)
			end
		end
		if parseValue then
			function var27.parseValue(...)
				-- upvalues: parseValue (ref), var12 (ref)
				return parseValue(var12, ...)
			end
		end
		if parseLiteral then
			function var27.parseLiteral(...)
				-- upvalues: parseLiteral (ref), var12 (ref)
				return parseLiteral(var12, ...)
			end
		end
		return graphQLScalarType.new(var12)
	end
	
	rewireFields = function(p4)
		-- upvalues: map (copy), rewireType (write), rewireArgs (write)
		local var7 = map.new()
		
		for i, v in p4 do
			local var8 = v[1]
			local var9 = p4:get(var8)
			local var10 = rewireType(var9.type)
			
			if var10 ~= nil and var9.args then
				var9.type = var10
				var9.args = rewireArgs(var9.args)
				var7:set(var8, var9)
			end
		end
		return var7
	end
	
	rewireInputFields = function(p5)
		-- upvalues: map (copy), rewireType (write)
		local var11 = map.new()
		
		for i, v in p5 do
			local var12 = v[1]
			local var13 = p5:get(var12)
			local var14 = rewireType(var13.type)
			
			if var14 ~= nil then
				var13.type = var14
				var11:set(var12, var13)
			end
		end
		return var11
	end
	
	rewireNamedTypes = function(p6)
		-- upvalues: rewireType (write), object (copy)
		local t = {}
		
		for i, v in p6 do
			local var15 = rewireType(v)
			
			if var15 ~= nil and var15 ~= object.None then
				table.insert(t, var15)
			end
		end
		return t
	end
	
	rewireType = function(p7)
		-- upvalues: isListType (copy), rewireType (write), object (copy), graphQLList (copy), isNonNullType (copy), graphQLNonNull (copy), isNamedType (copy), var1 (write), isNamedStub (copy), getBuiltInForStub (copy), rewireNamedType (write), var2 (write)
		if isListType(p7) then
			local var16 = rewireType(p7.ofType)
			
			return if var16 == nil or var16 == object.None then nil else graphQLList.new(var16)
		elseif isNonNullType(p7) then
			local var17 = rewireType(p7.ofType)
			
			return if var17 == nil or var17 == object.None then nil else graphQLNonNull.new(var17)
		elseif not isNamedType(p7) then
			return nil
		end
		local name = var1:get(p7.name)
		
		if name == nil then
			name = if isNamedStub(p7) then getBuiltInForStub(p7) else rewireNamedType(p7)
			var1:set(p7.name, name)
			var2:set(name.name, var1:get(p7.name))
		end
		return if name == nil or name == object.None then nil else var2:get(name.name)
	end
	
	var1 = map.new()
	
	for i, v in p1 do
		local var16 = v[1]
		var1:set(var16, p1:get(var16))
	end
	var2 = map.new()
	
	for i, v_1 in var1 do
		local var17 = v_1[1]
		local var18 = var1:get(var17)
		
		if var18 ~= nil and var18 ~= object.None and not string.startsWith(var17, "__") then
			local name = var18.name
			
			if not string.startsWith(name, "__") then
				if var2:get(name) == nil then
					var2:set(name, var18)
				else
					console.warn(("Duplicate schema type name %s found; keeping the existing one found in the schema"):format(tostring(name)))
				end
			end
		end
	end
	for i, v_2 in var2 do
		local var19 = v_2[1]
		var2:set(var19, rewireNamedType(var2:get(var19)))
	end
	return {
		typeMap = var2,
		directives = array.map(p2, function(p7)
			-- upvalues: rewireDirective (write)
			return rewireDirective(p7)
		end)
	}
end

return t