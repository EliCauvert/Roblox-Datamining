local parent = script.Parent.Parent
local luauPolyfillModule = require(parent.LuauPolyfill)
local array = luauPolyfillModule.Array
local boolean = luauPolyfillModule.Boolean
local error = luauPolyfillModule.Error
local console = luauPolyfillModule.console
local t = {}
local graphQLModule = require(parent.GraphQL)
local graphQLList = graphQLModule.GraphQLList
local graphQLNonNull = graphQLModule.GraphQLNonNull
local isNamedType = graphQLModule.isNamedType
local isObjectType = graphQLModule.isObjectType
local isInterfaceType = graphQLModule.isInterfaceType
local isUnionType = graphQLModule.isUnionType
local isInputObjectType = graphQLModule.isInputObjectType
local isLeafType = graphQLModule.isLeafType
local isListType = graphQLModule.isListType
local isNonNullType = graphQLModule.isNonNullType
local map = luauPolyfillModule.Map
local string = luauPolyfillModule.String
local var1 = nil

function t.healSchema(p1)
	-- upvalues: var1 (write)
	var1(p1:getTypeMap(), p1:getDirectives())
	
	return p1
end

function t.healTypes(p1, p2)
	-- upvalues: boolean (ref), isObjectType (ref), isInterfaceType (ref), isUnionType (ref), isInputObjectType (ref), isLeafType (ref), error (ref), array (ref), isListType (ref), graphQLList (ref), isNonNullType (ref), graphQLNonNull (ref), isNamedType (ref), map (ref), string (ref), console (ref)
	local _ = nil
	local healFields = nil
	local healInterfaces = nil
	local healInputFields = nil
	local healUnderlyingTypes = nil
	local healType = nil
	
	local function healNamedType(p3)
		-- upvalues: boolean (copy), isObjectType (copy), healFields (write), healInterfaces (write), isInterfaceType (copy), isUnionType (copy), healUnderlyingTypes (write), isInputObjectType (copy), healInputFields (write), isLeafType (copy), error (copy)
		if boolean.toJSBoolean(isObjectType(p3)) then
			healFields(p3)
			healInterfaces(p3)
			
			return
		elseif boolean.toJSBoolean(isInterfaceType(p3)) then
			healFields(p3)
			
			if p3.getInterfaces ~= nil then
				healInterfaces(p3)
			end
			return
		elseif boolean.toJSBoolean(isUnionType(p3)) then
			healUnderlyingTypes(p3)
			
			return
		elseif boolean.toJSBoolean(isInputObjectType(p3)) then
			healInputFields(p3)
			
			return
		elseif boolean.toJSBoolean(isLeafType(p3)) then
			return
		end
		error(error.new(("Unexpected schema type: %s"):format(tostring(p3))))
	end
	
	healFields = function(p3)
		-- upvalues: array (copy), healType (write), boolean (copy)
		local fields = p3:getFields()
		
		for i, v in fields:entries() do
			local var2 = v[1]
			local var3 = v[2]
			array.filter(array.map(var3.args, function(p4)
				-- upvalues: healType (copy)
				p4.type = healType(p4.type)
				
				return if p4.type == nil then nil else p4
			end), boolean.toJSBoolean)
			var3.type = healType(var3.type)
			
			if var3.type == nil then
				fields[tostring(var2)] = nil
			end
		end
	end
	
	healInterfaces = function(p4)
		-- upvalues: array (copy), healType (write), boolean (copy)
		if p4.getInterfaces ~= nil then
			local interfaces = p4:getInterfaces()
			interfaces = array.concat(interfaces, array.filter(array.map(array.splice(interfaces, 1), function(p5)
				-- upvalues: healType (copy)
				return healType(p5)
			end), boolean.toJSBoolean))
		end
	end
	
	healInputFields = function(p4)
		-- upvalues: healType (write)
		local fields = p4:getFields()
		
		for i, v in fields:entries() do
			local var4 = v[1]
			local var5 = v[2]
			var5.type = healType(var5.type)
			
			if var5.type == nil then
				fields[tostring(var4)] = nil
			end
		end
	end
	
	healUnderlyingTypes = function(p5)
		-- upvalues: array (copy), healType (write), boolean (copy)
		local types = p5:getTypes()
		local _ = array.concat(types, array.filter(array.map(array.splice(types, 1), function(p6)
			-- upvalues: healType (copy)
			return healType(p6)
		end), boolean.toJSBoolean))
	end
	
	healType = function(p5)
		-- upvalues: boolean (copy), isListType (copy), healType (write), graphQLList (copy), isNonNullType (copy), graphQLNonNull (copy), isNamedType (copy), p1 (ref)
		if boolean.toJSBoolean(isListType(p5)) then
			local var6 = healType(p5.ofType)
			
			return if var6 == nil then nil else graphQLList.new(var6)
		elseif boolean.toJSBoolean(isNonNullType(p5)) then
			local var7 = healType(p5.ofType)
			
			return if var7 == nil then nil else graphQLNonNull.new(var7)
		elseif boolean.toJSBoolean(isNamedType(p5)) then
			local var8
			local name = p1:get(p5.name)
			local toJSBoolean = boolean.toJSBoolean
			
			if boolean.toJSBoolean(name) then
				var8 = p5 ~= name
				var8 = nil
			else
				var8 = name
			end
			return if toJSBoolean(var8) then name else p5
		end
	end
	
	local var6 = map.new()
	
	for i, v in p1 do
		local unpacked = table.unpack(v)
		local var7 = p1:get(unpacked)
		
		if var7 ~= nil and not string.startsWith(unpacked, "__") then
			local name = var7.name
			
			if not string.startsWith(name, "__") then
				if var6:get(name) == nil then
					var6:set(name, var7)
				else
					console.warn(("Duplicate schema type name %s found; keeping the existing one found in the schema"):format(name))
				end
			end
		end
	end
	for i, v_1 in var6 do
		local unpacked = table.unpack(v_1)
		p1:set(unpacked, var6:get(unpacked))
	end
	for i, v_2 in p2 do
		v_2.args = array.filter(v_2.args, function(p5)
			-- upvalues: healType (write)
			p5.type = healType(p5.type)
			
			return p5.type ~= nil
		end)
	end
	for i, v_3 in p1 do
		local unpacked = table.unpack(v_3)
		local var8 = p1:get(unpacked)
		
		if not string.startsWith(unpacked, "__") and array.indexOf(var6:keys(), unpacked) ~= -1 and var8 ~= nil then
			healNamedType(var8)
		end
	end
	for i, v_4 in p1 do
		local unpacked = table.unpack(v_4)
		
		if not string.startsWith(unpacked, "__") and array.indexOf(var6:keys(), unpacked) == -1 then
			p1:set(unpacked, nil)
		end
	end
end

return t