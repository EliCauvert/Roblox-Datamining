local parent = script.Parent.Parent.Parent
local luauPolyfillModule = require(parent.LuauPolyfill)
local array = luauPolyfillModule.Array
local boolean = luauPolyfillModule.Boolean
local map = luauPolyfillModule.Map
local t = {}
local _ = require(parent.GraphQL)
local mergeDirectives = require(script.Parent.directives).mergeDirectives
local _ = require(script.Parent["merge-typedefs_types"])
local compareNodes = require(parent.Utils).compareNodes

function t.mergeEnumValues(p1, p2, p3)
	-- upvalues: boolean (ref), array (ref), map (ref), mergeDirectives (ref), compareNodes (ref)
	if boolean.toJSBoolean(if typeof(p3) == "table" then p3.consistentEnumMerge else nil) then
		local t = {}
		
		if boolean.toJSBoolean(p1) then
			t = array.concat(t, p1)
		end
		p1 = p2
		p2 = t
	end
	local var1 = map.new()
	
	if p1 then
		for i, v in p1 do
			var1:set(v.name.value, v)
		end
	end
	if p2 then
		for i, v in p2 do
			local value = v.name.value
			
			if boolean.toJSBoolean(var1:has(value)) then
				local var2 = var1:get(value)
				var2.description = if boolean.toJSBoolean(v.description) then v.description else var2.description
				var2.directives = mergeDirectives(v.directives, var2.directives)
			else
				var1:set(value, v)
			end
		end
	end
	local var3 = array.concat({}, var1:values())
	
	if p3 and boolean.toJSBoolean(p3.sort) then
		array.sort(var3, compareNodes)
	end
	return var3
end

return t