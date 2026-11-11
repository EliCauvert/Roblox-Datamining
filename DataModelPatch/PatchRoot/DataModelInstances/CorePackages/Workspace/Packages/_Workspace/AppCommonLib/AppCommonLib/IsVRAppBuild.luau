local VRService = game:GetService("VRService")
local IsVRModeInStudioModule = require(script.Parent.isVRModeInStudio)

return function()
	-- upvalues: IsVRModeInStudioModule (copy), VRService (copy)
	return if IsVRModeInStudioModule() then true elseif game:GetEngineFeature("MaquettesBuildFlagsEnabled") then VRService:IsVRAppBuild() else VRService.VREnabled
end