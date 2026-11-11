local Logging = require(game:GetService("CorePackages").Workspace.Packages.AppCommonLib).Logging
local GetActiveChildNavigationOptionsSafelyModule = require(game:GetService("CoreGui").RobloxGui.Modules.AvatarExperience.Common.Components.RoactNavigation.getActiveChildNavigationOptionsSafely)

return function(p1)
	-- upvalues: GetActiveChildNavigationOptionsSafelyModule (copy), Logging (copy)
	local Success, Result = pcall(GetActiveChildNavigationOptionsSafelyModule, p1.navigation)
	local t = {}
	
	if Success then
		if typeof(Result) == "table" then
			t = Result
		else
			Logging.warn("[AX] getMainStackNavigationOptions: getActiveChildNavigationOptionsSafely returned non-table " .. `({typeof(Result)}); using default options.`)
		end
	else
		Logging.warn(`[AX] getMainStackNavigationOptions: getActiveChildNavigationOptionsSafely threw: {tostring(Result)}`)
	end
	return {
		overlayTransparency = 1,
		absorbInput = false,
		backButtonAction = t.backButtonAction
	}
end