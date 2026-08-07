local sduiSharedUtilities = script:FindFirstAncestor("SduiSharedUtilities")
local reactModule = require(sduiSharedUtilities.Parent.React)
local sduiFeatureEntryPointModule = require(sduiSharedUtilities.SduiFeatureEntryPoint)

return function(p0) --[[ line: 12 | named "SduiOverlayEntryPoint" ]]
	-- upvalues: reactModule (ref), sduiFeatureEntryPointModule (ref)
	return reactModule.createElement(sduiFeatureEntryPointModule, {
		shouldDisplayLoading = false,
		shouldDisplayError = false,
		configKey = p0.configKey,
		identifier = p0.identifier,
		appPage = p0.appPage or "Unknown"
	})
end