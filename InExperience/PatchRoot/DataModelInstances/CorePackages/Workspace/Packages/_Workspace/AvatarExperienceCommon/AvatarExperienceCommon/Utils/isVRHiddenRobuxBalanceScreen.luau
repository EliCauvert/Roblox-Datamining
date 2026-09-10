local t = {
	[require(script:FindFirstAncestor("AvatarExperienceCommon").Parent.AvatarExperienceNavigation).Enums.AvatarScreen.BackgroundGeneration] = true
}

return function(p1)
	-- upvalues: t (ref)
	return p1 ~= nil and t[p1] == true
end