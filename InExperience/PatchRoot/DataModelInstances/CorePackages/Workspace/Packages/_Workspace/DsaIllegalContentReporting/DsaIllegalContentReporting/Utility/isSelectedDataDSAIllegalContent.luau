local ConstantsModule = require(script:FindFirstAncestor("DsaIllegalContentReporting").Utility.Constants)

return function(p1): boolean
	-- upvalues: ConstantsModule (copy)
	if p1 == nil then
		return false
	else
		local v1 = p1[#p1]
		
		return v1 ~= nil and v1.tagValues[1] == ConstantsModule.DSA_TAG_VALUE
	end
end