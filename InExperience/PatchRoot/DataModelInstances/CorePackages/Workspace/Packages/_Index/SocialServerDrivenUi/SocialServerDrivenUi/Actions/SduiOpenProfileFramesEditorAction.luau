local parent = script:FindFirstAncestor("SocialServerDrivenUi").Parent
local _ = require(parent.SduiCoreSystem)
local serverTriggeredModalsModule = require(parent.ServerTriggeredModals)
local reportPromptImpression = serverTriggeredModalsModule.reportPromptImpression
local fetchPrompts = serverTriggeredModalsModule.fetchPrompts
local createProfileCompletionPromptsConfig = require(parent.ProfilePlatformCommon).Utils.createProfileCompletionPromptsConfig
local profileFramesEditorScreen = game:DefineFastString("ProfileFramesEditorScreen", "EditProfileImageProfilePlatform")
local profileFramesUpsellPromptType = game:DefineFastString("ProfileFramesUpsellPromptType", "ProfileFramesUpsell")

return function(p1, _, p2, _)
	-- upvalues: reportPromptImpression (ref), profileFramesUpsellPromptType (ref), fetchPrompts (ref), createProfileCompletionPromptsConfig (ref), profileFramesEditorScreen (ref)
	local var1 = if p1 then p1.actionParams else nil
	local var2 = if var1 then var1.promptId else nil
	
	if reportPromptImpression then
		reportPromptImpression(profileFramesUpsellPromptType, var2):andThen(function()
			-- upvalues: fetchPrompts (copy), createProfileCompletionPromptsConfig (copy)
			fetchPrompts(createProfileCompletionPromptsConfig(), true)
		end):catch(function() end)
	end
	p2.dependencies.getNavigation().navigate(profileFramesEditorScreen, { mode = "framesOnly" })
end