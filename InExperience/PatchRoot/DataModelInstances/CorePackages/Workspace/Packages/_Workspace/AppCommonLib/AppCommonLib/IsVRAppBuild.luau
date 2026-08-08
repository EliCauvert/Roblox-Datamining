local VRService = game:GetService("VRService")
local isVRModeInStudioModule = require(script.Parent.isVRModeInStudio)

return function() --[[ line: 5 ]]
	-- upvalues: isVRModeInStudioModule (ref), VRService (ref)
	return if isVRModeInStudioModule() then true else VRService:IsVRAppBuild()
end