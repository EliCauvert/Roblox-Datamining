local parent = script:FindFirstAncestor("AppChat").Parent
local foundationModule = require(parent.Foundation)
local getFFlagIsSquadEnabled = require(parent.SharedFlags).GetFFlagIsSquadEnabled
local argoPartyExperimentation = require(parent.SocialExperiments).ArgoPartyExperimentation
local universalAppPolicyModule = require(parent.UniversalAppPolicy)

return function()
	-- upvalues: universalAppPolicyModule (ref), argoPartyExperimentation (ref), getFFlagIsSquadEnabled (ref), foundationModule (ref)
	local getCanSeeChatTerminology = universalAppPolicyModule.getAppFeaturePolicies().getCanSeeChatTerminology
	
	return {
		label = if argoPartyExperimentation.getIsRenameEnabled() then if getCanSeeChatTerminology() then "CommonUI.Features.Label.Chat" else "Feature.Squads.Label.Party" elseif getFFlagIsSquadEnabled() then "Feature.Squads.Label.Party" else "CommonUI.Features.Label.Chat",
		icon = if argoPartyExperimentation.getIsRenameEnabled() then if getCanSeeChatTerminology() then foundationModule.Enums.IconName.SpeechBubbleAlignCenter else foundationModule.Enums.IconName.TwoPeopleSpeechBubble else {
			on = "icons/menu/2-person-with-bubble-on",
			off = "icons/menu/2-person-with-bubble"
		},
		badgeOffset = UDim2.new(0, 0, 0, 0)
	}
end