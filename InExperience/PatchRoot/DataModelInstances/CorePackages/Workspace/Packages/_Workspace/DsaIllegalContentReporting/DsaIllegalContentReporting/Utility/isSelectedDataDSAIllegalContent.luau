local constantsModule = require(script:FindFirstAncestor("DsaIllegalContentReporting").Utility.Constants)

return function(p0)
	-- upvalues: constantsModule (ref)
	if p0 == nil then
		return false
	end
	local var1 = p0[#p0]
	
	return var1 ~= nil and var1.tagValues[1] == constantsModule.DSA_TAG_VALUE
end