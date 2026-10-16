local AvatarExperienceRodux = script:FindFirstAncestor("AvatarExperienceRodux")
local Parent = AvatarExperienceRodux.Parent

return require(Parent.Rodux).createReducer(require(Parent.AvatarExperienceNavigation).AvatarRoute.AvatarRoute.new({}), {
	[require(AvatarExperienceRodux.Actions.SetAvatarSceneRoute).name] = function(_, p1) --[[ Line: 16 ]]
		return p1.avatarRoute
	end
})