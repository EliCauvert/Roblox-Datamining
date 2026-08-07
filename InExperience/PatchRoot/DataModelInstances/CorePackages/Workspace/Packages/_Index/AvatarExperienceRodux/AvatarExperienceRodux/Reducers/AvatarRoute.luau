local avatarExperienceRodux = script:FindFirstAncestor("AvatarExperienceRodux")
local parent = avatarExperienceRodux.Parent

return require(parent.Rodux).createReducer(require(parent.AvatarExperienceNavigation).AvatarRoute.AvatarRoute.new({}), {
	[require(avatarExperienceRodux.Actions.SetAvatarSceneRoute).name] = function(_, p0) --[[ line: 16 ]]
		return p0.avatarRoute
	end
})