local parent = script.Parent.Parent.Parent
local luauPolyfillModule = require(parent.LuauPolyfill)
local array = luauPolyfillModule.Array
local boolean = luauPolyfillModule.Boolean
local t = {}
local _ = require(parent.GraphQL)
local _ = require(script.Parent["merge-typedefs_types"])
local compareNodes = require(parent.Utils).compareNodes

local function _(p1, p2)
	-- upvalues: boolean (ref), array (ref)
	return not not boolean.toJSBoolean(array.find(p1, function(p3)
		-- upvalues: p2 (ref)
		return p3.name.value == p2.name.value
	end))
end

function t.mergeNamedTypeArray(p1, p2, p3)
	-- upvalues: array (ref), boolean (ref), compareNodes (ref)
	local var1 = if p1 ~= nil then {} else p1
	local var2 = if p2 ~= nil then {} else p2
	local var3 = if p3 ~= nil then {} else p3
	local var4 = array.concat({}, var2, array.filter(var1, function(p4)
		-- upvalues: boolean (copy), var2 (ref), array (copy)
		return not boolean.toJSBoolean(not not boolean.toJSBoolean(array.find(var2, function(p5)
			-- upvalues: p4 (ref)
			return p5.name.value == p4.name.value
		end)))
	end))
	
	if var3 and boolean.toJSBoolean(var3.sort) then
		array.sort(var4, compareNodes)
	end
	return var4
end

return t