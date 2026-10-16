local Parent = script.Parent.Parent
local LuauPolyfillModule = require(Parent.LuauPolyfill)
local Array = LuauPolyfillModule.Array
local Boolean = LuauPolyfillModule.Boolean
local Object = LuauPolyfillModule.Object
local IsSymbolFunction = require(Parent.Utils.jsHelpers).isSymbol
local Callback = nil

local function mergeDeep(Entry, p1) --[[ Line: 26 ]]
	-- upvalues: Boolean (copy), Callback (ref), IsSymbolFunction (copy), Array (copy), Object (copy), mergeDeep (copy)
	local P0 = p1 ~= nil and p1
	local Entry1 = if Boolean.toJSBoolean(Entry[1]) then Entry[1] else {}
	local t = {}
	
	for _, value in Entry do
		local ToJSBooleanFunction = Boolean.toJSBoolean
		local CallbackResult = Callback(Entry1)
		
		if ToJSBooleanFunction(if Boolean.toJSBoolean(CallbackResult) then Callback(value) else CallbackResult) then
			for i in value do
				if not IsSymbolFunction(i) then
					if not Boolean.toJSBoolean(Callback(value[tostring(i)])) then
						Object.assign(t, { [tostring(i)] = value[tostring(i)] })
					elseif Array.indexOf(Object.keys(t), (tostring(i))) == -1 then
						Object.assign(t, { [tostring(i)] = value[tostring(i)] })
					else
						t[i] = mergeDeep({ t[i], value[i] }, P0)
					end
				end
			end
		end
	end
	return t
end

Callback = function(p2): boolean --[[ Line: 98 | Named "isObject" ]]
	-- upvalues: Boolean (copy), Array (copy)
	return Boolean.toJSBoolean(p2) and (typeof(p2) == "table" and not (Array.isArray(p2) and #p2 > 0))
end

return { mergeDeep = mergeDeep }