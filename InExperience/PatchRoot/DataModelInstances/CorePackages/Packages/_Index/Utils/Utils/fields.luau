local parent = script.Parent.Parent
local luauPolyfillModule = require(parent.LuauPolyfill)
local boolean = luauPolyfillModule.Boolean
local object = luauPolyfillModule.Object
local t = {}
local graphQLObjectType = require(parent.GraphQL).GraphQLObjectType
local mapperKind = require(script.Parent.Interfaces).MapperKind
local mapSchemaModule = require(script.Parent.mapSchema)
local mapSchema = mapSchemaModule.mapSchema
local correctASTNodes = mapSchemaModule.correctASTNodes
local addTypes = require(script.Parent.addTypes).addTypes
local map = luauPolyfillModule.Map

function t.appendObjectFields(p1, p2, p3)
	-- upvalues: addTypes (ref), graphQLObjectType (ref), mapSchema (ref), mapperKind (ref), map (ref), correctASTNodes (ref), object (ref)
	return if p1:getType(p2) == nil then addTypes(p1, { graphQLObjectType.new({ name = p2, fields = p3 }) }) else mapSchema(p1, {
		[mapperKind.OBJECT_TYPE] = function(p4)
			-- upvalues: p2 (ref), map (copy), p3 (ref), correctASTNodes (copy), graphQLObjectType (copy), object (copy)
			if p4.name ~= p2 then
				return nil
			end
			local var1 = p4:toConfig()
			local fields = var1.fields
			local var2 = map.new()
			
			for i, v in fields do
				local var3 = v[1]
				var2:set(var3, fields:get(var3))
			end
			for i, v_1 in p3 do
				local var4 = v_1[1]
				var2:set(var4, p3:get(var4))
			end
			return correctASTNodes(graphQLObjectType.new(object.assign({}, var1, { fields = var2 })))
		end
	})
end

function t.removeObjectFields(p5, p6, p7)
	-- upvalues: map (ref), mapSchema (ref), mapperKind (ref), boolean (ref), correctASTNodes (ref), graphQLObjectType (ref), object (ref)
	local var5 = map.new()
	
	return {
		mapSchema(p5, {
			[mapperKind.OBJECT_TYPE] = function(p8)
				-- upvalues: p6 (ref), map (copy), boolean (copy), p7 (ref), var5 (ref), correctASTNodes (copy), graphQLObjectType (copy), object (copy)
				if p8.name ~= p6 then
					return nil
				end
				local var6 = p8:toConfig()
				local fields = var6.fields
				local var7 = map.new()
				
				for i, v in fields do
					local unpacked = table.unpack(v)
					local var8 = fields:get(unpacked)
					
					if boolean.toJSBoolean(p7(unpacked, var8)) then
						var5:set(unpacked, var8)
					else
						var7:set(unpacked, var8)
					end
				end
				return correctASTNodes(graphQLObjectType.new(object.assign({}, var6, { fields = var7 })))
			end
		}),
		var5
	}
end

function t.selectObjectFields(p8, p9, p10)
	-- upvalues: map (ref), mapSchema (ref), mapperKind (ref), boolean (ref)
	local var6 = map.new()
	mapSchema(p8, {
		[tostring(mapperKind.OBJECT_TYPE)] = function(p11)
			-- upvalues: p9 (ref), boolean (copy), p10 (ref), var6 (ref)
			if p11.name == p9 then
				local fields = p11:toConfig().fields
				
				for i, v in fields do
					local var7 = v[1]
					local var8 = fields:get(var7)
					
					if boolean.toJSBoolean(p10(var7, var8)) then
						var6:set(var7, var8)
					end
				end
			end
			return nil
		end
	})
	
	return var6
end

function t.modifyObjectFields(p11, p12, p13, p14)
	-- upvalues: map (ref), mapSchema (ref), mapperKind (ref), boolean (ref), correctASTNodes (ref), graphQLObjectType (ref), object (ref)
	local var7 = map.new()
	
	return {
		mapSchema(p11, {
			[mapperKind.OBJECT_TYPE] = function(p15)
				-- upvalues: p12 (ref), map (copy), boolean (copy), p13 (ref), var7 (ref), p14 (ref), correctASTNodes (copy), graphQLObjectType (copy), object (copy)
				if p15.name ~= p12 then
					return nil
				end
				local var8 = p15:toConfig()
				local fields = var8.fields
				local var9 = map.new()
				
				for i, v in fields do
					local var10 = v[1]
					local var11 = fields:get(var10)
					
					if boolean.toJSBoolean(p13(var10, var11)) then
						var7:set(var10, var11)
					else
						var9:set(var10, var11)
					end
				end
				for i, v_1 in p14 do
					local var12 = v_1[1]
					var9:set(var12, p14:get(var12))
				end
				return correctASTNodes(graphQLObjectType.new(object.assign({}, var8, { fields = var9 })))
			end
		}),
		var7
	}
end

return t