local VRService = require(script:FindFirstAncestor("AppCommonLib").Parent.MockableProxyServices).VRService
local isVRModeInStudioModule = require(script.Parent.isVRModeInStudio)

return function()
	-- upvalues: isVRModeInStudioModule (ref), VRService (ref)
	return if isVRModeInStudioModule() then true else VRService.VREnabled
end