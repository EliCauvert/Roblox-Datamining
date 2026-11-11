local LuauPolyfillModule = require(script.Parent.Parent.Parent.Parent.LuauPolyfill)
local Array = LuauPolyfillModule.Array
local Boolean = LuauPolyfillModule.Boolean
local v1 = nil

local function deepDiffer(List, List1, p1, p2): boolean
	-- upvalues: v1 (ref), Boolean (copy), Array (copy), deepDiffer (copy)
	local v2 = if p1 == nil then -1 else p1
	local v3 = if typeof(v2) == "number" then p2 else v2
	local v4 = if typeof(v2) == "number" then v2 else -1
	
	if v4 == 0 then
		return true
	end
	if List == List1 then
		return false
	end
	if typeof(List) == "function" and typeof(List1) == "function" then
		local HasUnsafelyIgnoreFunctions: boolean = v3 ~= nil and v3.unsafelyIgnoreFunctions ~= nil
		local UnsafelyIgnoreFunctions = if v3 == nil or not HasUnsafelyIgnoreFunctions then nil else v3.unsafelyIgnoreFunctions
		
		if UnsafelyIgnoreFunctions == nil then
			if v1 ~= nil and Boolean.toJSBoolean(v1.onDifferentFunctionsIgnored) and (not Boolean.toJSBoolean(v3) or not HasUnsafelyIgnoreFunctions) then
				v1.onDifferentFunctionsIgnored(debug.info(List, "n"), debug.info(List1, "n"))
			end
			UnsafelyIgnoreFunctions = true
		end
		return not UnsafelyIgnoreFunctions
	else
		if typeof(List) ~= "table" or List == nil then
			return List ~= List1
		end
		if typeof(List1) ~= "table" or List1 == nil then
			return true
		end
		if Array.isArray(List) ~= Array.isArray(List1) then
			return true
		end
		if Array.isArray(List) then
			if #List1 ~= #List then
				return true
			end
			for i = 1, #List do
				if deepDiffer(List[i], List1[i], v4 - 1, v3) then
					return true
				end
			end
		else
			for i1 in pairs(List) do
				if deepDiffer(List[i1], List1[i1], v4 - 1, v3) then
					return true
				end
			end
			for i2 in pairs(List1) do
				if List[i2] == nil and List1[i2] ~= nil then
					return true
				end
			end
		end
		return false
	end
end

return (setmetatable({
	unstable_setLogListeners = function(p3)
		-- upvalues: v1 (ref)
		v1 = p3
	end
}, {
	__call = function(_, p3, p4, p5, p6)
		-- upvalues: deepDiffer (copy)
		return (deepDiffer(p3, p4, p5, p6))
	end
}))