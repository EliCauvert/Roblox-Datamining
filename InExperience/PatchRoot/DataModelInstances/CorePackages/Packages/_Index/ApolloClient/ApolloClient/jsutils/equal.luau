local luauPolyfillModule = require(script.Parent.Parent.Parent.LuauPolyfill)
local array = luauPolyfillModule.Array
local object = luauPolyfillModule.Object

local function equal(p1, p2)
	-- upvalues: array (ref), object (ref), equal (ref)
	if typeof(p1) ~= typeof(p2) then
		return false
	elseif p1 == p2 then
		return true
	elseif typeof(p1) == "table" then
		if array.isArray(p1) and not array.isArray(p2) then
			return false
		elseif #p1 ~= #p2 or #object.keys(p1) ~= #object.keys(p2) then
			return false
		elseif array.isArray(p1) then
			for i, v in ipairs(p1) do
				if not equal(p1[i], p2[i]) then
					return false
				end
			end
		else
			for i in pairs(p1) do
				if not equal(p1[tostring(i)], p2[tostring(i)]) then
					return false
				end
			end
		end
		return true
	elseif typeof(p1) == "string" or typeof(p1) == "number" or typeof(p1) == "boolean" then
		return p1 == p2
	elseif typeof(p1) == "function" then
		return debug.info(p1, "n") == debug.info(p2, "n") and (debug.info(p1, "s") == debug.info(p2, "s") and (debug.info(p1, "l") == debug.info(p2, "l") and debug.info(p1, "a") == debug.info(p2, "a")))
	elseif typeof(p1) == "thread" then
		error("unhandled equality check for type 'thread'")
	elseif typeof(p1) == "userdata" then
		error("unhandled equality check for type 'userdata'")
	end
	error("unhandled equality check for type " .. typeof(p1))
end

return equal