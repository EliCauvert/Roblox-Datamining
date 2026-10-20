local Parent = script:FindFirstAncestor("ProfilePlatformCommon").Parent
local PromptsEntryPoint = require(Parent.ServerTriggeredModals).PromptsEntryPoint
local SduiLoadTimer = require(Parent.SduiSharedUtilities).SduiLoadTimer
local AppPage = require(Parent.RobloxAppEnums).AppPage
local FFlagSduiAllowNoConfigsBuilt = require(Parent.SharedFlags).FFlagSduiAllowNoConfigsBuilt
local ProfileCompletionUsePlatformSurfaceKey = game:DefineFastFlag("ProfileCompletionUsePlatformSurfaceKey", false)

return function()
	-- upvalues: SduiLoadTimer (copy), PromptsEntryPoint (copy), ProfileCompletionUsePlatformSurfaceKey (copy), AppPage (copy), FFlagSduiAllowNoConfigsBuilt (copy)
	return {
		configKey = "ProfileCompletion",
		clearOnEmptyResponse = true,
		entryPoint = PromptsEntryPoint.SelfUserProfileOpen,
		surfaceKey = if ProfileCompletionUsePlatformSurfaceKey then AppPage.ProfilePlatform else "ProfileCompletion",
		allowNoConfigsBuilt = if FFlagSduiAllowNoConfigsBuilt then true else nil,
		loadTimer = SduiLoadTimer.createLoadTimer("ProfileCompletion")
	}
end