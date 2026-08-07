-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:33:08 2026 Pacific Standard Time.

local parent = script.Parent.Parent
local luauPolyfillModule = require(parent.LuauPolyfill)
local array = luauPolyfillModule.Array
local boolean = luauPolyfillModule.Boolean
local object = luauPolyfillModule.Object
local t = {}
local _ = require(script.Parent.types)
local graphQLModule = require(parent.GraphQL)
local kind = graphQLModule.Kind
local valueFromASTUntyped = graphQLModule.valueFromASTUntyped

local function isTypeWithFields(p0) --[[ line: 31 ]]
	-- upvalues: kind (ref)
	return if p0.kind ~= kind.OBJECT_TYPE_DEFINITION then p0.kind == kind.OBJECT_TYPE_EXTENSION else true
end

function t.getArgumentsWithDirectives(p1) --[[ line: 38 ]]
	-- upvalues: array (ref), isTypeWithFields (ref), boolean (ref), object (ref), valueFromASTUntyped (ref)
	local t = {}
	
	for i, v in array.filter(p1.definitions, isTypeWithFields) do
		if v.fields ~= nil then
			for i_1, v_1 in v.fields do
				local var5 = if typeof(v_1.arguments) == "table" then v_1.arguments else nil
				local var6 = if var5 ~= nil then nil else array.filter(var5, function(p2) --[[ line: 62 ]]
					-- upvalues: boolean (copy)
					return boolean.toJSBoolean(if typeof(p2.directives) == "table" then #p2.directives else nil)
				end)
				
				if boolean.toJSBoolean(if typeof(var6) == "table" then #var6 else nil) then
					t[tostring(("%s.%s"):format(tostring(v.name.value), tostring(v_1.name.value)))] = {}
					local value = t[tostring(("%s.%s"):format(tostring(v.name.value), tostring(v_1.name.value)))]
					
					for i_2, v_2 in var6 do
						value[tostring(v_2.name.value)] = array.map(v_2.directives, function(p3) --[[ line: 84 ]]
							-- upvalues: array (copy), boolean (copy), object (copy), valueFromASTUntyped (copy)
							return {
								name = p3.name.value,
								args = array.reduce(if boolean.toJSBoolean(p3.arguments) then p3.arguments else {}, function(p4, p5) --[[ line: 91 ]]
									-- upvalues: object (copy), valueFromASTUntyped (copy)
									return object.assign({}, p4, { [p5.name.value] = valueFromASTUntyped(p5.value, {}) })
								end, {})
							}
						end)
					end
				end
			end
		end
	end
	return t
end

return t