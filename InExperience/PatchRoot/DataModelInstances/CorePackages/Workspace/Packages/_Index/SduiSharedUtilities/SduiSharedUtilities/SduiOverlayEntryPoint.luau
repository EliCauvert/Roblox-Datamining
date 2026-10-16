local SduiSharedUtilities = script:FindFirstAncestor("SduiSharedUtilities")
local ReactModule = require(SduiSharedUtilities.Parent.React)
local SduiFeatureEntryPointModule = require(SduiSharedUtilities.SduiFeatureEntryPoint)

return function(p1) --[[ Line: 12 | Named "SduiOverlayEntryPoint" ]]
	-- upvalues: ReactModule (copy), SduiFeatureEntryPointModule (copy)
	return ReactModule.createElement(SduiFeatureEntryPointModule, {
		shouldDisplayLoading = false,
		shouldDisplayError = false,
		configKey = p1.configKey,
		identifier = p1.identifier,
		appPage = p1.appPage or "Unknown"
	})
end