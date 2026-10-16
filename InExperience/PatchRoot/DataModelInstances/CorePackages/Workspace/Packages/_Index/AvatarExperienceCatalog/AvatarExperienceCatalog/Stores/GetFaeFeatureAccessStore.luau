local UseFaeFeatureAccessModule = require(script.useFaeFeatureAccess)
local v1 = require(script.createFaeFeatureAccessStore)()

return {
	getFaeFeatureAccessStore = function() --[[ Line: 11 ]]
		-- upvalues: v1 (copy)
		return v1
	end,
	useFaeFeatureAccess = function() --[[ Line: 14 ]]
		-- upvalues: UseFaeFeatureAccessModule (copy), v1 (copy)
		return UseFaeFeatureAccessModule(v1)
	end
}