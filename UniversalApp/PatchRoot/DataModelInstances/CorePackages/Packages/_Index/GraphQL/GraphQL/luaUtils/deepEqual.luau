local Number = require(script.Parent.Parent.Parent.LuauPolyfill).Number
local NullModule = require(script.Parent.null)

local function deepEqual(List, List1) --[[ Line: 13 ]]
	-- upvalues: Number (copy), NullModule (copy), deepEqual (copy)
	if typeof(List) ~= typeof(List1) then
		return false, (("{1}: value of type '%s'\n{2}: value of type '%s'"):format(typeof(List), (typeof(List1))))
	end
	if Number.isNaN(List) and Number.isNaN(List1) then
		return true
	end
	if List == List1 then
		return true
	end
	if List == NullModule or List1 == NullModule or typeof(List) ~= "table" then
		return false, string.format("{1} (%s) ~= {2} (%s)", tostring(List), (tostring(List1)))
	end
	local t = {}
	local DeepEqualResult2 = nil
	
	for i, value in pairs(List) do
		t[i] = true
		local DeepEqualResult
		DeepEqualResult, DeepEqualResult2 = deepEqual(value, List1[i])
		
		if not DeepEqualResult then
			return false, (DeepEqualResult2:gsub("{1}", ("{1}[%s]"):format((tostring(i)))):gsub("{2}", ("{2}[%s]"):format((tostring(i)))))
		end
	end
	local DeepEqualResult2_1 = nil
	for i1, value1 in pairs(List1) do
		local Entry = t[i1]
		
		if not Entry then
			local DeepEqualResult1
			DeepEqualResult1, DeepEqualResult2_1 = deepEqual(List[i1], value1)
			Entry = DeepEqualResult1
		end
		if not Entry then
			return false, (DeepEqualResult2_1:gsub("{1}", ("{1}[%s]"):format((tostring(i1)))):gsub("{2}", ("{2}[%s]"):format((tostring(i1)))))
		end
	end
	return true
end

return deepEqual