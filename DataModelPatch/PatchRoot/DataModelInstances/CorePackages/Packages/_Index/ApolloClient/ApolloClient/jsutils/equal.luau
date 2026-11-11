local LuauPolyfillModule = require(script.Parent.Parent.Parent.LuauPolyfill)
local Array = LuauPolyfillModule.Array
local Object = LuauPolyfillModule.Object

local function equal(List, p1): boolean?
	-- upvalues: Array (copy), Object (copy), equal (copy)
	if typeof(List) ~= typeof(p1) then
		return false
	end
	if List == p1 then
		return true
	end
	if typeof(List) == "table" then
		if Array.isArray(List) and not Array.isArray(p1) then
			return false
		end
		if #List ~= #p1 or #Object.keys(List) ~= #Object.keys(p1) then
			return false
		end
		if Array.isArray(List) then
			for i, _ in ipairs(List) do
				if not equal(List[i], p1[i]) then
					return false
				end
			end
		else
			for i1 in pairs(List) do
				if not equal(List[tostring(i1)], p1[tostring(i1)]) then
					return false
				end
			end
		end
		return true
	else
		if typeof(List) == "string" or typeof(List) == "number" or typeof(List) == "boolean" then
			return List == p1
		end
		if typeof(List) == "function" then
			return debug.info(List, "n") == debug.info(p1, "n") and (debug.info(List, "s") == debug.info(p1, "s") and debug.info(List, "l") == debug.info(p1, "l")) and debug.info(List, "a") == debug.info(p1, "a")
		end
		if typeof(List) == "thread" then
			error("unhandled equality check for type 'thread'")
		elseif typeof(List) == "userdata" then
			error("unhandled equality check for type 'userdata'")
		end
		error("unhandled equality check for type " .. typeof(List))
	end
end

return equal