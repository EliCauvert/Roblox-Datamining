local parent = script:FindFirstAncestor("AppChat").Parent
local foundationModule = require(parent.Foundation)
local getFFlagIsSquadEnabled = require(parent.SharedFlags).GetFFlagIsSquadEnabled
local argoPartyExperimentation = require(parent.SocialExperiments).ArgoPartyExperimentation
local universalAppPolicyModule = require(parent.UniversalAppPolicy)

return function() --[[ line: 11 ]]
	-- upvalues: universalAppPolicyModule (ref), argoPartyExperimentation (ref), getFFlagIsSquadEnabled (ref), foundationModule (ref)
	return {
		label = if argoPartyExperimentation.getIsRenameEnabled() then if universalAppPolicyModule.getAppFeaturePolicies().getCanSeeChatTerminology() then "CommonUI.Features.Label.Chat" else "Feature.Squads.Label.Party" elseif getFFlagIsSquadEnabled() then "Feature.Squads.Label.Party" else "CommonUI.Features.Label.Chat",
		icon = if argoPartyExperimentation.getIsRenameEnabled() then foundationModule.Enums.IconName.SpeechBubbleAlignCenter else {
			on = "icons/menu/2-person-with-bubble-on",
			off = "icons/menu/2-person-with-bubble"
		},
		badgeOffset = UDim2.new(0, 0, 0, 0)
	}
end