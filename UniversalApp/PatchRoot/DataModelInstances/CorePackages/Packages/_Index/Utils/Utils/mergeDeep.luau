local parent = script.Parent.Parent
local luauPolyfillModule = require(parent.LuauPolyfill)
local array = luauPolyfillModule.Array
local boolean = luauPolyfillModule.Boolean
local object = luauPolyfillModule.Object
local t = {}
local isSymbol = require(parent.Utils.jsHelpers).isSymbol
local isObject = nil

local function mergeDeep(p1, p2)
	-- upvalues: boolean (ref), isObject (write), isSymbol (ref), array (ref), object (ref), mergeDeep (ref)
	local var1 = if p2 ~= nil then false else p2
	local var2 = if boolean.toJSBoolean(p1[1]) then p1[1] else {}
	local t = {}
	
	for i, v in p1 do
		local var3 = isObject(var2)
		
		if boolean.toJSBoolean(if boolean.toJSBoolean(var3) then isObject(v) else var3) then
			for i_1 in v do
				if not isSymbol(i_1) then
					if not boolean.toJSBoolean(isObject(v[tostring(i_1)])) then
						object.assign(t, { [tostring(i_1)] = v[tostring(i_1)] })
					elseif array.indexOf(object.keys(t), tostring(i_1)) == -1 then
						object.assign(t, { [tostring(i_1)] = v[tostring(i_1)] })
					else
						t[i_1] = mergeDeep({ t[i_1], v[i_1] }, var1)
					end
				end
			end
		end
	end
	return t
end

t.mergeDeep = mergeDeep

isObject = function(p3)
	-- upvalues: boolean (ref), array (ref)
	local var4 = boolean.toJSBoolean(p3)
	
	if var4 then
		var4 = false
		
		if typeof(p3) == "table" then
			var4 = not (array.isArray(p3) and #p3 > 0)
		end
	end
	return var4
end

return t