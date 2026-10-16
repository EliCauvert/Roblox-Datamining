local VRService = game:GetService("VRService")
local IsVRModeInStudioModule = require(script.Parent.isVRModeInStudio)

return function() --[[ Line: 5 ]]
	-- upvalues: IsVRModeInStudioModule (copy), VRService (copy)
	return if IsVRModeInStudioModule() then true else VRService:IsVRAppBuild()
end