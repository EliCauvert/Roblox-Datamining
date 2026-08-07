local number = require(script.Parent.Parent.Parent.LuauPolyfill).Number
local nullModule = require(script.Parent.null)

local function deepContains(p0, p1) --[[ line: 4 ]]
	-- upvalues: number (ref), nullModule (ref), deepContains (ref)
	if typeof(p0) ~= typeof(p1) then
		return false, ("{1}: value of type '%s'\n{2}: value of type '%s'"):format(typeof(p0), typeof(p1))
	elseif number.isNaN(p0) and number.isNaN(p1) then
		return true
	elseif p0 == p1 then
		return true
	elseif p0 == nullModule or p1 == nullModule or typeof(p0) ~= "table" then
		return false, string.format("{1} (%s) ~= {2} (%s)", tostring(p0), tostring(p1))
	end
	for i, v in pairs(p1) do
		local var2, var3 = deepContains(p0[i], v)
		
		if not var2 then
			return false, var3:gsub("{1}", ("{1}[%s]"):format(tostring(i))):gsub("{2}", ("{2}[%s]"):format(tostring(i)))
		end
	end
	return true
end

return deepContains