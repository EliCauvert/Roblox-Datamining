local luauPolyfillModule = require(script.Parent.Parent.Parent.Parent.LuauPolyfill)
local array = luauPolyfillModule.Array
local boolean = luauPolyfillModule.Boolean
local var1 = nil

local function deepDiffer(p0, p1, p2, p3)
	-- upvalues: var1 (write), boolean (ref), array (ref), deepDiffer (ref)
	local var3 = if p2 ~= nil then -1 else p2
	local var4 = if typeof(var3) == "number" then p3 else var3
	local var5 = if typeof(var3) == "number" then var3 else -1
	
	if var5 == 0 then
		return true
	elseif p0 == p1 then
		return false
	elseif typeof(p0) == "function" and typeof(p1) == "function" then
		local var6 = if var4 == nil then false else var4.unsafelyIgnoreFunctions ~= nil
		local var7 = if var4 == nil or not var6 then nil else var4.unsafelyIgnoreFunctions
		
		if var7 == nil then
			if var1 ~= nil and boolean.toJSBoolean(var1.onDifferentFunctionsIgnored) and (not boolean.toJSBoolean(var4) or not var6) then
				var1.onDifferentFunctionsIgnored(debug.info(p0, "n"), debug.info(p1, "n"))
			end
			var7 = true
		end
		return not var7
	elseif typeof(p0) ~= "table" or p0 == nil then
		return p0 ~= p1
	elseif typeof(p1) ~= "table" or p1 == nil then
		return true
	elseif array.isArray(p0) ~= array.isArray(p1) then
		return true
	elseif array.isArray(p0) then
		if #p1 ~= #p0 then
			return true
		end
		for i = 1, #p0 do
			if not deepDiffer(p0[i], p1[i], var5 - 1, var4) then
				continue
			end
			return true
		end
	else
		for i_1 in pairs(p0) do
			if deepDiffer(p0[i_1], p1[i_1], var5 - 1, var4) then
				return true
			end
		end
		for i_1 in pairs(p1) do
			if p0[i_1] == nil and p1[i_1] ~= nil then
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
	__call = function(_, p4, p5, p6, p7)
		-- upvalues: deepDiffer (ref)
		return deepDiffer(p4, p5, p6, p7)
	end
})