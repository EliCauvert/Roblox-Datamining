local avatarEditorService = game:GetService("AvatarEditorService")
local playersService = game:GetService("Players")

return function(p0, p1) --[[ line: 10 | named "applyOutfit" ]]
	-- upvalues: playersService (ref), avatarEditorService (ref)
	avatarEditorService:NoPromptSaveAvatar(if game:GetEngineFeature("AsyncRenamesUsedInLuaApps") then playersService:GetHumanoidDescriptionFromOutfitIdAsync(p0) else playersService:GetHumanoidDescriptionFromOutfitId(p0), p1, {
		BodyColors = true,
		AvatarType = true,
		Scales = true,
		Assets = true
	})
	avatarEditorService.PromptSaveAvatarCompleted:Wait()
end