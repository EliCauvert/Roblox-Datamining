local Number = require(script.Parent.Parent.Parent.LuauPolyfill).Number
local NullModule = require(script.Parent.null)

local function deepContains(NullModule1, List) --[[ Line: 4 ]]
	-- upvalues: Number (copy), NullModule (copy), deepContains (copy)
	if typeof(NullModule1) ~= typeof(List) then
		return false, (("{1}: value of type '%s'\n{2}: value of type '%s'"):format(typeof(NullModule1), (typeof(List))))
	end
	if Number.isNaN(NullModule1) and Number.isNaN(List) then
		return true
	end
	if NullModule1 == List then
		return true
	end
	if NullModule1 == NullModule or List == NullModule or typeof(NullModule1) ~= "table" then
		return false, string.format("{1} (%s) ~= {2} (%s)", tostring(NullModule1), (tostring(List)))
	end
	local DeepContainsResult2 = nil
	for i, value in pairs(List) do
		local DeepContainsResult
		DeepContainsResult, DeepContainsResult2 = deepContains(NullModule1[i], value)
		
		if not DeepContainsResult then
			return false, (DeepContainsResult2:gsub("{1}", ("{1}[%s]"):format((tostring(i)))):gsub("{2}", ("{2}[%s]"):format((tostring(i)))))
		end
	end
	return true
end

return deepContains