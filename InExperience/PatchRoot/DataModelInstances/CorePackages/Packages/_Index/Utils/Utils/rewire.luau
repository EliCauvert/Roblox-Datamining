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

function t.rewireTypes(p0, p1) --[[ line: 92 ]]
	-- upvalues: isSpecifiedDirective (ref), graphQLDirective (ref), map (ref), isObjectType (ref), object (ref), graphQLObjectType (ref), isInterfaceType (ref), array (ref), graphQLInterfaceType (ref), isUnionType (ref), graphQLUnionType (ref), isInputObjectType (ref), graphQLInputObjectType (ref), isEnumType (ref), graphQLEnumType (ref), isScalarType (ref), isSpecifiedScalarType (ref), graphQLScalarType (ref), error (ref), isListType (ref), graphQLList (ref), isNonNullType (ref), graphQLNonNull (ref), isNamedType (ref), isNamedStub (ref), getBuiltInForStub (ref), string (ref), console (ref)
	local var4 = nil
	local var5 = nil
	local _ = nil
	local rewireArgs = nil
	local _ = nil
	local rewireFields = nil
	local rewireInputFields = nil
	local rewireNamedTypes = nil
	local rewireType = nil
	
	local function rewireDirective(p2) --[[ line: 114 ]]
		-- upvalues: isSpecifiedDirective (copy), rewireArgs (write), graphQLDirective (copy)
		if isSpecifiedDirective(p2) then
			return p2
		end
		local var17 = p2:toConfig()
		var17.args = rewireArgs(var17.args)
		
		return graphQLDirective.new(var17)
	end
	
	rewireArgs = function(p3) --[[ line: 123 | named "rewireArgs" ]]
		-- upvalues: map (copy), rewireType (write)
		local var18 = map.new()
		
		for i, v in p3 do
			local var19 = v[1]
			local var20 = p3:get(var19)
			local var21 = rewireType(var20.type)
			
			if var21 ~= nil then
				var20.type = var21
				var18:set(var19, var20)
			end
		end
		return var18
	end
	
	local function rewireNamedType(p4) --[[ line: 138 ]]
		-- upvalues: isObjectType (copy), object (copy), rewireFields (write), rewireNamedTypes (write), graphQLObjectType (copy), isInterfaceType (copy), array (copy), graphQLInterfaceType (copy), isUnionType (copy), graphQLUnionType (copy), isInputObjectType (copy), rewireInputFields (write), graphQLInputObjectType (copy), isEnumType (copy), graphQLEnumType (copy), isScalarType (copy), isSpecifiedScalarType (copy), graphQLScalarType (copy), error (copy)
		if isObjectType(p4) then
			local var22 = p4:toConfig()
			
			return graphQLObjectType.new(object.assign({}, var22, {
				fields = function() --[[ line: 143 ]]
					-- upvalues: rewireFields (copy), var22 (ref)
					return rewireFields(var22.fields)
				end,
				interfaces = function() --[[ line: 146 ]]
					-- upvalues: rewireNamedTypes (copy), var22 (ref)
					return rewireNamedTypes(var22.interfaces)
				end
			}))
		elseif isInterfaceType(p4) then
			local var23 = p4:toConfig()
			local var24 = object.assign({}, var23, {
				fields = function() --[[ line: 154 ]]
					-- upvalues: rewireFields (copy), var23 (ref)
					return rewireFields(var23.fields)
				end
			})
			
			if array.indexOf(object.keys(var24), "interfaces") ~= -1 then
				function var24.interfaces(_) --[[ line: 159 ]]
					-- upvalues: rewireNamedTypes (copy), var23 (ref)
					return rewireNamedTypes(var23.interfaces)
				end
			end
			return graphQLInterfaceType.new(var24)
		elseif isUnionType(p4) then
			local var25 = p4:toConfig()
			
			return graphQLUnionType.new(object.assign({}, var25, {
				types = function() --[[ line: 169 ]]
					-- upvalues: rewireNamedTypes (copy), var25 (ref)
					return rewireNamedTypes(var25.types)
				end
			}))
		elseif isInputObjectType(p4) then
			local var26 = p4:toConfig()
			
			return graphQLInputObjectType.new(object.assign({}, var26, {
				fields = function() --[[ line: 177 ]]
					-- upvalues: rewireInputFields (copy), var26 (ref)
					return rewireInputFields(var26.fields)
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
		local var27 = p4:toConfig()
		local serialize = var27.serialize
		local parseValue = var27.parseValue
		local parseLiteral = var27.parseLiteral
		
		if serialize then
			function var27.serialize(...) --[[ line: 196 ]]
				-- upvalues: serialize (ref), var27 (ref)
				return serialize(var27, ...)
			end
		end
		if parseValue then
			function var27.parseValue(...) --[[ line: 202 ]]
				-- upvalues: parseValue (ref), var27 (ref)
				return parseValue(var27, ...)
			end
		end
		if parseLiteral then
			function var27.parseLiteral(...) --[[ line: 208 ]]
				-- upvalues: parseLiteral (ref), var27 (ref)
				return parseLiteral(var27, ...)
			end
		end
		return graphQLScalarType.new(var27)
	end
	
	rewireFields = function(p5) --[[ line: 220 | named "rewireFields" ]]
		-- upvalues: map (copy), rewireType (write), rewireArgs (write)
		local var28 = map.new()
		
		for i, v in p5 do
			local var29 = v[1]
			local var30 = p5:get(var29)
			local var31 = rewireType(var30.type)
			
			if var31 ~= nil and var30.args then
				var30.type = var31
				var30.args = rewireArgs(var30.args)
				var28:set(var29, var30)
			end
		end
		return var28
	end
	
	rewireInputFields = function(p6) --[[ line: 235 | named "rewireInputFields" ]]
		-- upvalues: map (copy), rewireType (write)
		local var32 = map.new()
		
		for i, v in p6 do
			local var33 = v[1]
			local var34 = p6:get(var33)
			local var35 = rewireType(var34.type)
			
			if var35 ~= nil then
				var34.type = var35
				var32:set(var33, var34)
			end
		end
		return var32
	end
	
	rewireNamedTypes = function(p7) --[[ line: 249 | named "rewireNamedTypes" ]]
		-- upvalues: rewireType (write), object (copy)
		local t = {}
		
		for i, v in p7 do
			local var37 = rewireType(v)
			
			if var37 ~= nil and var37 ~= object.None then
				table.insert(t, var37)
			end
		end
		return t
	end
	
	rewireType = function(p8) --[[ line: 260 | named "rewireType" ]]
		-- upvalues: isListType (copy), rewireType (write), object (copy), graphQLList (copy), isNonNullType (copy), graphQLNonNull (copy), isNamedType (copy), var4 (write), isNamedStub (copy), getBuiltInForStub (copy), rewireNamedType (write), var5 (write)
		if isListType(p8) then
			local var38 = rewireType(p8.ofType)
			
			return if var38 == nil or var38 == object.None then nil else graphQLList.new(var38)
		elseif isNonNullType(p8) then
			local var39 = rewireType(p8.ofType)
			
			return if var39 == nil or var39 == object.None then nil else graphQLNonNull.new(var39)
		elseif not isNamedType(p8) then
			return nil
		end
		local name = var4:get(p8.name)
		
		if name == nil then
			name = if isNamedStub(p8) then getBuiltInForStub(p8) else rewireNamedType(p8)
			var4:set(p8.name, name)
			var5:set(name.name, var4:get(p8.name))
		end
		return if name == nil or name == object.None then nil else var5:get(name.name)
	end
	
	var4 = map.new()
	
	for i, v in p0 do
		local var16 = v[1]
		var4:set(var16, p0:get(var16))
	end
	var5 = map.new()
	
	for i, v_1 in var4 do
		local var14 = v_1[1]
		local var15 = var4:get(var14)
		
		if var15 ~= nil and var15 ~= object.None and not string.startsWith(var14, "__") then
			local name = var15.name
			
			if not string.startsWith(name, "__") then
				if var5:get(name) == nil then
					var5:set(name, var15)
				else
					console.warn(("Duplicate schema type name %s found; keeping the existing one found in the schema"):format(tostring(name)))
				end
			end
		end
	end
	for i, v_2 in var5 do
		local var13 = v_2[1]
		var5:set(var13, rewireNamedType(var5:get(var13)))
	end
	return {
		typeMap = var5,
		directives = array.map(p1, function(p9) --[[ line: 360 ]]
			-- upvalues: rewireDirective (write)
			return rewireDirective(p9)
		end)
	}
end

return t