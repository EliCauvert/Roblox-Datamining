local coreGuiService = game:GetService("CoreGui")
local userInputService = game:GetService("UserInputService")
local cachedPolicyServiceModule = require(game:GetService("CorePackages").Workspace.Packages.CachedPolicyService)
local getFFlagScreenshotHudApiModule = require(coreGuiService:WaitForChild("RobloxGui").Modules.Flags.GetFFlagScreenshotHudApi)

return function() --[[ line: 9 ]]
	-- upvalues: userInputService (ref), getFFlagScreenshotHudApiModule (ref), cachedPolicyServiceModule (ref)
	local platform = userInputService:GetPlatform()
	
	return if getFFlagScreenshotHudApiModule() and (if platform ~= Enum.Platform.IOS then platform == Enum.Platform.Android else true) and not cachedPolicyServiceModule:IsSubjectToChinaPolicies() then true else false
end