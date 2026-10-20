local Parent = script:FindFirstAncestor("SocialServerDrivenUi").Parent
local _ = require(Parent.SduiCoreSystem)
local ServerTriggeredModalsModule = require(Parent.ServerTriggeredModals)
local ReportPromptImpressionFunction = ServerTriggeredModalsModule.reportPromptImpression
local FetchPromptsFunction = ServerTriggeredModalsModule.fetchPrompts
local CreateProfileCompletionPromptsConfigFunction = require(Parent.ProfilePlatformCommon).Utils.createProfileCompletionPromptsConfig
local ProfileFramesEditorScreen = game:DefineFastString("ProfileFramesEditorScreen", "EditProfileImageProfilePlatform")
local ProfileFramesUpsellPromptType = game:DefineFastString("ProfileFramesUpsellPromptType", "ProfileFramesUpsell")

return function(p1, _, p2, _)
	-- upvalues: ReportPromptImpressionFunction (copy), ProfileFramesUpsellPromptType (copy), FetchPromptsFunction (copy), CreateProfileCompletionPromptsConfigFunction (copy), ProfileFramesEditorScreen (copy)
	local ActionParams = p1 and p1.actionParams or nil
	local PromptId = if ActionParams then ActionParams.promptId else nil
	
	if ReportPromptImpressionFunction then
		ReportPromptImpressionFunction(ProfileFramesUpsellPromptType, PromptId):andThen(function()
			-- upvalues: FetchPromptsFunction (upval), CreateProfileCompletionPromptsConfigFunction (upval)
			FetchPromptsFunction(CreateProfileCompletionPromptsConfigFunction(), true)
		end):catch(function() end)
	end
	p2.dependencies.getNavigation().navigate(ProfileFramesEditorScreen, { mode = "framesOnly" })
end