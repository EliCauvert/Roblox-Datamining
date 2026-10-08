local appCommonLibModule = require(script:FindFirstAncestor("MomentsCommon").Parent.AppCommonLib)
local isVRAppBuild = appCommonLibModule.IsVRAppBuild
local isTenFootInterface = appCommonLibModule.isTenFootInterface

return function()
	-- upvalues: isVRAppBuild (ref), isTenFootInterface (ref)
	return not isVRAppBuild() and not isTenFootInterface()
end