local parent = script.Parent.Parent.Parent
local luauPolyfillModule = require(parent.LuauPolyfill)
local array = luauPolyfillModule.Array
local boolean = luauPolyfillModule.Boolean
local t = {}
local _ = require(parent.GraphQL)
local _ = require(script.Parent["merge-typedefs_types"])
local compareNodes = require(parent.Utils).compareNodes

local function _(p0, p1)
	-- upvalues: boolean (ref), array (ref)
	return not not boolean.toJSBoolean(array.find(p0, function(p2)
		-- upvalues: p1 (ref)
		return p2.name.value == p1.name.value
	end))
end

function t.mergeNamedTypeArray(p3, p4, p5)
	-- upvalues: array (ref), boolean (ref), compareNodes (ref)
	local var2 = if p3 ~= nil then {} else p3
	local var3 = if p4 ~= nil then {} else p4
	local var4 = if p5 ~= nil then {} else p5
	local var5 = array.concat({}, var3, array.filter(var2, function(p6)
		-- upvalues: boolean (copy), var3 (ref), array (copy)
		return not boolean.toJSBoolean(not not boolean.toJSBoolean(array.find(var3, function(p7)
			-- upvalues: p6 (ref)
			return p7.name.value == p6.name.value
		end)))
	end))
	
	if var4 and boolean.toJSBoolean(var4.sort) then
		array.sort(var5, compareNodes)
	end
	return var5
end

return t