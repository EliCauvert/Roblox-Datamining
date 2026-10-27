local Parent = script:FindFirstAncestor("AppChat").Parent
local FoundationModule = require(Parent.Foundation)
local UniversalAppPolicyModule = require(Parent.UniversalAppPolicy)

return function()
	-- upvalues: UniversalAppPolicyModule (copy), FoundationModule (copy)
	local GetCanSeeChatTerminologyFunction = UniversalAppPolicyModule.getAppFeaturePolicies().getCanSeeChatTerminology
	
	return {
		label = if GetCanSeeChatTerminologyFunction() then "CommonUI.Features.Label.Chat" else "Feature.Squads.Label.Party",
		icon = if GetCanSeeChatTerminologyFunction() then FoundationModule.Enums.IconName.SpeechBubbleAlignCenter else FoundationModule.Enums.IconName.TwoPeopleSpeechBubble,
		badgeOffset = UDim2.new(0, 0, 0, 0)
	}
end