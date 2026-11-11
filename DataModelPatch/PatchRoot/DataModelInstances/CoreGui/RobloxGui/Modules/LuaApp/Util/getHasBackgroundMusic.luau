local GuiService = game:GetService("GuiService")
local IsVRAppBuildFunction = require(game:GetService("CorePackages").Workspace.Packages.AppCommonLib).IsVRAppBuild

return function()
	-- upvalues: IsVRAppBuildFunction (copy), GuiService (copy)
	return IsVRAppBuildFunction() or GuiService:IsTenFootInterface()
end