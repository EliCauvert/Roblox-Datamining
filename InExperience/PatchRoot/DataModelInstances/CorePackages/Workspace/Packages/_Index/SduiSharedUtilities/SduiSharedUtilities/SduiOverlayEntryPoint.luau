local sduiSharedUtilities = script:FindFirstAncestor("SduiSharedUtilities")
local reactModule = require(sduiSharedUtilities.Parent.React)
local sduiFeatureEntryPointModule = require(sduiSharedUtilities.SduiFeatureEntryPoint)

return function(p1)
	-- upvalues: reactModule (ref), sduiFeatureEntryPointModule (ref)
	return reactModule.createElement(sduiFeatureEntryPointModule, {
		shouldDisplayLoading = false,
		shouldDisplayError = false,
		configKey = p1.configKey,
		identifier = p1.identifier,
		appPage = p1.appPage or "Unknown"
	})
end