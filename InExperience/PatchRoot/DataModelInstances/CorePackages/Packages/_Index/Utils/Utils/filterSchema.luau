local parent = script.Parent.Parent
local luauPolyfillModule = require(parent.LuauPolyfill)
local array = luauPolyfillModule.Array
local boolean = luauPolyfillModule.Boolean
local object = luauPolyfillModule.Object
local t = {}
local graphQLModule = require(parent.GraphQL)
local graphQLInputObjectType = graphQLModule.GraphQLInputObjectType
local graphQLInterfaceType = graphQLModule.GraphQLInterfaceType
local graphQLObjectType = graphQLModule.GraphQLObjectType
local mapperKind = require(script.Parent.Interfaces).MapperKind
local mapSchema = require(script.Parent.mapSchema).mapSchema
local _ = require(script.Parent.types)
local filterRootFields = nil
local filterElementFields = nil

function t.filterSchema(p1)
	-- upvalues: mapSchema (ref), mapperKind (ref), filterRootFields (write), boolean (ref), filterElementFields (write), graphQLObjectType (ref), object (ref), graphQLInterfaceType (ref), graphQLInputObjectType (ref)
	local schema = p1.schema
	local var1 = if p1.typeFilter == nil then function(...)
		return true
	end else p1.typeFilter
	local var2 = if p1.fieldFilter == nil then nil else p1.fieldFilter
	local var3 = if p1.rootFieldFilter == nil then nil else p1.rootFieldFilter
	local var4 = if p1.objectFieldFilter == nil then nil else p1.objectFieldFilter
	local var5 = if p1.interfaceFieldFilter == nil then nil else p1.interfaceFieldFilter
	local var6 = if p1.inputObjectFieldFilter == nil then nil else p1.inputObjectFieldFilter
	local var7 = if p1.argumentFilter == nil then nil else p1.argumentFilter
	
	return mapSchema(schema, {
		[mapperKind.QUERY] = function(p2)
			-- upvalues: filterRootFields (copy), var3 (ref), var7 (ref)
			return filterRootFields(p2, "Query", var3, var7)
		end,
		[mapperKind.MUTATION] = function(p2)
			-- upvalues: filterRootFields (copy), var3 (ref), var7 (ref)
			return filterRootFields(p2, "Mutation", var3, var7)
		end,
		[mapperKind.SUBSCRIPTION] = function(p2)
			-- upvalues: filterRootFields (copy), var3 (ref), var7 (ref)
			return filterRootFields(p2, "Subscription", var3, var7)
		end,
		[mapperKind.OBJECT_TYPE] = function(p2)
			-- upvalues: boolean (copy), var1 (ref), filterElementFields (copy), graphQLObjectType (copy), var4 (ref), var2 (ref), var7 (ref), object (copy)
			return if boolean.toJSBoolean(var1(p2.name, p2)) then filterElementFields(graphQLObjectType, p2, if boolean.toJSBoolean(var4) then var4 else var2, var7) else object.None
		end,
		[mapperKind.INTERFACE_TYPE] = function(p2)
			-- upvalues: boolean (copy), var1 (ref), filterElementFields (copy), graphQLInterfaceType (copy), var5 (ref), var2 (ref), var7 (ref), object (copy)
			return if boolean.toJSBoolean(var1(p2.name, p2)) then filterElementFields(graphQLInterfaceType, p2, if boolean.toJSBoolean(var5) then var5 else var2, var7) else object.None
		end,
		[mapperKind.INPUT_OBJECT_TYPE] = function(p2)
			-- upvalues: boolean (copy), var1 (ref), filterElementFields (copy), graphQLInputObjectType (copy), var6 (ref), var2 (ref), object (copy)
			return if boolean.toJSBoolean(var1(p2.name, p2)) then filterElementFields(graphQLInputObjectType, p2, if boolean.toJSBoolean(var6) then var6 else var2) else object.None
		end,
		[mapperKind.UNION_TYPE] = function(p2)
			-- upvalues: boolean (copy), var1 (ref), object (copy)
			return if boolean.toJSBoolean(var1(p2.name, p2)) then nil else object.None
		end,
		[mapperKind.ENUM_TYPE] = function(p2)
			-- upvalues: boolean (copy), var1 (ref), object (copy)
			return if boolean.toJSBoolean(var1(p2.name, p2)) then nil else object.None
		end,
		[mapperKind.SCALAR_TYPE] = function(p2)
			-- upvalues: boolean (copy), var1 (ref), object (copy)
			return if boolean.toJSBoolean(var1(p2.name, p2)) then nil else object.None
		end
	})
end

filterRootFields = function(p1, p2, p3, p4)
	-- upvalues: boolean (ref), graphQLObjectType (ref)
	if not boolean.toJSBoolean(if boolean.toJSBoolean(p3) then p3 else p4) then
		return p1
	end
	local var1 = p1:toConfig()
	
	for i, v in var1.fields do
		local unpacked = table.unpack(v)
		local var2 = var1.fields:get(unpacked)
		
		if p3 and not p3(p2, unpacked, var1.fields:get(unpacked)) then
			var1.fields:delete(unpacked)
		elseif boolean.toJSBoolean(if boolean.toJSBoolean(p4) then var2.args else p4) then
			for i_1, v_1 in var2.args do
				local unpacked_1 = table.unpack(v_1)
				
				if not p4(p2, unpacked, unpacked_1, var2.args:get(unpacked_1)) then
					var2.args:delete(unpacked_1)
				end
			end
		end
	end
	return graphQLObjectType.new(var1)
end

filterElementFields = function(p5, p6, p7, p8)
	-- upvalues: boolean (ref), array (ref), object (ref)
	if not boolean.toJSBoolean(if boolean.toJSBoolean(p7) then p7 else p8) then
		return nil
	end
	local unpacked
	local var3 = p6:toConfig()
	
	for i, v in var3.fields do
		unpacked = table.unpack(v)
		local var4 = var3.fields:get(unpacked)
		
		if boolean.toJSBoolean(p7 and not p7(p6.name, unpacked, var3.fields:get(unpacked))) then
			var3.fields:delete(unpacked)
			continue
		end
		local var5
		local toJSBoolean = boolean.toJSBoolean
		
		if boolean.toJSBoolean(p8) then
			var5 = array.indexOf(object.keys(var4), "args") ~= -1
			var5 = nil
		else
			var5 = p8
		end
		if toJSBoolean(var5) then
			for i_1, v_1 in var4.args do
				local unpacked_1 = table.unpack(v_1)
				
				if not boolean.toJSBoolean(p8(p6.name, unpacked, unpacked_1, var4.args:get(unpacked_1))) then
					var4.args:delete(unpacked_1)
				end
			end
		end
	end
	return p5.new(var3)
end

return t