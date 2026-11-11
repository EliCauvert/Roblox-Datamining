local CorePackages = game:GetService("CorePackages")
local IsVRAppBuildFunction = require(CorePackages.Workspace.Packages.AppCommonLib).IsVRAppBuild
local UseLastInputMethodFunction = require(CorePackages.Workspace.Packages.FocusNavigationUtils).useLastInputMethod

return function(): boolean
	-- upvalues: UseLastInputMethodFunction (copy), IsVRAppBuildFunction (copy)
	local IsGamepad = UseLastInputMethodFunction() == "Gamepad"
	
	return not IsVRAppBuildFunction() and IsGamepad
end