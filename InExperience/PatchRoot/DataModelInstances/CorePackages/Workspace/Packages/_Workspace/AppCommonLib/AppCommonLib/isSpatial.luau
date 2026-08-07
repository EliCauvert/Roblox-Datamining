local VRService = require(script:FindFirstAncestor("AppCommonLib").Parent.MockableProxyServices).VRService
local isVRModeInStudioModule = require(script.Parent.isVRModeInStudio)

return function() --[[ line: 7 | named "isSpatial" ]]
	-- upvalues: isVRModeInStudioModule (ref), VRService (ref)
	return if isVRModeInStudioModule() then true else VRService.VREnabled
end