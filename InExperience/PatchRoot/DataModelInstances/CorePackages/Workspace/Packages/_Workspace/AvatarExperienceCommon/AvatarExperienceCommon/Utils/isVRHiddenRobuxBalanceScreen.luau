local config = {
	[require(script:FindFirstAncestor("AvatarExperienceCommon").Parent.AvatarExperienceNavigation).Enums.AvatarScreen.BackgroundGeneration] = true
}

return function(p1): boolean --[[ Line: 21 | Named "isVRHiddenRobuxBalanceScreen" ]]
	-- upvalues: config (copy)
	return p1 ~= nil and config[p1] == true
end