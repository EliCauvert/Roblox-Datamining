local Parent = script:FindFirstAncestor("BuildExperiencePlaytestLaunch").Parent
local AppCommonLibModule = require(Parent.AppCommonLib)
local SharedFlagsModule = require(Parent.SharedFlags)
local _ = require(Parent.UniversalAppPolicy)
local IsVRAppBuildFunction = AppCommonLibModule.IsVRAppBuild
local IsTenFootInterfaceFunction = AppCommonLibModule.isTenFootInterface
local FFlagAppNavMyStatsTab = SharedFlagsModule.FFlagAppNavMyStatsTab
local FFlagEnableBuildTabOverride = SharedFlagsModule.FFlagEnableBuildTabOverride

return function(p1): boolean
	-- upvalues: FFlagEnableBuildTabOverride (copy), FFlagAppNavMyStatsTab (copy), IsVRAppBuildFunction (copy), IsTenFootInterfaceFunction (copy)
	return if FFlagEnableBuildTabOverride then not IsVRAppBuildFunction() and not IsTenFootInterfaceFunction() else FFlagAppNavMyStatsTab and (p1.getCanViewBuild() and (not IsVRAppBuildFunction() and not IsTenFootInterfaceFunction()))
end