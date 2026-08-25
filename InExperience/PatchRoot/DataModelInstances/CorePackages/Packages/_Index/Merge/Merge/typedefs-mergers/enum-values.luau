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

function t.mergeEnumValues(p0, p1, p2)
	-- upvalues: boolean (ref), array (ref), map (ref), mergeDirectives (ref), compareNodes (ref)
	if boolean.toJSBoolean(if typeof(p2) == "table" then p2.consistentEnumMerge else nil) then
		local t = {}
		
		if boolean.toJSBoolean(p0) then
			t = array.concat(t, p0)
		end
		p0 = p1
		p1 = t
	end
	local var3 = map.new()
	
	if p0 then
		for i, v in p0 do
			var3:set(v.name.value, v)
		end
	end
	if p1 then
		for i, v in p1 do
			local value = v.name.value
			
			if boolean.toJSBoolean(var3:has(value)) then
				local var4 = var3:get(value)
				var4.description = if boolean.toJSBoolean(v.description) then v.description else var4.description
				var4.directives = mergeDirectives(v.directives, var4.directives)
			else
				var3:set(value, v)
			end
		end
	end
	local var5 = array.concat({}, var3:values())
	
	if p2 and boolean.toJSBoolean(p2.sort) then
		array.sort(var5, compareNodes)
	end
	return var5
end

return t