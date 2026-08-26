local number = require(script.Parent.Parent.Parent.LuauPolyfill).Number
local nullModule = require(script.Parent.null)

local function deepEqual(p1, p2)
	-- upvalues: number (ref), nullModule (ref), deepEqual (ref)
	if typeof(p1) ~= typeof(p2) then
		return false, ("{1}: value of type '%s'\n{2}: value of type '%s'"):format(typeof(p1), typeof(p2))
	elseif number.isNaN(p1) and number.isNaN(p2) then
		return true
	elseif p1 == p2 then
		return true
	elseif p1 == nullModule or p2 == nullModule or typeof(p1) ~= "table" then
		return false, string.format("{1} (%s) ~= {2} (%s)", tostring(p1), tostring(p2))
	end
	local var1
	local t = {}
	
	for i, v in pairs(p1) do
		t[i] = true
		var1, var5 = deepEqual(v, p2[i])
		
		if not var1 then
			return false, var5:gsub("{1}", ("{1}[%s]"):format(tostring(i))):gsub("{2}", ("{2}[%s]"):format(tostring(i)))
		end
	end
	for i_1, v_1 in pairs(p2) do
		if not t[i_1] then
			var1, var4 = deepEqual(p1[i_1], v_1)
			
			if not var1 then
				return false, var4:gsub("{1}", ("{1}[%s]"):format(tostring(i_1))):gsub("{2}", ("{2}[%s]"):format(tostring(i_1)))
			end
		end
	end
	return true
end

return deepEqual