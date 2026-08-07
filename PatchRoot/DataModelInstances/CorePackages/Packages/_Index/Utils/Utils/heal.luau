-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:33:08 2026 Pacific Standard Time.

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
local var3 = nil

function t.healSchema(p0) --[[ line: 96 ]]
	-- upvalues: var3 (write)
	var3(p0:getTypeMap(), p0:getDirectives())
	
	return p0
end

function t.healTypes(p1, p2) --[[ line: 106 ]]
	-- upvalues: boolean (ref), isObjectType (ref), isInterfaceType (ref), isUnionType (ref), isInputObjectType (ref), isLeafType (ref), error (ref), array (ref), isListType (ref), graphQLList (ref), isNonNullType (ref), graphQLNonNull (ref), isNamedType (ref), map (ref), string (ref), console (ref)
	local _ = nil
	local healFields = nil
	local healInterfaces = nil
	local healInputFields = nil
	local healUnderlyingTypes = nil
	local healType = nil
	
	local function healNamedType(p3) --[[ line: 187 ]]
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
	
	healFields = function(p4) --[[ line: 234 | named "healFields" ]]
		-- upvalues: array (copy), healType (write), boolean (copy)
		local fields = p4:getFields()
		
		for i, v in fields:entries() do
			local var18 = v[1]
			local var19 = v[2]
			array.filter(array.map(var19.args, function(p5) --[[ line: 250 ]]
				-- upvalues: healType (copy)
				p5.type = healType(p5.type)
				
				return if p5.type == nil then nil else p5
			end), boolean.toJSBoolean)
			var19.type = healType(var19.type)
			
			if var19.type == nil then
				fields[tostring(var18)] = nil
			end
		end
	end
	
	healInterfaces = function(p6) --[[ line: 267 | named "healInterfaces" ]]
		-- upvalues: array (copy), healType (write), boolean (copy)
		if p6.getInterfaces ~= nil then
			local interfaces = p6:getInterfaces()
			interfaces = array.concat(interfaces, array.filter(array.map(array.splice(interfaces, 1), function(p7) --[[ line: 285 ]]
				-- upvalues: healType (copy)
				return healType(p7)
			end), boolean.toJSBoolean))
		end
	end
	
	healInputFields = function(p8) --[[ line: 296 | named "healInputFields" ]]
		-- upvalues: healType (write)
		local fields = p8:getFields()
		
		for i, v in fields:entries() do
			local var22 = v[1]
			local var23 = v[2]
			var23.type = healType(var23.type)
			
			if var23.type == nil then
				fields[tostring(var22)] = nil
			end
		end
	end
	
	healUnderlyingTypes = function(p9) --[[ line: 316 | named "healUnderlyingTypes" ]]
		-- upvalues: array (copy), healType (write), boolean (copy)
		local types = p9:getTypes()
		local _ = array.concat(types, array.filter(array.map(array.splice(types, 1), function(p10) --[[ line: 327 ]]
			-- upvalues: healType (copy)
			return healType(p10)
		end), boolean.toJSBoolean))
	end
	
	healType = function(p11) --[[ line: 337 | named "healType" ]]
		-- upvalues: boolean (copy), isListType (copy), healType (write), graphQLList (copy), isNonNullType (copy), graphQLNonNull (copy), isNamedType (copy), p1 (ref)
		if boolean.toJSBoolean(isListType(p11)) then
			local var25 = healType(p11.ofType)
			
			return if var25 == nil then nil else graphQLList.new(var25)
		elseif boolean.toJSBoolean(isNonNullType(p11)) then
			local var26 = healType(p11.ofType)
			
			return if var26 == nil then nil else graphQLNonNull.new(var26)
		elseif boolean.toJSBoolean(isNamedType(p11)) then
			local var28
			local name = p1:get(p11.name)
			local toJSBoolean = boolean.toJSBoolean
			
			if boolean.toJSBoolean(name) then
				var28 = p11 ~= name
				var28 = nil
			else
				var28 = name
			end
			return if toJSBoolean(var28) then name else p11
		end
	end
	
	local var10 = map.new()
	
	for i, v in p1 do
		local unpacked = table.unpack(v)
		local var16 = p1:get(unpacked)
		
		if var16 ~= nil and not string.startsWith(unpacked, "__") then
			local name = var16.name
			
			if not string.startsWith(name, "__") then
				if var10:get(name) == nil then
					var10:set(name, var16)
				else
					console.warn(("Duplicate schema type name %s found; keeping the existing one found in the schema"):format(name))
				end
			end
		end
	end
	for i, v_1 in var10 do
		local unpacked = table.unpack(v_1)
		p1:set(unpacked, var10:get(unpacked))
	end
	for i, v_2 in p2 do
		v_2.args = array.filter(v_2.args, function(p12) --[[ line: 422 ]]
			-- upvalues: healType (write)
			p12.type = healType(p12.type)
			
			return p12.type ~= nil
		end)
	end
	for i, v_3 in p1 do
		local unpacked = table.unpack(v_3)
		local var13 = p1:get(unpacked)
		
		if not string.startsWith(unpacked, "__") and array.indexOf(var10:keys(), unpacked) ~= -1 and var13 ~= nil then
			healNamedType(var13)
		end
	end
	for i, v_4 in p1 do
		local unpacked = table.unpack(v_4)
		
		if not string.startsWith(unpacked, "__") and array.indexOf(var10:keys(), unpacked) == -1 then
			p1:set(unpacked, nil)
		end
	end
end

return t