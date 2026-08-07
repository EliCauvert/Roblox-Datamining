local getFFlagUseCommunitiesTranslation = require(script:FindFirstAncestor("AppChat").Parent.SharedFlags).GetFFlagUseCommunitiesTranslation

return function() --[[ line: 13 ]]
	-- upvalues: getFFlagUseCommunitiesTranslation (ref)
	return {
		icon = "icons/menu/groups",
		iconLarge = "icons/menu/groups_large",
		label = if getFFlagUseCommunitiesTranslation() then "Feature.SocialTab.Label.Groups" else "CommonUI.Features.Label.sGroups"
	}
end