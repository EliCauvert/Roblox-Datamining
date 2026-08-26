local number = require(script.Parent.Parent.Parent.LuauPolyfill).Number
local nullModule = require(script.Parent.null)

local function deepContains(p1, p2)
	-- upvalues: number (ref), nullModule (ref), deepContains (ref)
	if typeof(p1) ~= typeof(p2) then
		return false, ("{1}: value of type '%s'\n{2}: value of type '%s'"):format(typeof(p1), typeof(p2))
	elseif number.isNaN(p1) and number.isNaN(p2) then
		return true
	elseif p1 == p2 then
		return true
	elseif p1 == nullModule or p2 == nullModule or typeof(p1) ~= "table" then
		return false, string.format("{1} (%s) ~= {2} (%s)", tostring(p1), tostring(p2))
	end
	for i, v in pairs(p2) do
		local var1, var2 = deepContains(p1[i], v)
		
		if not var1 then
			return false, var2:gsub("{1}", ("{1}[%s]"):format(tostring(i))):gsub("{2}", ("{2}[%s]"):format(tostring(i)))
		end
	end
	return true
end

return deepContains