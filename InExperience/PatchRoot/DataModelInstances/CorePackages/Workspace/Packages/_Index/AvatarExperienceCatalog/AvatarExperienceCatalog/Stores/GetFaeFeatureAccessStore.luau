local useFaeFeatureAccessModule = require(script.useFaeFeatureAccess)
local var1 = require(script.createFaeFeatureAccessStore)()

return {
	getFaeFeatureAccessStore = function() --[[ line: 11 ]]
		-- upvalues: var1 (ref)
		return var1
	end,
	useFaeFeatureAccess = function() --[[ line: 14 ]]
		-- upvalues: useFaeFeatureAccessModule (ref), var1 (ref)
		return useFaeFeatureAccessModule(var1)
	end
}