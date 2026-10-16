local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local Parent = ProfilePlatform.Parent
local ReactModule = require(Parent.React)
local ServerTriggeredModalsModule = require(Parent.ServerTriggeredModals)
local ReportPromptImpressionFunction = ServerTriggeredModalsModule.reportPromptImpression
local FetchPromptsFunction = ServerTriggeredModalsModule.fetchPrompts
local CreateProfileCompletionPromptsConfigFunction = require(Parent.ProfilePlatformCommon).Utils.createProfileCompletionPromptsConfig
local FetchFramesPromptIdModule = require(ProfilePlatform.Hooks.fetchFramesPromptId)
local ProfileFramesUpsellPromptType = game:DefineFastString("ProfileFramesUpsellPromptType", "ProfileFramesUpsell")

return function() --[[ Line: 15 | Named "useReportFramesImpression" ]]
	-- upvalues: ReactModule (copy), ReportPromptImpressionFunction (copy), FetchFramesPromptIdModule (copy), ProfileFramesUpsellPromptType (copy), FetchPromptsFunction (copy), CreateProfileCompletionPromptsConfigFunction (copy)
	ReactModule.useEffect(function() --[[ Line: 16 ]]
		-- upvalues: ReportPromptImpressionFunction (upval), FetchFramesPromptIdModule (upval), ProfileFramesUpsellPromptType (upval), FetchPromptsFunction (upval), CreateProfileCompletionPromptsConfigFunction (upval)
		if ReportPromptImpressionFunction then
			FetchFramesPromptIdModule():andThen(function(Result) --[[ Line: 19 ]]
				-- upvalues: ReportPromptImpressionFunction (upval), ProfileFramesUpsellPromptType (upval)
				return ReportPromptImpressionFunction(ProfileFramesUpsellPromptType, Result)
			end):andThen(function() --[[ Line: 22 ]]
				-- upvalues: FetchPromptsFunction (upval), CreateProfileCompletionPromptsConfigFunction (upval)
				FetchPromptsFunction(CreateProfileCompletionPromptsConfigFunction(), true)
			end):catch(function() --[[ Line: 25 ]] end)
		end
	end, {})
end