local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local parent = profilePlatform.Parent
local reactModule = require(parent.React)
local serverTriggeredModalsModule = require(parent.ServerTriggeredModals)
local reportPromptImpression = serverTriggeredModalsModule.reportPromptImpression
local fetchPrompts = serverTriggeredModalsModule.fetchPrompts
local createProfileCompletionPromptsConfig = require(parent.ProfilePlatformCommon).Utils.createProfileCompletionPromptsConfig
local fetchFramesPromptIdModule = require(profilePlatform.Hooks.fetchFramesPromptId)
local profileFramesUpsellPromptType = game:DefineFastString("ProfileFramesUpsellPromptType", "ProfileFramesUpsell")

return function()
	-- upvalues: reactModule (ref), reportPromptImpression (ref), fetchFramesPromptIdModule (ref), profileFramesUpsellPromptType (ref), fetchPrompts (ref), createProfileCompletionPromptsConfig (ref)
	reactModule.useEffect(function()
		-- upvalues: reportPromptImpression (copy), fetchFramesPromptIdModule (copy), profileFramesUpsellPromptType (copy), fetchPrompts (copy), createProfileCompletionPromptsConfig (copy)
		if reportPromptImpression then
			fetchFramesPromptIdModule():andThen(function(p1)
				-- upvalues: reportPromptImpression (copy), profileFramesUpsellPromptType (copy)
				return reportPromptImpression(profileFramesUpsellPromptType, p1)
			end):andThen(function()
				-- upvalues: fetchPrompts (copy), createProfileCompletionPromptsConfig (copy)
				fetchPrompts(createProfileCompletionPromptsConfig(), true)
			end):catch(function() end)
		end
	end, {})
end