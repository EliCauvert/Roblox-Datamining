local UseAppPolicyFunction = require(game:GetService("CorePackages").Workspace.Packages.UniversalAppPolicy).useAppPolicy
local Platform = game:GetService("UserInputService"):GetPlatform()
local IsPlatformMatch: boolean = Platform == Enum.Platform.Windows or (Platform == Enum.Platform.OSX or (Platform == Enum.Platform.Linux or Platform == Enum.Platform.UWP))
local IsTenFootInterface = game:GetService("GuiService"):IsTenFootInterface()

return function()
	-- upvalues: UseAppPolicyFunction (copy), IsTenFootInterface (copy), IsPlatformMatch (copy)
	local UseAppPolicyResult = UseAppPolicyFunction(function(p1)
		return p1.shouldShowCatalogShareButton()
	end)
	local UseAppPolicyResult1 = UseAppPolicyFunction(function(p1)
		return p1.getWebViewSupport()
	end)
	
	return {
		supportShareButton = UseAppPolicyResult and (not IsTenFootInterface and UseAppPolicyResult1),
		supportCopyLinkButton = IsPlatformMatch
	}
end