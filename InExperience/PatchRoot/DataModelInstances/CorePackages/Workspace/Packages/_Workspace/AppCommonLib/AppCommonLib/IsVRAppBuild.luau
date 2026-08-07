local VRService = game:GetService("VRService")
local isVRModeInStudioModule = require(script.Parent.isVRModeInStudio)

return function() --[[ line: 7 ]]
	-- upvalues: isVRModeInStudioModule (ref), VRService (ref)
	return if isVRModeInStudioModule() then true elseif game:GetEngineFeature("MaquettesBuildFlagsEnabled") then VRService:IsVRAppBuild() else VRService.VREnabled
end