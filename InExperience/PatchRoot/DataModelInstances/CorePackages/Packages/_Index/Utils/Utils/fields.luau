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

function t.appendObjectFields(p0, p1, p2) --[[ line: 41 ]]
	-- upvalues: addTypes (ref), graphQLObjectType (ref), mapSchema (ref), mapperKind (ref), map (ref), correctASTNodes (ref), object (ref)
	return if p0:getType(p1) == nil then addTypes(p0, { graphQLObjectType.new({ name = p1, fields = p2 }) }) else mapSchema(p0, {
		[mapperKind.OBJECT_TYPE] = function(p3) --[[ line: 54 ]]
			-- upvalues: p1 (ref), map (copy), p2 (ref), correctASTNodes (copy), graphQLObjectType (copy), object (copy)
			if p3.name ~= p1 then
				return nil
			end
			local var3 = p3:toConfig()
			local fields = var3.fields
			local var4 = map.new()
			
			for i, v in fields do
				local var6 = v[1]
				var4:set(var6, fields:get(var6))
			end
			for i, v_1 in p2 do
				local var5 = v_1[1]
				var4:set(var5, p2:get(var5))
			end
			return correctASTNodes(graphQLObjectType.new(object.assign({}, var3, { fields = var4 })))
		end
	})
end

function t.removeObjectFields(p4, p5, p6) --[[ line: 100 ]]
	-- upvalues: map (ref), mapSchema (ref), mapperKind (ref), boolean (ref), correctASTNodes (ref), graphQLObjectType (ref), object (ref)
	local var7 = map.new()
	
	return {
		mapSchema(p4, {
			[mapperKind.OBJECT_TYPE] = function(p7) --[[ line: 112 ]]
				-- upvalues: p5 (ref), map (copy), boolean (copy), p6 (ref), var7 (ref), correctASTNodes (copy), graphQLObjectType (copy), object (copy)
				if p7.name ~= p5 then
					return nil
				end
				local var8 = p7:toConfig()
				local fields = var8.fields
				local var9 = map.new()
				
				for i, v in fields do
					local unpacked = table.unpack(v)
					local var11 = fields:get(unpacked)
					
					if boolean.toJSBoolean(p6(unpacked, var11)) then
						var7:set(unpacked, var11)
					else
						var9:set(unpacked, var11)
					end
				end
				return correctASTNodes(graphQLObjectType.new(object.assign({}, var8, { fields = var9 })))
			end
		}),
		var7
	}
end

function t.selectObjectFields(p8, p9, p10) --[[ line: 160 ]]
	-- upvalues: map (ref), mapSchema (ref), mapperKind (ref), boolean (ref)
	local var12 = map.new()
	mapSchema(p8, {
		[tostring(mapperKind.OBJECT_TYPE)] = function(p11) --[[ line: 170 ]]
			-- upvalues: p9 (ref), boolean (copy), p10 (ref), var12 (ref)
			if p11.name == p9 then
				local fields = p11:toConfig().fields
				
				for i, v in fields do
					local var13 = v[1]
					local var14 = fields:get(var13)
					
					if boolean.toJSBoolean(p10(var13, var14)) then
						var12:set(var13, var14)
					end
				end
			end
			return nil
		end
	})
	
	return var12
end

function t.modifyObjectFields(p12, p13, p14, p15) --[[ line: 200 ]]
	-- upvalues: map (ref), mapSchema (ref), mapperKind (ref), boolean (ref), correctASTNodes (ref), graphQLObjectType (ref), object (ref)
	local var15 = map.new()
	
	return {
		mapSchema(p12, {
			[mapperKind.OBJECT_TYPE] = function(p16) --[[ line: 213 ]]
				-- upvalues: p13 (ref), map (copy), boolean (copy), p14 (ref), var15 (ref), p15 (ref), correctASTNodes (copy), graphQLObjectType (copy), object (copy)
				if p16.name ~= p13 then
					return nil
				end
				local var16 = p16:toConfig()
				local fields = var16.fields
				local var17 = map.new()
				
				for i, v in fields do
					local var19 = v[1]
					local var20 = fields:get(var19)
					
					if boolean.toJSBoolean(p14(var19, var20)) then
						var15:set(var19, var20)
					else
						var17:set(var19, var20)
					end
				end
				for i, v_1 in p15 do
					local var18 = v_1[1]
					var17:set(var18, p15:get(var18))
				end
				return correctASTNodes(graphQLObjectType.new(object.assign({}, var16, { fields = var17 })))
			end
		}),
		var15
	}
end

return t