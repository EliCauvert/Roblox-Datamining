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

function t.filterSchema(p0)
	-- upvalues: mapSchema (ref), mapperKind (ref), filterRootFields (write), boolean (ref), filterElementFields (write), graphQLObjectType (ref), object (ref), graphQLInterfaceType (ref), graphQLInputObjectType (ref)
	local schema = p0.schema
	local var5 = if p0.typeFilter == nil then function(...)
		return true
	end else p0.typeFilter
	local var6 = if p0.fieldFilter == nil then nil else p0.fieldFilter
	local var7 = if p0.rootFieldFilter == nil then nil else p0.rootFieldFilter
	local var8 = if p0.objectFieldFilter == nil then nil else p0.objectFieldFilter
	local var9 = if p0.interfaceFieldFilter == nil then nil else p0.interfaceFieldFilter
	local var10 = if p0.inputObjectFieldFilter == nil then nil else p0.inputObjectFieldFilter
	local var11 = if p0.argumentFilter == nil then nil else p0.argumentFilter
	
	return mapSchema(schema, {
		[mapperKind.QUERY] = function(p1)
			-- upvalues: filterRootFields (copy), var7 (ref), var11 (ref)
			return filterRootFields(p1, "Query", var7, var11)
		end,
		[mapperKind.MUTATION] = function(p2)
			-- upvalues: filterRootFields (copy), var7 (ref), var11 (ref)
			return filterRootFields(p2, "Mutation", var7, var11)
		end,
		[mapperKind.SUBSCRIPTION] = function(p3)
			-- upvalues: filterRootFields (copy), var7 (ref), var11 (ref)
			return filterRootFields(p3, "Subscription", var7, var11)
		end,
		[mapperKind.OBJECT_TYPE] = function(p4)
			-- upvalues: boolean (copy), var5 (ref), filterElementFields (copy), graphQLObjectType (copy), var8 (ref), var6 (ref), var11 (ref), object (copy)
			return if boolean.toJSBoolean(var5(p4.name, p4)) then filterElementFields(graphQLObjectType, p4, if boolean.toJSBoolean(var8) then var8 else var6, var11) else object.None
		end,
		[mapperKind.INTERFACE_TYPE] = function(p5)
			-- upvalues: boolean (copy), var5 (ref), filterElementFields (copy), graphQLInterfaceType (copy), var9 (ref), var6 (ref), var11 (ref), object (copy)
			return if boolean.toJSBoolean(var5(p5.name, p5)) then filterElementFields(graphQLInterfaceType, p5, if boolean.toJSBoolean(var9) then var9 else var6, var11) else object.None
		end,
		[mapperKind.INPUT_OBJECT_TYPE] = function(p6)
			-- upvalues: boolean (copy), var5 (ref), filterElementFields (copy), graphQLInputObjectType (copy), var10 (ref), var6 (ref), object (copy)
			return if boolean.toJSBoolean(var5(p6.name, p6)) then filterElementFields(graphQLInputObjectType, p6, if boolean.toJSBoolean(var10) then var10 else var6) else object.None
		end,
		[mapperKind.UNION_TYPE] = function(p7)
			-- upvalues: boolean (copy), var5 (ref), object (copy)
			return if boolean.toJSBoolean(var5(p7.name, p7)) then nil else object.None
		end,
		[mapperKind.ENUM_TYPE] = function(p8)
			-- upvalues: boolean (copy), var5 (ref), object (copy)
			return if boolean.toJSBoolean(var5(p8.name, p8)) then nil else object.None
		end,
		[mapperKind.SCALAR_TYPE] = function(p9)
			-- upvalues: boolean (copy), var5 (ref), object (copy)
			return if boolean.toJSBoolean(var5(p9.name, p9)) then nil else object.None
		end
	})
end

filterRootFields = function(p10, p11, p12, p13)
	-- upvalues: boolean (ref), graphQLObjectType (ref)
	if not boolean.toJSBoolean(if boolean.toJSBoolean(p12) then p12 else p13) then
		return p10
	end
	local var12 = p10:toConfig()
	
	for i, v in var12.fields do
		local unpacked = table.unpack(v)
		local var14 = var12.fields:get(unpacked)
		
		if p12 and not p12(p11, unpacked, var12.fields:get(unpacked)) then
			var12.fields:delete(unpacked)
		elseif boolean.toJSBoolean(if boolean.toJSBoolean(p13) then var14.args else p13) then
			for i_1, v_1 in var14.args do
				local unpacked_1 = table.unpack(v_1)
				
				if not p13(p11, unpacked, unpacked_1, var14.args:get(unpacked_1)) then
					var14.args:delete(unpacked_1)
				end
			end
		end
	end
	return graphQLObjectType.new(var12)
end

filterElementFields = function(p14, p15, p16, p17)
	-- upvalues: boolean (ref), array (ref), object (ref)
	if not boolean.toJSBoolean(if boolean.toJSBoolean(p16) then p16 else p17) then
		return nil
	end
	local unpacked
	local var16 = p15:toConfig()
	
	for i, v in var16.fields do
		unpacked = table.unpack(v)
		local var18 = var16.fields:get(unpacked)
		
		if boolean.toJSBoolean(p16 and not p16(p15.name, unpacked, var16.fields:get(unpacked))) then
			var16.fields:delete(unpacked)
			continue
		end
		local var19
		local toJSBoolean = boolean.toJSBoolean
		
		if boolean.toJSBoolean(p17) then
			var19 = array.indexOf(object.keys(var18), "args") ~= -1
			var19 = nil
		else
			var19 = p17
		end
		if toJSBoolean(var19) then
			for i_1, v_1 in var18.args do
				local unpacked_1 = table.unpack(v_1)
				
				if not boolean.toJSBoolean(p17(p15.name, unpacked, unpacked_1, var18.args:get(unpacked_1))) then
					var18.args:delete(unpacked_1)
				end
			end
		end
	end
	return p14.new(var16)
end

return t