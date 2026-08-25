local parent = script:FindFirstAncestor("ProfilePlatformCommon").Parent
local promptsEntryPoint = require(parent.ServerTriggeredModals).PromptsEntryPoint
local sduiLoadTimer = require(parent.SduiSharedUtilities).SduiLoadTimer
local appPage = require(parent.RobloxAppEnums).AppPage
local fFlagSduiAllowNoConfigsBuilt = require(parent.SharedFlags).FFlagSduiAllowNoConfigsBuilt
local profileCompletionUsePlatformSurfaceKey = game:DefineFastFlag("ProfileCompletionUsePlatformSurfaceKey", false)

return function()
	-- upvalues: sduiLoadTimer (ref), promptsEntryPoint (ref), profileCompletionUsePlatformSurfaceKey (ref), appPage (ref), fFlagSduiAllowNoConfigsBuilt (ref)
	return {
		configKey = "ProfileCompletion",
		clearOnEmptyResponse = true,
		entryPoint = promptsEntryPoint.SelfUserProfileOpen,
		surfaceKey = if profileCompletionUsePlatformSurfaceKey then appPage.ProfilePlatform else "ProfileCompletion",
		allowNoConfigsBuilt = if fFlagSduiAllowNoConfigsBuilt then true else nil,
		loadTimer = sduiLoadTimer.createLoadTimer("ProfileCompletion")
	}
end