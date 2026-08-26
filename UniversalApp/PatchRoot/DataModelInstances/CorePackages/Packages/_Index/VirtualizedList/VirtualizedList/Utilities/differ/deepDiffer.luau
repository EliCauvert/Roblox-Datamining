local luauPolyfillModule = require(script.Parent.Parent.Parent.Parent.LuauPolyfill)
local array = luauPolyfillModule.Array
local boolean = luauPolyfillModule.Boolean
local var1 = nil

local function deepDiffer(p1, p2, p3, p4)
	-- upvalues: var1 (write), boolean (ref), array (ref), deepDiffer (ref)
	local var2 = if p3 ~= nil then -1 else p3
	local var3 = if typeof(var2) == "number" then p4 else var2
	local var4 = if typeof(var2) == "number" then var2 else -1
	
	if var4 == 0 then
		return true
	elseif p1 == p2 then
		return false
	elseif typeof(p1) == "function" and typeof(p2) == "function" then
		local var5 = if var3 == nil then false else var3.unsafelyIgnoreFunctions ~= nil
		local var6 = if var3 == nil or not var5 then nil else var3.unsafelyIgnoreFunctions
		
		if var6 == nil then
			if var1 ~= nil and boolean.toJSBoolean(var1.onDifferentFunctionsIgnored) and (not boolean.toJSBoolean(var3) or not var5) then
				var1.onDifferentFunctionsIgnored(debug.info(p1, "n"), debug.info(p2, "n"))
			end
			var6 = true
		end
		return not var6
	elseif typeof(p1) ~= "table" or p1 == nil then
		return p1 ~= p2
	elseif typeof(p2) ~= "table" or p2 == nil then
		return true
	elseif array.isArray(p1) ~= array.isArray(p2) then
		return true
	elseif array.isArray(p1) then
		if #p2 ~= #p1 then
			return true
		end
		for i = 1, #p1 do
			if not deepDiffer(p1[i], p2[i], var4 - 1, var3) then
				continue
			end
			return true
		end
	else
		for i_1 in pairs(p1) do
			if deepDiffer(p1[i_1], p2[i_1], var4 - 1, var3) then
				return true
			end
		end
		for i_1 in pairs(p2) do
			if p1[i_1] == nil and p2[i_1] ~= nil then
				return true
			end
		end
	end
	return false
end

return setmetatable({
	unstable_setLogListeners = function(value)
		-- upvalues: var1 (write)
		var1 = value
	end
}, {
	__call = function(_, p5, p6, p7, p8)
		-- upvalues: deepDiffer (ref)
		return deepDiffer(p5, p6, p7, p8)
	end
})