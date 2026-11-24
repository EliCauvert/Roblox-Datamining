local VrCommon = script:FindFirstAncestor("VrCommon")
local IsVRAppBuildFunction = require(VrCommon.Parent.AppCommonLib).IsVRAppBuild
local FFlagEnableQuestWebTasksModule = require(VrCommon.Flags.FFlagEnableQuestWebTasks)

return function()
	-- upvalues: FFlagEnableQuestWebTasksModule (copy), IsVRAppBuildFunction (copy)
	return FFlagEnableQuestWebTasksModule and IsVRAppBuildFunction()
end