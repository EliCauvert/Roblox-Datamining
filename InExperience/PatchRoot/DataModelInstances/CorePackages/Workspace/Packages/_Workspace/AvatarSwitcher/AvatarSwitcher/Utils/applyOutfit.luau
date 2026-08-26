local avatarEditorService = game:GetService("AvatarEditorService")
local playersService = game:GetService("Players")

return function(p1, p2)
	-- upvalues: playersService (ref), avatarEditorService (ref)
	avatarEditorService:NoPromptSaveAvatar(playersService:GetHumanoidDescriptionFromOutfitIdAsync(p1), p2, {
		BodyColors = true,
		AvatarType = true,
		Scales = true,
		Assets = true
	})
	avatarEditorService.PromptSaveAvatarCompleted:Wait()
end