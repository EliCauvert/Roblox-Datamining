local AppCommonLibModule = require(script:FindFirstAncestor("MomentsCommon").Parent.AppCommonLib)
local IsVRAppBuildFunction = AppCommonLibModule.IsVRAppBuild
local IsTenFootInterfaceFunction = AppCommonLibModule.isTenFootInterface

return function(): boolean --[[ Line: 8 | Named "getIsSupportedOnPlatform" ]]
	-- upvalues: IsVRAppBuildFunction (copy), IsTenFootInterfaceFunction (copy)
	return not IsVRAppBuildFunction() and not IsTenFootInterfaceFunction()
end