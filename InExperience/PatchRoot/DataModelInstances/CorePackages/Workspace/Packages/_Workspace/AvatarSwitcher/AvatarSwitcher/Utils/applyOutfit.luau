local avatarEditorService = game:GetService("AvatarEditorService")
local playersService = game:GetService("Players")

return function(p0, p1) --[[ line: 10 | named "applyOutfit" ]]
	-- upvalues: playersService (ref), avatarEditorService (ref)
	avatarEditorService:NoPromptSaveAvatar(playersService:GetHumanoidDescriptionFromOutfitIdAsync(p0), p1, {
		BodyColors = true,
		AvatarType = true,
		Scales = true,
		Assets = true
	})
	avatarEditorService.PromptSaveAvatarCompleted:Wait()
end