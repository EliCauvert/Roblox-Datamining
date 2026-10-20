local UseFaeFeatureAccessModule = require(script.useFaeFeatureAccess)
local v1 = require(script.createFaeFeatureAccessStore)()

return {
	getFaeFeatureAccessStore = function()
		-- upvalues: v1 (copy)
		return v1
	end,
	useFaeFeatureAccess = function()
		-- upvalues: UseFaeFeatureAccessModule (copy), v1 (copy)
		return UseFaeFeatureAccessModule(v1)
	end
}