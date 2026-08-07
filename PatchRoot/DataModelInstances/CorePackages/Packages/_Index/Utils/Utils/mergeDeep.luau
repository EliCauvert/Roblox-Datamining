-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:33:09 2026 Pacific Standard Time.

local parent = script.Parent.Parent
local luauPolyfillModule = require(parent.LuauPolyfill)
local array = luauPolyfillModule.Array
local boolean = luauPolyfillModule.Boolean
local object = luauPolyfillModule.Object
local t = {}
local isSymbol = require(parent.Utils.jsHelpers).isSymbol
local isObject = nil

local function mergeDeep(p0, p1) --[[ line: 26 ]]
	-- upvalues: boolean (ref), isObject (write), isSymbol (ref), array (ref), object (ref), mergeDeep (ref)
	local var4 = if p1 ~= nil then false else p1
	local var5 = if boolean.toJSBoolean(p0[1]) then p0[1] else {}
	local t = {}
	
	for i, v in p0 do
		local var7 = isObject(var5)
		
		if boolean.toJSBoolean(if boolean.toJSBoolean(var7) then isObject(v) else var7) then
			for i_1 in v do
				if not isSymbol(i_1) then
					if not boolean.toJSBoolean(isObject(v[tostring(i_1)])) then
						object.assign(t, { [tostring(i_1)] = v[tostring(i_1)] })
					elseif array.indexOf(object.keys(t), tostring(i_1)) == -1 then
						object.assign(t, { [tostring(i_1)] = v[tostring(i_1)] })
					else
						t[i_1] = mergeDeep({ t[i_1], v[i_1] }, var4)
					end
				end
			end
		end
	end
	return t
end

t.mergeDeep = mergeDeep

isObject = function(p2) --[[ line: 98 | named "isObject" ]]
	-- upvalues: boolean (ref), array (ref)
	local var8 = boolean.toJSBoolean(p2)
	
	if var8 then
		var8 = false
		
		if typeof(p2) == "table" then
			var8 = not (array.isArray(p2) and #p2 > 0)
		end
	end
	return var8
end

return t