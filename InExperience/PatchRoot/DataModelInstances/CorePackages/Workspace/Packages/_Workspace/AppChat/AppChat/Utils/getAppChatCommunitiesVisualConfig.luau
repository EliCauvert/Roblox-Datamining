local GetFFlagUseCommunitiesTranslationFunction = require(script:FindFirstAncestor("AppChat").Parent.SharedFlags).GetFFlagUseCommunitiesTranslation

return function()
	-- upvalues: GetFFlagUseCommunitiesTranslationFunction (copy)
	return {
		icon = "icons/menu/groups",
		iconLarge = "icons/menu/groups_large",
		label = if GetFFlagUseCommunitiesTranslationFunction() then "Feature.SocialTab.Label.Groups" else "CommonUI.Features.Label.sGroups"
	}
end