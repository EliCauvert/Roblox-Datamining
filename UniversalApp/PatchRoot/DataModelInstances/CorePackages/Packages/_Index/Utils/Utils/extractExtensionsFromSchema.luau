local parent = script.Parent.Parent
local boolean = require(parent.LuauPolyfill).Boolean
local t = {}
local mapSchema = require(script.Parent.mapSchema).mapSchema
local _ = require(parent.GraphQL)
local _ = require(script.Parent.types)
local mapperKind = require(script.Parent.Interfaces).MapperKind

function t.extractExtensionsFromSchema(p1)
	-- upvalues: boolean (ref), mapSchema (ref), mapperKind (ref)
	local t = {
		schemaExtensions = if boolean.toJSBoolean(p1.extensions) then p1.extensions else {},
		types = {}
	}
	mapSchema(p1, {
		[tostring(mapperKind.OBJECT_TYPE)] = function(p2)
			-- upvalues: t (ref), boolean (copy)
			t.types[tostring(p2.name)] = {
				type = "object",
				fields = {},
				extensions = if boolean.toJSBoolean(p2.extensions) then p2.extensions else {}
			}
			
			return p2
		end,
		[tostring(mapperKind.INTERFACE_TYPE)] = function(p2)
			-- upvalues: t (ref), boolean (copy)
			t.types[tostring(p2.name)] = {
				type = "interface",
				fields = {},
				extensions = if boolean.toJSBoolean(p2.extensions) then p2.extensions else {}
			}
			
			return p2
		end,
		[tostring(mapperKind.FIELD)] = function(p2, p3, p4)
			-- upvalues: t (ref), boolean (copy)
			t.types[p4].fields[p3] = {
				arguments = {},
				extensions = if boolean.toJSBoolean(p2.extensions) then p2.extensions else {}
			}
			local args = p2.args
			
			if args ~= nil then
				for i, v in args do
					local unpacked = table.unpack(v)
					t.types[p4].fields[p3].arguments[tostring(unpacked)] = if boolean.toJSBoolean(args[tostring(unpacked)].extensions) then args[tostring(unpacked)].extensions else {}
				end
			end
			return p2
		end,
		[tostring(mapperKind.ENUM_TYPE)] = function(p5)
			-- upvalues: t (ref), boolean (copy)
			t.types[tostring(p5.name)] = {
				type = "enum",
				values = {},
				extensions = if boolean.toJSBoolean(p5.extensions) then p5.extensions else {}
			}
			
			return p5
		end,
		[tostring(mapperKind.ENUM_VALUE)] = function(p5, p6, _, p7)
			-- upvalues: t (ref), boolean (copy)
			t.types[p6].values[p7] = if boolean.toJSBoolean(p5.extensions) then p5.extensions else {}
			
			return p5
		end,
		[tostring(mapperKind.SCALAR_TYPE)] = function(p5)
			-- upvalues: t (ref), boolean (copy)
			t.types[tostring(p5.name)] = {
				type = "scalar",
				extensions = if boolean.toJSBoolean(p5.extensions) then p5.extensions else {}
			}
			
			return p5
		end,
		[tostring(mapperKind.UNION_TYPE)] = function(p5)
			-- upvalues: t (ref), boolean (copy)
			t.types[tostring(p5.name)] = {
				type = "union",
				extensions = if boolean.toJSBoolean(p5.extensions) then p5.extensions else {}
			}
			
			return p5
		end,
		[tostring(mapperKind.INPUT_OBJECT_TYPE)] = function(p5)
			-- upvalues: t (ref), boolean (copy)
			t.types[tostring(p5.name)] = {
				type = "input",
				fields = {},
				extensions = if boolean.toJSBoolean(p5.extensions) then p5.extensions else {}
			}
			
			return p5
		end,
		[tostring(mapperKind.INPUT_OBJECT_FIELD)] = function(p5, p6, p7)
			-- upvalues: t (ref), boolean (copy)
			t.types[p7].fields[p6] = {
				extensions = if boolean.toJSBoolean(p5.extensions) then p5.extensions else {}
			}
			
			return p5
		end
	})
	
	return t
end

return t