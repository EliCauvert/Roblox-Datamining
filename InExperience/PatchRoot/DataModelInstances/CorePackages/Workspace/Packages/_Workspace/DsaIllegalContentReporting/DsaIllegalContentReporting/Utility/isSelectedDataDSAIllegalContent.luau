local constantsModule = require(script:FindFirstAncestor("DsaIllegalContentReporting").Utility.Constants)

return function(p1)
	-- upvalues: constantsModule (ref)
	if p1 == nil then
		return false
	end
	local var1 = p1[#p1]
	
	return var1 ~= nil and var1.tagValues[1] == constantsModule.DSA_TAG_VALUE
end