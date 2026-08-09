local parent = script:FindFirstAncestor("AppChat").Parent
local foundationModule = require(parent.Foundation)
local getFFlagIsSquadEnabled = require(parent.SharedFlags).GetFFlagIsSquadEnabled
local argoPartyExperimentation = require(parent.SocialExperiments).ArgoPartyExperimentation

return function() --[[ line: 10 ]]
	-- upvalues: argoPartyExperimentation (ref), getFFlagIsSquadEnabled (ref), foundationModule (ref)
	return {
		label = if argoPartyExperimentation.getIsRenameEnabled() or not getFFlagIsSquadEnabled() then "CommonUI.Features.Label.Chat" else "Feature.Squads.Label.Party",
		icon = if argoPartyExperimentation.getIsRenameEnabled() then foundationModule.Enums.IconName.SpeechBubbleAlignCenter else {
			on = "icons/menu/2-person-with-bubble-on",
			off = "icons/menu/2-person-with-bubble"
		},
		badgeOffset = UDim2.new(0, 0, 0, 0)
	}
end