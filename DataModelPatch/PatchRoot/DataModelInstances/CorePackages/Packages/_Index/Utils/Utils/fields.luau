local Parent = script.Parent.Parent
local LuauPolyfillModule = require(Parent.LuauPolyfill)
local Boolean = LuauPolyfillModule.Boolean
local Object = LuauPolyfillModule.Object
local GraphQLObjectType = require(Parent.GraphQL).GraphQLObjectType
local MapperKind = require(script.Parent.Interfaces).MapperKind
local MapSchemaModule = require(script.Parent.mapSchema)
local MapSchemaFunction = MapSchemaModule.mapSchema
local CorrectASTNodesFunction = MapSchemaModule.correctASTNodes
local AddTypesFunction = require(script.Parent.addTypes).addTypes
local Map = LuauPolyfillModule.Map

return {
	appendObjectFields = function(p1, Name, Fields)
		-- upvalues: AddTypesFunction (copy), GraphQLObjectType (copy), MapSchemaFunction (copy), MapperKind (copy), Map (copy), CorrectASTNodesFunction (copy), Object (copy)
		return if p1:getType(Name) == nil then AddTypesFunction(p1, { GraphQLObjectType.new({ name = Name, fields = Fields }) }) else MapSchemaFunction(p1, {
			[MapperKind.OBJECT_TYPE] = function(p2)
				-- upvalues: Name (copy), Map (upval), Fields (copy), CorrectASTNodesFunction (upval), GraphQLObjectType (upval), Object (upval)
				if p2.name ~= Name then
					return nil
				end
				local Config = p2:toConfig()
				local Fields1 = Config.fields
				local NewMap = Map.new()
				
				for _, value in Fields1 do
					local v1 = value[1]
					NewMap:set(v1, Fields1:get(v1))
				end
				for _, field in Fields do
					local v2 = field[1]
					NewMap:set(v2, Fields:get(v2))
				end
				return (CorrectASTNodesFunction(GraphQLObjectType.new(Object.assign({}, Config, { fields = NewMap }))))
			end
		})
	end,
	removeObjectFields = function(p3, Name, Callback)
		-- upvalues: Map (copy), MapSchemaFunction (copy), MapperKind (copy), Boolean (copy), CorrectASTNodesFunction (copy), GraphQLObjectType (copy), Object (copy)
		local NewMap = Map.new()
		
		return {
			MapSchemaFunction(p3, {
				[MapperKind.OBJECT_TYPE] = function(p4)
					-- upvalues: Name (copy), Map (upval), Boolean (upval), Callback (copy), NewMap (copy), CorrectASTNodesFunction (upval), GraphQLObjectType (upval), Object (upval)
					if p4.name ~= Name then
						return nil
					end
					local Config = p4:toConfig()
					local Fields = Config.fields
					local NewMap1 = Map.new()
					
					for _, field in Fields do
						local Unpacked = table.unpack(field)
						local GetResult = Fields:get(Unpacked)
						
						if Boolean.toJSBoolean(Callback(Unpacked, GetResult)) then
							NewMap:set(Unpacked, GetResult)
						else
							NewMap1:set(Unpacked, GetResult)
						end
					end
					return (CorrectASTNodesFunction(GraphQLObjectType.new(Object.assign({}, Config, { fields = NewMap1 }))))
				end
			}),
			NewMap
		}
	end,
	selectObjectFields = function(p4, Name, Callback)
		-- upvalues: Map (copy), MapSchemaFunction (copy), MapperKind (copy), Boolean (copy)
		local NewMap = Map.new()
		MapSchemaFunction(p4, {
			[tostring(MapperKind.OBJECT_TYPE)] = function(p5)
				-- upvalues: Name (copy), Boolean (upval), Callback (copy), NewMap (copy)
				if p5.name == Name then
					local Fields = p5:toConfig().fields
					
					for _, field in Fields do
						local v3 = field[1]
						local GetResult = Fields:get(v3)
						
						if Boolean.toJSBoolean(Callback(v3, GetResult)) then
							NewMap:set(v3, GetResult)
						end
					end
				end
				return nil
			end
		})
		
		return NewMap
	end,
	modifyObjectFields = function(p5, Name, Callback, p6)
		-- upvalues: Map (copy), MapSchemaFunction (copy), MapperKind (copy), Boolean (copy), CorrectASTNodesFunction (copy), GraphQLObjectType (copy), Object (copy)
		local NewMap = Map.new()
		
		return {
			MapSchemaFunction(p5, {
				[MapperKind.OBJECT_TYPE] = function(p7)
					-- upvalues: Name (copy), Map (upval), Boolean (upval), Callback (copy), NewMap (copy), p6 (copy), CorrectASTNodesFunction (upval), GraphQLObjectType (upval), Object (upval)
					if p7.name ~= Name then
						return nil
					end
					local Config = p7:toConfig()
					local Fields = Config.fields
					local NewMap1 = Map.new()
					
					for _, field in Fields do
						local v3 = field[1]
						local GetResult = Fields:get(v3)
						
						if Boolean.toJSBoolean(Callback(v3, GetResult)) then
							NewMap:set(v3, GetResult)
						else
							NewMap1:set(v3, GetResult)
						end
					end
					for _, value in p6 do
						local v4 = value[1]
						NewMap1:set(v4, (p6:get(v4)))
					end
					return (CorrectASTNodesFunction(GraphQLObjectType.new(Object.assign({}, Config, { fields = NewMap1 }))))
				end
			}),
			NewMap
		}
	end
}