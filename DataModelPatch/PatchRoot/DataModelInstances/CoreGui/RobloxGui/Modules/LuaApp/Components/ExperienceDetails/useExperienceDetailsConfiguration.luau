local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local UseUiModeInfoFunction = require(CorePackages.Workspace.Packages.RobloxAppHooks).useUiModeInfo
local IsVRAppBuildFunction = require(CorePackages.Workspace.Packages.AppCommonLib).IsVRAppBuild
local UiMode = require(CorePackages.Workspace.Packages.RobloxAppEnums).UiMode

return function()
	-- upvalues: UseUiModeInfoFunction (copy), UiMode (copy), ReactModule (copy), IsVRAppBuildFunction (copy)
	local IsUiModeMatch = UseUiModeInfoFunction().uiMode == UiMode.TenFoot
	
	return (ReactModule.useMemo(function()
		-- upvalues: IsUiModeMatch (copy), IsVRAppBuildFunction (upval)
		return {
			showLogoTraySection = not IsUiModeMatch,
			showEventsList = not IsUiModeMatch,
			showCommunityLink = not IsUiModeMatch and not IsVRAppBuildFunction(),
			showCornerGradientPropEnabled = IsUiModeMatch
		}
	end, { IsUiModeMatch }))
end