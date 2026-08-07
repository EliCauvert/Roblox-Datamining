local parent = script.Parent.Parent
local boolean = require(parent.LuauPolyfill).Boolean
local t = {}
local mapSchema = require(script.Parent.mapSchema).mapSchema
local _ = require(parent.GraphQL)
local _ = require(script.Parent.types)
local mapperKind = require(script.Parent.Interfaces).MapperKind

function t.extractExtensionsFromSchema(p0) --[[ line: 42 ]]
	-- upvalues: boolean (ref), mapSchema (ref), mapperKind (ref)
	local t = {
		schemaExtensions = if boolean.toJSBoolean(p0.extensions) then p0.extensions else {},
		types = {}
	}
	mapSchema(p0, {
		[tostring(mapperKind.OBJECT_TYPE)] = function(p1) --[[ line: 48 ]]
			-- upvalues: t (ref), boolean (copy)
			t.types[tostring(p1.name)] = {
				type = "object",
				fields = {},
				extensions = if boolean.toJSBoolean(p1.extensions) then p1.extensions else {}
			}
			
			return p1
		end,
		[tostring(mapperKind.INTERFACE_TYPE)] = function(p2) --[[ line: 59 ]]
			-- upvalues: t (ref), boolean (copy)
			t.types[tostring(p2.name)] = {
				type = "interface",
				fields = {},
				extensions = if boolean.toJSBoolean(p2.extensions) then p2.extensions else {}
			}
			
			return p2
		end,
		[tostring(mapperKind.FIELD)] = function(p3, p4, p5) --[[ line: 73 ]]
			-- upvalues: t (ref), boolean (copy)
			t.types[p5].fields[p4] = {
				arguments = {},
				extensions = if boolean.toJSBoolean(p3.extensions) then p3.extensions else {}
			}
			local args = p3.args
			
			if args ~= nil then
				for i, v in args do
					local unpacked = table.unpack(v)
					t.types[p5].fields[p4].arguments[tostring(unpacked)] = if boolean.toJSBoolean(args[tostring(unpacked)].extensions) then args[tostring(unpacked)].extensions else {}
				end
			end
			return p3
		end,
		[tostring(mapperKind.ENUM_TYPE)] = function(p6) --[[ line: 110 ]]
			-- upvalues: t (ref), boolean (copy)
			t.types[tostring(p6.name)] = {
				type = "enum",
				values = {},
				extensions = if boolean.toJSBoolean(p6.extensions) then p6.extensions else {}
			}
			
			return p6
		end,
		[tostring(mapperKind.ENUM_VALUE)] = function(p7, p8, _, p9) --[[ line: 121 ]]
			-- upvalues: t (ref), boolean (copy)
			t.types[p8].values[p9] = if boolean.toJSBoolean(p7.extensions) then p7.extensions else {}
			
			return p7
		end,
		[tostring(mapperKind.SCALAR_TYPE)] = function(p10) --[[ line: 135 ]]
			-- upvalues: t (ref), boolean (copy)
			t.types[tostring(p10.name)] = {
				type = "scalar",
				extensions = if boolean.toJSBoolean(p10.extensions) then p10.extensions else {}
			}
			
			return p10
		end,
		[tostring(mapperKind.UNION_TYPE)] = function(p11) --[[ line: 145 ]]
			-- upvalues: t (ref), boolean (copy)
			t.types[tostring(p11.name)] = {
				type = "union",
				extensions = if boolean.toJSBoolean(p11.extensions) then p11.extensions else {}
			}
			
			return p11
		end,
		[tostring(mapperKind.INPUT_OBJECT_TYPE)] = function(p12) --[[ line: 155 ]]
			-- upvalues: t (ref), boolean (copy)
			t.types[tostring(p12.name)] = {
				type = "input",
				fields = {},
				extensions = if boolean.toJSBoolean(p12.extensions) then p12.extensions else {}
			}
			
			return p12
		end,
		[tostring(mapperKind.INPUT_OBJECT_FIELD)] = function(p13, p14, p15) --[[ line: 166 ]]
			-- upvalues: t (ref), boolean (copy)
			t.types[p15].fields[p14] = {
				extensions = if boolean.toJSBoolean(p13.extensions) then p13.extensions else {}
			}
			
			return p13
		end
	})
	
	return t
end

return t