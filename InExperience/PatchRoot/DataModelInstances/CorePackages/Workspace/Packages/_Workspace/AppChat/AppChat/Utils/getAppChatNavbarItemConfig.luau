local Parent = script:FindFirstAncestor("AppChat").Parent
local FoundationModule = require(Parent.Foundation)
local GetFFlagIsSquadEnabledFunction = require(Parent.SharedFlags).GetFFlagIsSquadEnabled
local ArgoPartyExperimentation = require(Parent.SocialExperiments).ArgoPartyExperimentation
local UniversalAppPolicyModule = require(Parent.UniversalAppPolicy)

return function()
	-- upvalues: UniversalAppPolicyModule (copy), ArgoPartyExperimentation (copy), GetFFlagIsSquadEnabledFunction (copy), FoundationModule (copy)
	local GetCanSeeChatTerminologyFunction = UniversalAppPolicyModule.getAppFeaturePolicies().getCanSeeChatTerminology
	
	return {
		label = if ArgoPartyExperimentation.getIsRenameEnabled() then if GetCanSeeChatTerminologyFunction() then "CommonUI.Features.Label.Chat" else "Feature.Squads.Label.Party" elseif GetFFlagIsSquadEnabledFunction() then "Feature.Squads.Label.Party" else "CommonUI.Features.Label.Chat",
		icon = if ArgoPartyExperimentation.getIsRenameEnabled() then if GetCanSeeChatTerminologyFunction() then FoundationModule.Enums.IconName.SpeechBubbleAlignCenter else FoundationModule.Enums.IconName.TwoPeopleSpeechBubble else {
			on = "icons/menu/2-person-with-bubble-on",
			off = "icons/menu/2-person-with-bubble"
		},
		badgeOffset = UDim2.new(0, 0, 0, 0)
	}
end