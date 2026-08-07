-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:36 2026 Pacific Standard Time.

local number = require(script.Parent.Parent.Parent.LuauPolyfill).Number
local nullModule = require(script.Parent.null)

local function deepEqual(p0, p1) --[[ line: 13 ]]
	-- upvalues: number (ref), nullModule (ref), deepEqual (ref)
	if typeof(p0) ~= typeof(p1) then
		return false, ("{1}: value of type '%s'\n{2}: value of type '%s'"):format(typeof(p0), typeof(p1))
	elseif number.isNaN(p0) and number.isNaN(p1) then
		return true
	elseif p0 == p1 then
		return true
	elseif p0 == nullModule or p1 == nullModule or typeof(p0) ~= "table" then
		return false, string.format("{1} (%s) ~= {2} (%s)", tostring(p0), tostring(p1))
	end
	local var3
	local t = {}
	
	for i, v in pairs(p0) do
		t[i] = true
		var3, var5 = deepEqual(v, p1[i])
		
		if not var3 then
			return false, var5:gsub("{1}", ("{1}[%s]"):format(tostring(i))):gsub("{2}", ("{2}[%s]"):format(tostring(i)))
		end
	end
	for i_1, v_1 in pairs(p1) do
		if not t[i_1] then
			var3, var4 = deepEqual(p0[i_1], v_1)
			
			if not var3 then
				return false, var4:gsub("{1}", ("{1}[%s]"):format(tostring(i_1))):gsub("{2}", ("{2}[%s]"):format(tostring(i_1)))
			end
		end
	end
	return true
end

return deepEqual