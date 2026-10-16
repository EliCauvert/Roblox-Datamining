local Parent = script.Parent.Parent
local Boolean = require(Parent.LuauPolyfill).Boolean
local MapSchemaFunction = require(script.Parent.mapSchema).mapSchema
local _ = require(Parent.GraphQL)
local _ = require(script.Parent.types)
local MapperKind = require(script.Parent.Interfaces).MapperKind

return {
	extractExtensionsFromSchema = function(p1) --[[ Line: 42 ]]
		-- upvalues: Boolean (copy), MapSchemaFunction (copy), MapperKind (copy)
		local config = {
			schemaExtensions = Boolean.toJSBoolean(p1.extensions) and p1.extensions or {},
			types = {}
		}
		MapSchemaFunction(p1, {
			[tostring(MapperKind.OBJECT_TYPE)] = function(p2) --[[ Line: 48 ]]
				-- upvalues: config (copy), Boolean (upval)
				config.types[tostring(p2.name)] = {
					type = "object",
					fields = {},
					extensions = Boolean.toJSBoolean(p2.extensions) and p2.extensions or {}
				}
				
				return p2
			end,
			[tostring(MapperKind.INTERFACE_TYPE)] = function(p2) --[[ Line: 59 ]]
				-- upvalues: config (copy), Boolean (upval)
				config.types[tostring(p2.name)] = {
					type = "interface",
					fields = {},
					extensions = if Boolean.toJSBoolean(p2.extensions) then p2.extensions else {}
				}
				
				return p2
			end,
			[tostring(MapperKind.FIELD)] = function(p2, p3, p4) --[[ Line: 73 ]]
				-- upvalues: config (copy), Boolean (upval)
				config.types[p4].fields[p3] = {
					arguments = {},
					extensions = if Boolean.toJSBoolean(p2.extensions) then p2.extensions else {}
				}
				local Args = p2.args
				
				if Args ~= nil then
					for _, arg in Args do
						local Unpacked = table.unpack(arg)
						config.types[p4].fields[p3].arguments[tostring(Unpacked)] = Boolean.toJSBoolean(Args[tostring(Unpacked)].extensions) and Args[tostring(Unpacked)].extensions or {}
					end
				end
				return p2
			end,
			[tostring(MapperKind.ENUM_TYPE)] = function(p5) --[[ Line: 110 ]]
				-- upvalues: config (copy), Boolean (upval)
				config.types[tostring(p5.name)] = {
					type = "enum",
					values = {},
					extensions = Boolean.toJSBoolean(p5.extensions) and p5.extensions or {}
				}
				
				return p5
			end,
			[tostring(MapperKind.ENUM_VALUE)] = function(p5, p6, _, p7) --[[ Line: 121 ]]
				-- upvalues: config (copy), Boolean (upval)
				config.types[p6].values[p7] = Boolean.toJSBoolean(p5.extensions) and p5.extensions or {}
				
				return p5
			end,
			[tostring(MapperKind.SCALAR_TYPE)] = function(p5) --[[ Line: 135 ]]
				-- upvalues: config (copy), Boolean (upval)
				config.types[tostring(p5.name)] = {
					type = "scalar",
					extensions = Boolean.toJSBoolean(p5.extensions) and p5.extensions or {}
				}
				
				return p5
			end,
			[tostring(MapperKind.UNION_TYPE)] = function(p5) --[[ Line: 145 ]]
				-- upvalues: config (copy), Boolean (upval)
				config.types[tostring(p5.name)] = {
					type = "union",
					extensions = Boolean.toJSBoolean(p5.extensions) and p5.extensions or {}
				}
				
				return p5
			end,
			[tostring(MapperKind.INPUT_OBJECT_TYPE)] = function(p5) --[[ Line: 155 ]]
				-- upvalues: config (copy), Boolean (upval)
				config.types[tostring(p5.name)] = {
					type = "input",
					fields = {},
					extensions = Boolean.toJSBoolean(p5.extensions) and p5.extensions or {}
				}
				
				return p5
			end,
			[tostring(MapperKind.INPUT_OBJECT_FIELD)] = function(p5, p6, p7) --[[ Line: 166 ]]
				-- upvalues: config (copy), Boolean (upval)
				config.types[p7].fields[p6] = {
					extensions = Boolean.toJSBoolean(p5.extensions) and p5.extensions or {}
				}
				
				return p5
			end
		})
		
		return config
	end
}