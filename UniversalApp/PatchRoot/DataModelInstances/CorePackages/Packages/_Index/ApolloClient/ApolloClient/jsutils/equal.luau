local luauPolyfillModule = require(script.Parent.Parent.Parent.LuauPolyfill)
local array = luauPolyfillModule.Array
local object = luauPolyfillModule.Object

local function equal(p0, p1)
	-- upvalues: array (ref), object (ref), equal (ref)
	if typeof(p0) ~= typeof(p1) then
		return false
	elseif p0 == p1 then
		return true
	elseif typeof(p0) == "table" then
		if array.isArray(p0) and not array.isArray(p1) then
			return false
		elseif #p0 ~= #p1 or #object.keys(p0) ~= #object.keys(p1) then
			return false
		elseif array.isArray(p0) then
			for i, v in ipairs(p0) do
				if not equal(p0[i], p1[i]) then
					return false
				end
			end
		else
			for i in pairs(p0) do
				if not equal(p0[tostring(i)], p1[tostring(i)]) then
					return false
				end
			end
		end
		return true
	elseif typeof(p0) == "string" or typeof(p0) == "number" or typeof(p0) == "boolean" then
		return p0 == p1
	elseif typeof(p0) == "function" then
		return debug.info(p0, "n") == debug.info(p1, "n") and (debug.info(p0, "s") == debug.info(p1, "s") and (debug.info(p0, "l") == debug.info(p1, "l") and debug.info(p0, "a") == debug.info(p1, "a")))
	elseif typeof(p0) == "thread" then
		error("unhandled equality check for type 'thread'")
	elseif typeof(p0) == "userdata" then
		error("unhandled equality check for type 'userdata'")
	end
	error("unhandled equality check for type " .. typeof(p0))
end

return equal