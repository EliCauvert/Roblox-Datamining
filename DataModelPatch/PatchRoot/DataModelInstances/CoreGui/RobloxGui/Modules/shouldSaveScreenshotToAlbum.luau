local UserInputService = game:GetService("UserInputService")
local CachedPolicyServiceModule = require(game:GetService("CorePackages").Workspace.Packages.CachedPolicyService)
local GetFFlagScreenshotHudApiModule = require(game:GetService("CoreGui"):WaitForChild("RobloxGui").Modules.Flags.GetFFlagScreenshotHudApi)

return function(): boolean
	-- upvalues: UserInputService (copy), GetFFlagScreenshotHudApiModule (copy), CachedPolicyServiceModule (copy)
	local Platform = UserInputService:GetPlatform()
	local IsPlatformMatch: boolean = Platform == Enum.Platform.IOS or Platform == Enum.Platform.Android
	
	return GetFFlagScreenshotHudApiModule() and IsPlatformMatch and not CachedPolicyServiceModule:IsSubjectToChinaPolicies() or false
end