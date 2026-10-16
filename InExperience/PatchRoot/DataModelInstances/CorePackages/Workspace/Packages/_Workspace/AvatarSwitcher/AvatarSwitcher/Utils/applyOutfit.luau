local AvatarEditorService = game:GetService("AvatarEditorService")
local Players = game:GetService("Players")

return function(OutfitId, RigType) --[[ Line: 10 | Named "applyOutfit" ]]
	-- upvalues: Players (copy), AvatarEditorService (copy)
	AvatarEditorService:NoPromptSaveAvatar(Players:GetHumanoidDescriptionFromOutfitIdAsync(OutfitId), RigType, {
		BodyColors = true,
		AvatarType = true,
		Scales = true,
		Assets = true
	})
	AvatarEditorService.PromptSaveAvatarCompleted:Wait()
end