local SocialServerDrivenUi = script:FindFirstAncestor("SocialServerDrivenUi")
local Parent = SocialServerDrivenUi.Parent
local GetBooleanParamFunction = require(Parent.SduiCoreSystem).SduiActionParams.getBooleanParam
local ServerTriggeredModalsModule = require(Parent.ServerTriggeredModals)
local ReportPromptImpressionFunction = ServerTriggeredModalsModule.reportPromptImpression
local FetchPromptsFunction = ServerTriggeredModalsModule.fetchPrompts
local CreateProfileCompletionPromptsConfigFunction = require(Parent.ProfilePlatformCommon).Utils.createProfileCompletionPromptsConfig
local FFlagSduiOpenProfileFramesEditorSkipImpressionModule = require(SocialServerDrivenUi.Flags.FFlagSduiOpenProfileFramesEditorSkipImpression)
local ProfileFramesEditorScreen = game:DefineFastString("ProfileFramesEditorScreen", "EditProfileImageProfilePlatform")
local ProfileFramesUpsellPromptType = game:DefineFastString("ProfileFramesUpsellPromptType", "ProfileFramesUpsell")

return function(p1, _, p2, _)
	-- upvalues: FFlagSduiOpenProfileFramesEditorSkipImpressionModule (copy), GetBooleanParamFunction (copy), ReportPromptImpressionFunction (copy), ProfileFramesUpsellPromptType (copy), FetchPromptsFunction (copy), CreateProfileCompletionPromptsConfigFunction (copy), ProfileFramesEditorScreen (copy)
	local ActionParams = p1 and p1.actionParams or nil
	local PromptId = if ActionParams then ActionParams.promptId else nil
	local SkipPromptImpression = FFlagSduiOpenProfileFramesEditorSkipImpressionModule and (ActionParams ~= nil and GetBooleanParamFunction(ActionParams, "skipPromptImpression", false))
	
	if ReportPromptImpressionFunction and not SkipPromptImpression then
		ReportPromptImpressionFunction(ProfileFramesUpsellPromptType, PromptId):andThen(function()
			-- upvalues: FetchPromptsFunction (upval), CreateProfileCompletionPromptsConfigFunction (upval)
			FetchPromptsFunction(CreateProfileCompletionPromptsConfigFunction(), true)
		end):catch(function() end)
	end
	p2.dependencies.getNavigation().navigate(ProfileFramesEditorScreen, { mode = "framesOnly" })
end