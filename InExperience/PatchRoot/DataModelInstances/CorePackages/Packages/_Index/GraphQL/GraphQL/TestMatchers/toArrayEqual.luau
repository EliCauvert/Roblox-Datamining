local DeepEqualModule = require(script.Parent.Parent.luaUtils.deepEqual)
local DeepContainsModule = require(script.Parent.Parent.luaUtils.deepContains)

return function(p1, p2, p3) --[[ Line: 18 | Named "toArrayEqual" ]]
	-- upvalues: DeepContainsModule (copy), DeepEqualModule (copy)
	if #p1 ~= #p2 then
		return {
			pass = false,
			message = ("Expected array length %s / got length %s"):format(tostring(#p1), (tostring(#p2)))
		}
	end
	local DeepContainsModuleResult2 = nil
	for i = 1, #p1 do
		if p3 then
			local DeepContainsModuleResult
			DeepContainsModuleResult, DeepContainsModuleResult2 = DeepContainsModule(p1[i], p2[i])
			
			if DeepContainsModuleResult then continue end
		else
			local DeepEqualModuleResult
			DeepEqualModuleResult, DeepContainsModuleResult2 = DeepEqualModule(p1[i], p2[i])
			
			if DeepEqualModuleResult then continue end
		end
		return {
			pass = false,
			message = DeepContainsModuleResult2:gsub("{1}", ("{1}[%s]"):format((tostring(i)))):gsub("{2}", ("{2}[%s]"):format((tostring(i))))
		}
	end
	return { pass = true, message = "" }
end