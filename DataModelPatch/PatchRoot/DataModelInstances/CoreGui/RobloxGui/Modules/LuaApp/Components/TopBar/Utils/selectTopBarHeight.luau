local IsVRAppBuildFunction = require(game:GetService("CorePackages").Workspace.Packages.AppCommonLib).IsVRAppBuild

return function(p1)
	-- upvalues: IsVRAppBuildFunction (copy)
	return if IsVRAppBuildFunction() then 0 else p1.TopBar.topBarHeight
end