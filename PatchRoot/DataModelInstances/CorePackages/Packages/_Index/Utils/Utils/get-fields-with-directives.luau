-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:33:08 2026 Pacific Standard Time.

local parent = script.Parent.Parent
local luauPolyfillModule = require(parent.LuauPolyfill)
local array = luauPolyfillModule.Array
local boolean = luauPolyfillModule.Boolean
local object = luauPolyfillModule.Object
local t = {}
local valueFromASTUntyped = require(parent.GraphQL).valueFromASTUntyped
local _ = require(script.Parent.types)

function t.getFieldsWithDirectives(p0, p1) --[[ line: 35 ]]
	-- upvalues: boolean (ref), array (ref), object (ref), valueFromASTUntyped (ref)
	local var2 = if p1 ~= nil then {} else p1
	local t = {}
	local list = { "ObjectTypeDefinition", "ObjectTypeExtension" }
	
	if boolean.toJSBoolean(var2.includeInputTypes) then
		list = array.concat({}, list, { "InputObjectTypeDefinition", "InputObjectTypeExtension" })
	end
	for i, v in array.filter(p0.definitions, function(p2) --[[ line: 45 ]]
		-- upvalues: array (copy), list (write)
		return array.includes(list, p2.kind)
	end) do
		local value = v.name.value
		
		if v.fields ~= nil then
			for i_1, v_1 in v.fields do
				if boolean.toJSBoolean(v_1.directives) and #v_1.directives > 0 then
					t[tostring(("%s.%s"):format(tostring(value), tostring(v_1.name.value)))] = array.map(v_1.directives, function(p3) --[[ line: 70 ]]
						-- upvalues: array (copy), boolean (copy), object (copy), valueFromASTUntyped (copy)
						return {
							name = p3.name.value,
							args = array.reduce(if boolean.toJSBoolean(p3.arguments) then p3.arguments else {}, function(p4, p5) --[[ line: 77 ]]
								-- upvalues: object (copy), valueFromASTUntyped (copy)
								return object.assign({}, p4, { [p5.name.value] = valueFromASTUntyped(p5.value, nil) })
							end, {})
						}
					end)
				end
			end
		end
	end
	return t
end

return t